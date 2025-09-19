# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy source code
COPY . .

# Expose Cloud Run port
ENV PORT=8080
EXPOSE 8080

# Run the app
CMD ["npm", "start"]

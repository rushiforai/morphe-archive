import path from "path"
import tailwindcss from "@tailwindcss/vite"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      "@": path.resolve(import.meta.dirname, "./src"),
    },
  },
  server: {
    // Development only (PRD-2 §55). The frontend always requests relative
    // `/api/...` URLs; this proxy forwards them to the local Go backend.
    // This is the ONLY place in `web/` where the backend port is allowed —
    // `web/src/` must never contain it.
    proxy: {
      "/api": {
        target: "http://127.0.0.1:43121",
        changeOrigin: true,
      },
    },
  },
})

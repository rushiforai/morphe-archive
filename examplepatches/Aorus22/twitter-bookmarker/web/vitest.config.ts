import path from "path"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vitest/config"

/**
 * Vitest configuration (Phase 4 test infrastructure).
 *
 * Kept separate from `vite.config.ts` on purpose: the dev/build config imports
 * `defineConfig` from `vite` and must not carry a `test` block, while this file
 * imports it from `vitest/config`.
 *
 * The suite runs headless in jsdom. Every test mocks `fetch` (no network, no
 * server, and never the operator-owned backend on its dev port).
 */
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@": path.resolve(import.meta.dirname, "./src"),
    },
  },
  test: {
    environment: "jsdom",
    setupFiles: ["./src/test/setup.ts"],
    include: ["src/**/*.test.{ts,tsx}"],
  },
})

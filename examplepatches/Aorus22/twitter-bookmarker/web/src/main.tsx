import { StrictMode } from "react"
import { createRoot } from "react-dom/client"
import { RouterProvider } from "react-router-dom"

import "./index.css"
import { ThemeProvider } from "@/app/theme-provider"
import { router } from "@/app/routes"
import { TooltipProvider } from "@/components/ui/tooltip"

const container = document.getElementById("root")

if (!container) {
  throw new Error("Root container #root was not found in index.html")
}

createRoot(container).render(
  <StrictMode>
    <ThemeProvider>
      <TooltipProvider>
        <RouterProvider router={router} />
      </TooltipProvider>
    </ThemeProvider>
  </StrictMode>
)

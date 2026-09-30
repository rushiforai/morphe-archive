import { Monitor, Moon, Sun } from "lucide-react"

import { Button } from "@/components/ui/button"
import { useTheme, type Theme } from "@/hooks/use-theme"

const ORDER: readonly Theme[] = ["light", "dark", "system"]

const LABELS: Record<Theme, string> = {
  light: "Light",
  dark: "Dark",
  system: "System",
}

function nextTheme(theme: Theme): Theme {
  const index = ORDER.indexOf(theme)
  return ORDER[(index + 1) % ORDER.length] ?? "system"
}

/**
 * Cycles light → dark → system (PRD-2 §64). `system` follows the OS setting.
 *
 * A real `<button>` with an accessible name and a visible tooltip-ish title, so
 * it is keyboard reachable and screen-reader announced.
 */
export function ThemeToggle() {
  const { theme, resolvedTheme, setTheme } = useTheme()
  const next = nextTheme(theme)

  const Icon =
    theme === "system" ? Monitor : resolvedTheme === "dark" ? Moon : Sun

  return (
    <Button
      type="button"
      variant="ghost"
      size="icon"
      onClick={() => setTheme(next)}
      title={`Theme: ${LABELS[theme]} — switch to ${LABELS[next]}`}
      aria-label={`Theme: ${LABELS[theme]}. Switch to ${LABELS[next]} theme.`}
      data-theme-preference={theme}
      data-theme-resolved={resolvedTheme}
    >
      <Icon aria-hidden="true" />
    </Button>
  )
}

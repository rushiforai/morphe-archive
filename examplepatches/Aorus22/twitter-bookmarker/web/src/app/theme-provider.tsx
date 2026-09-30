/* eslint-disable react-refresh/only-export-components */
import * as React from "react"

/** Theme preference (PRD-2 §64). `system` is the default. */
export type Theme = "light" | "dark" | "system"

/** The theme actually applied to the document — never `system`. */
export type ResolvedTheme = "light" | "dark"

/**
 * localStorage key holding the user's preference.
 *
 * NOTE: `index.html` repeats this literal in a tiny pre-paint script that
 * avoids a flash of the wrong theme on reload. Keep the two in sync.
 */
export const THEME_STORAGE_KEY = "tw-bookmarker-theme"

const SYSTEM_THEME_QUERY = "(prefers-color-scheme: dark)"
const THEME_VALUES: readonly Theme[] = ["light", "dark", "system"]

export interface ThemeProviderState {
  /** The stored preference, including `system`. */
  theme: Theme
  /** The effective theme after resolving `system` against the OS setting. */
  resolvedTheme: ResolvedTheme
  /** Persist and apply a new preference. */
  setTheme: (theme: Theme) => void
}

export const ThemeProviderContext = React.createContext<
  ThemeProviderState | undefined
>(undefined)

function isTheme(value: unknown): value is Theme {
  return (
    typeof value === "string" &&
    (THEME_VALUES as readonly string[]).includes(value)
  )
}

/** Resolve `prefers-color-scheme` at this instant. */
export function getSystemTheme(): ResolvedTheme {
  if (
    typeof window === "undefined" ||
    typeof window.matchMedia !== "function"
  ) {
    return "light"
  }

  return window.matchMedia(SYSTEM_THEME_QUERY).matches ? "dark" : "light"
}

function readStoredTheme(storageKey: string, fallback: Theme): Theme {
  if (typeof window === "undefined") {
    return fallback
  }

  try {
    const stored = window.localStorage.getItem(storageKey)
    return isTheme(stored) ? stored : fallback
  } catch {
    // localStorage can throw in private mode / with cookies blocked.
    return fallback
  }
}

export interface ThemeProviderProps {
  children: React.ReactNode
  /** Used when nothing valid is stored. Defaults to `system` (PRD-2 §64). */
  defaultTheme?: Theme
  /** Override the persistence key (tests). */
  storageKey?: string
}

/**
 * Light / dark / system theme provider.
 *
 * - defaults to `system` and persists the choice to localStorage
 * - toggles the `dark` class on `<html>`, which is what the stylesheet's
 *   `dark` variant (`.dark *`) keys on
 * - reacts to OS changes while — and only while — the mode is `system`
 */
export function ThemeProvider({
  children,
  defaultTheme = "system",
  storageKey = THEME_STORAGE_KEY,
}: ThemeProviderProps) {
  const [theme, setThemeState] = React.useState<Theme>(() =>
    readStoredTheme(storageKey, defaultTheme)
  )
  // Bumped when the OS preference changes so the render below re-reads it.
  const [, resyncSystemTheme] = React.useReducer((n: number) => n + 1, 0)

  // Follow the OS preference only in `system` mode; detach otherwise.
  React.useEffect(() => {
    if (theme !== "system" || typeof window === "undefined") {
      return undefined
    }

    const mediaQuery = window.matchMedia(SYSTEM_THEME_QUERY)
    const handleChange = () => {
      resyncSystemTheme()
    }

    mediaQuery.addEventListener("change", handleChange)

    return () => {
      mediaQuery.removeEventListener("change", handleChange)
    }
  }, [theme])

  // Read the OS preference during render rather than caching it in state: that
  // way switching back to `system` after the OS changed — which happens with no
  // listener attached — always resolves to the current value, with no
  // setState-in-effect cascade.
  const resolvedTheme: ResolvedTheme =
    theme === "system" ? getSystemTheme() : theme

  // useLayoutEffect so the class lands before the browser paints.
  React.useLayoutEffect(() => {
    const root = document.documentElement
    root.classList.toggle("dark", resolvedTheme === "dark")
    root.classList.toggle("light", resolvedTheme === "light")
    root.style.colorScheme = resolvedTheme
  }, [resolvedTheme])

  const setTheme = React.useCallback(
    (nextTheme: Theme) => {
      setThemeState(nextTheme)
      try {
        window.localStorage.setItem(storageKey, nextTheme)
      } catch {
        // Persistence is best-effort; the in-memory theme still applies.
      }
    },
    [storageKey]
  )

  const value = React.useMemo<ThemeProviderState>(
    () => ({ theme, resolvedTheme, setTheme }),
    [theme, resolvedTheme, setTheme]
  )

  return (
    <ThemeProviderContext.Provider value={value}>
      {children}
    </ThemeProviderContext.Provider>
  )
}

import * as React from "react"

import {
  ThemeProviderContext,
  type ThemeProviderState,
} from "@/app/theme-provider"

export type { ResolvedTheme, Theme } from "@/app/theme-provider"

/**
 * Read the active theme state.
 *
 * @throws when used outside {@link ThemeProvider}.
 */
export function useTheme(): ThemeProviderState {
  const context = React.useContext(ThemeProviderContext)

  if (context === undefined) {
    throw new Error("useTheme must be used within a ThemeProvider")
  }

  return context
}

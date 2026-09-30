import { render, screen } from "@testing-library/react"
import { MemoryRouter, Route, Routes } from "react-router-dom"
import { beforeEach, describe, expect, it, vi } from "vitest"

import { AppShell } from "./app-shell"
import { ThemeProvider } from "./theme-provider"

/**
 * HARD-03: the app-shell wordmark must never truncate mid-word.
 *
 * jsdom has no layout engine and does not apply the Tailwind stylesheet, so the
 * *computed* `display` of the wordmark cannot be asserted here — the real-browser
 * harness (`scripts/check-web-acceptance.sh`, "wordmark" checks) asserts that at
 * 390px the wordmark is `display: none` and at 1440px it is visible. This test
 * pins the two things jsdom can prove: the responsive-hidden class contract and
 * the brand link's accessible name when the wordmark is hidden.
 */

// jsdom has no `matchMedia`, and `ThemeProvider` attaches a system-theme
// listener through it. A local stub keeps the fallback-path tests in
// `use-media-query.test.tsx` untouched (`vi.unstubAllGlobals` runs in setup).
function stubMatchMedia() {
  vi.stubGlobal(
    "matchMedia",
    vi.fn(() => ({
      matches: false,
      media: "(prefers-color-scheme: dark)",
      onchange: null,
      addEventListener: () => {},
      removeEventListener: () => {},
      addListener: () => {},
      removeListener: () => {},
      dispatchEvent: () => false,
    }))
  )
}

function renderShell() {
  return render(
    <ThemeProvider>
      <MemoryRouter initialEntries={["/"]}>
        <Routes>
          <Route path="/" element={<AppShell />}>
            <Route index element={<p>home</p>} />
          </Route>
        </Routes>
      </MemoryRouter>
    </ThemeProvider>
  )
}

describe("AppShell — brand and wordmark (HARD-03)", () => {
  beforeEach(() => {
    stubMatchMedia()
  })

  it("hides the wordmark below sm and shows it from sm up, with the logo kept", () => {
    renderShell()

    const wordmark = screen.getByTestId("app-wordmark")
    // Hidden at narrow widths (the `Tw…` truncation defect), visible from `sm`.
    expect(wordmark).toHaveClass("hidden")
    expect(wordmark).toHaveClass("sm:inline")
    // The full words are in the DOM — the fix is responsive visibility, not
    // shortening the name.
    expect(wordmark).toHaveTextContent("Twitter Bookmarker")

    // The logo stays at every width.
    const brand = screen.getByRole("link", { name: "Twitter Bookmarker" })
    expect(brand.querySelector("svg")).not.toBeNull()
  })

  it("keeps an accessible name on the brand link while the wordmark is hidden", () => {
    renderShell()

    const brand = screen.getByRole("link", { name: "Twitter Bookmarker" })
    expect(brand).toHaveAttribute("aria-label", "Twitter Bookmarker")
    expect(brand).toHaveAttribute("href", "/")
  })

  it("still exposes the primary navigation and the theme control", () => {
    renderShell()

    expect(
      screen.getByRole("navigation", { name: "Primary" })
    ).toBeInTheDocument()
    expect(screen.getByRole("link", { name: "Home" })).toBeInTheDocument()
    expect(
      screen.getByRole("link", { name: "Collections" })
    ).toBeInTheDocument()
    expect(screen.getByRole("button", { name: /^Theme:/ })).toBeInTheDocument()
  })
})

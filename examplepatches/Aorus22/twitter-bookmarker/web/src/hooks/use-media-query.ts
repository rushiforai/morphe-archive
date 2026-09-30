import { useEffect, useState } from "react"

/**
 * Breakpoint detection for the Filter control (PRD-2 §30/§66, DISC-02).
 *
 * `md` is Tailwind's 768px boundary: at or above it the Filter control opens a
 * Popover, below it a Sheet/Drawer. `window.matchMedia` is used when the
 * environment provides it; otherwise the same boundary is read from
 * `window.innerWidth`, because jsdom (the test environment) has no
 * `matchMedia`. When there is no `window` at all the desktop surface is the
 * safe default — desktop is the primary target (PRD-2 §66).
 */

export const DESKTOP_MEDIA_QUERY = "(min-width: 768px)"
export const DESKTOP_MIN_WIDTH = 768

function readIsDesktop(): boolean {
  if (typeof window === "undefined") {
    return true
  }

  if (typeof window.matchMedia === "function") {
    return window.matchMedia(DESKTOP_MEDIA_QUERY).matches
  }

  return Number.isFinite(window.innerWidth)
    ? window.innerWidth >= DESKTOP_MIN_WIDTH
    : true
}

/** True while the viewport is at or above the `md` breakpoint. */
export function useIsDesktop(): boolean {
  const [isDesktop, setIsDesktop] = useState(readIsDesktop)

  useEffect(() => {
    if (typeof window.matchMedia === "function") {
      const mediaQuery = window.matchMedia(DESKTOP_MEDIA_QUERY)
      const onChange = () => {
        setIsDesktop(mediaQuery.matches)
      }

      mediaQuery.addEventListener?.("change", onChange)
      return () => {
        mediaQuery.removeEventListener?.("change", onChange)
      }
    }

    const onResize = () => {
      setIsDesktop(readIsDesktop())
    }

    window.addEventListener("resize", onResize)
    return () => {
      window.removeEventListener("resize", onResize)
    }
  }, [])

  return isDesktop
}

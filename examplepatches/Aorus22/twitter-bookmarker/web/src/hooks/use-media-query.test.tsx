import { act, renderHook } from "@testing-library/react"
import { afterEach, describe, expect, it, vi } from "vitest"

import { useIsDesktop } from "./use-media-query"

/**
 * DISC-02 / PRD-2 §66 — the Filter control's breakpoint decision.
 *
 * jsdom has no `matchMedia`, so the fallback reads `window.innerWidth`; a test
 * also installs a `matchMedia` stub to prove the preferred path and its change
 * event are wired.
 */

const ORIGINAL_INNER_WIDTH = window.innerWidth
const ORIGINAL_MATCH_MEDIA = window.matchMedia

function setInnerWidth(width: number) {
  Object.defineProperty(window, "innerWidth", {
    value: width,
    writable: true,
    configurable: true,
  })
}

function installMatchMedia(matches: boolean) {
  const listeners = new Set<() => void>()
  const mediaQueryList = {
    matches,
    media: "(min-width: 768px)",
    onchange: null,
    addEventListener: (_type: string, listener: () => void) => {
      listeners.add(listener)
    },
    removeEventListener: (_type: string, listener: () => void) => {
      listeners.delete(listener)
    },
    addListener: () => {},
    removeListener: () => {},
    dispatchEvent: () => false,
  }

  Object.defineProperty(window, "matchMedia", {
    configurable: true,
    writable: true,
    value: vi.fn(() => mediaQueryList),
  })

  return {
    mediaQueryList,
    emitChange: () => {
      for (const listener of listeners) {
        listener()
      }
    },
  }
}

afterEach(() => {
  setInnerWidth(ORIGINAL_INNER_WIDTH)
  Object.defineProperty(window, "matchMedia", {
    configurable: true,
    writable: true,
    value: ORIGINAL_MATCH_MEDIA,
  })
})

describe("useIsDesktop — innerWidth fallback (no matchMedia)", () => {
  it("is desktop at 1024px and narrow at 400px", () => {
    setInnerWidth(1024)
    const { result } = renderHook(() => useIsDesktop())
    expect(result.current).toBe(true)
  })

  it("treats a viewport below the 768px md breakpoint as narrow", () => {
    setInnerWidth(400)
    const { result } = renderHook(() => useIsDesktop())
    expect(result.current).toBe(false)
  })

  it("updates on resize", () => {
    setInnerWidth(400)
    const { result } = renderHook(() => useIsDesktop())
    expect(result.current).toBe(false)

    act(() => {
      setInnerWidth(1280)
      window.dispatchEvent(new Event("resize"))
    })

    expect(result.current).toBe(true)
  })
})

describe("useIsDesktop — matchMedia path", () => {
  it("follows the media query and its change event", () => {
    const { mediaQueryList, emitChange } = installMatchMedia(true)
    const { result } = renderHook(() => useIsDesktop())
    expect(result.current).toBe(true)

    act(() => {
      mediaQueryList.matches = false
      emitChange()
    })

    expect(result.current).toBe(false)
  })

  it("starts narrow when the query does not match", () => {
    installMatchMedia(false)
    const { result } = renderHook(() => useIsDesktop())
    expect(result.current).toBe(false)
  })
})

import { afterEach, describe, expect, it, vi } from "vitest"

import {
  QUERY_CHANGE_SCROLL_TOP,
  readScrollY,
  restoreScrollY,
  scrollNearTop,
} from "./scroll"

/**
 * LIGHT-06 scroll contract (PRD-2 §77): the query-change reset stays where it
 * was, and the lightbox's capture/restore pair puts the gallery back exactly
 * where the user left it — a no-op when nothing moved.
 *
 * jsdom's `scrollY` is a settable accessor (it does not update on `scrollTo`),
 * so a test can plant an offset and observe whether the helper writes one back.
 */

afterEach(() => {
  window.scrollY = 0
})

describe("readScrollY (LIGHT-06)", () => {
  it("reads the planted offset", () => {
    window.scrollY = 812

    expect(readScrollY()).toBe(812)
  })

  it("normalises a non-finite offset to zero", () => {
    window.scrollY = Number.NaN

    expect(readScrollY()).toBe(0)
  })
})

describe("restoreScrollY (LIGHT-06)", () => {
  it("writes the captured offset back when the page drifted", () => {
    const scrollTo = vi.spyOn(window, "scrollTo")
    window.scrollY = 0

    restoreScrollY(640)

    expect(scrollTo).toHaveBeenCalledWith({
      top: 640,
      left: 0,
      behavior: "auto",
    })
  })

  it("is a no-op when the offset is already correct", () => {
    const scrollTo = vi.spyOn(window, "scrollTo")
    window.scrollY = 640

    restoreScrollY(640)

    expect(scrollTo).not.toHaveBeenCalled()
  })

  it("ignores a nonsense captured offset instead of scrolling to it", () => {
    const scrollTo = vi.spyOn(window, "scrollTo")

    restoreScrollY(Number.NaN)
    restoreScrollY(-1)

    expect(scrollTo).not.toHaveBeenCalled()
  })
})

describe("scrollNearTop (DISC-08, unchanged by Phase 8)", () => {
  it("still scrolls a query change to the very top", () => {
    const scrollTo = vi.spyOn(window, "scrollTo")

    scrollNearTop()

    expect(scrollTo).toHaveBeenCalledWith({
      top: QUERY_CHANGE_SCROLL_TOP,
      left: 0,
      behavior: "auto",
    })
  })
})

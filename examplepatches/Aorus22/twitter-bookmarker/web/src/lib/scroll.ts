/**
 * Scroll behaviour (PRD-2 §76/§77, DISC-08, LIGHT-06).
 *
 * Two distinct contracts live here:
 *
 *   1. a **query change** clears the pages and scrolls near the top (DISC-08);
 *   2. closing the **lightbox** puts the gallery back exactly where it was.
 *
 * Keeping both in a tiny module makes them documented, testable behaviours
 * rather than inline side effects.
 */

/** The target the query-change scroll moves to. */
export const QUERY_CHANGE_SCROLL_TOP = 0

/**
 * Scroll the window near the top. Guarded so a non-browser or layout-less
 * environment (jsdom) without `scrollTo` cannot throw.
 */
export function scrollNearTop(): void {
  if (typeof window === "undefined" || typeof window.scrollTo !== "function") {
    return
  }

  window.scrollTo({ top: QUERY_CHANGE_SCROLL_TOP, left: 0, behavior: "auto" })
}

/**
 * The current vertical scroll offset, or `0` where it cannot be read (a
 * non-browser environment, or a jsdom test that never stubbed `scrollY`).
 */
export function readScrollY(): number {
  if (typeof window === "undefined") {
    return 0
  }
  const offset = window.scrollY
  return Number.isFinite(offset) ? offset : 0
}

/**
 * Put the window back at a previously captured offset (LIGHT-06).
 *
 * A Radix Dialog locks body scroll while it is open; the lock itself does not
 * move the offset, but a browser that clamps a locked body (mobile Safari is
 * the classic case) would otherwise leave the gallery at the top when the
 * dialog closes. This is the compensating write, and it is a **no-op when the
 * offset is already correct** so it can be called unconditionally without
 * stealing scroll from a user who moved while the dialog was closing.
 */
export function restoreScrollY(offset: number): void {
  if (typeof window === "undefined" || typeof window.scrollTo !== "function") {
    return
  }
  if (!Number.isFinite(offset) || offset < 0) {
    return
  }
  if (readScrollY() === offset) {
    return
  }

  window.scrollTo({ top: offset, left: 0, behavior: "auto" })
}

import { act, render, screen } from "@testing-library/react"
import { describe, expect, it } from "vitest"

import { GalleryMasonry } from "@/components/gallery/gallery-masonry"
import { MockResizeObserver } from "@/test/resize-observer"

/**
 * The responsive masonry column count (PRD-2 §21/§66, HARD-03).
 *
 * These pin the bug that only a real browser could reveal: the hook used to
 * observe the very `<ul>` it sizes with `max-width`, so the observed width was
 * `min(available, n*292 + (n-1)*32)`. Growing the window could not widen the
 * `<ul>` (its own cap held it at the old width), no resize fired, and the count
 * deadlocked — a collection loaded in a narrow window stayed at 3 columns when
 * maximised until a full reload.
 */

/** jsdom has no layout, so a measured width has to be supplied explicitly. */
function setClientWidth(element: Element, width: number): void {
  Object.defineProperty(element, "clientWidth", {
    configurable: true,
    get: () => width,
  })
}

function renderMasonry() {
  const view = render(
    <GalleryMasonry>
      <article data-testid="card-a">a</article>
      <article data-testid="card-b">b</article>
    </GalleryMasonry>
  )
  // The observed element is the uncapped wrapper that owns the <ul>.
  const wrapper = view.container.firstElementChild
  if (wrapper === null) {
    throw new Error("masonry wrapper missing")
  }

  return { view, wrapper, list: screen.getByTestId("gallery-masonry") }
}

/**
 * Push a width into the hook and flush the resulting resize callback. The
 * callback calls `setState`, so it has to run inside `act` for React to commit
 * the re-render before the assertion reads the DOM.
 */
function resizeTo(wrapper: Element, width: number): void {
  setClientWidth(wrapper, width)
  act(() => {
    MockResizeObserver.latest()?.emit()
  })
}

describe("GalleryMasonry — responsive column count", () => {
  it("observes the uncapped wrapper, never the max-width-capped list", () => {
    const { wrapper, list } = renderMasonry()

    const observed = MockResizeObserver.latest()?.observedTargets ?? []
    expect(observed).toContain(wrapper)
    expect(observed).not.toContain(list)

    // The list carries the cap; the observed element must not.
    expect(list.style.maxWidth).not.toBe("")
    expect(wrapper.getAttribute("style")).toBeNull()
  })

  it("adds columns when the available width grows (the deadlock regression)", () => {
    const { wrapper, list } = renderMasonry()

    resizeTo(wrapper, 940)
    expect(list).toHaveAttribute("data-columns", "3")

    // 1264 is exactly 4*292 + 3*32, the design's four-column content width.
    resizeTo(wrapper, 1264)
    expect(list).toHaveAttribute("data-columns", "4")
  })

  it("removes columns when the available width shrinks", () => {
    const { wrapper, list } = renderMasonry()

    resizeTo(wrapper, 1264)
    expect(list).toHaveAttribute("data-columns", "4")

    resizeTo(wrapper, 292)
    expect(list).toHaveAttribute("data-columns", "1")
  })

  it("follows the container, not the viewport", () => {
    const { wrapper, list } = renderMasonry()

    // A narrow container inside a wide window must still yield one column;
    // measuring window.innerWidth here would report several.
    resizeTo(wrapper, 292)
    expect(list).toHaveAttribute("data-columns", "1")
  })

  it("keeps the cap in step with the count so a card never overflows", () => {
    const { wrapper, list } = renderMasonry()

    resizeTo(wrapper, 1264)
    expect(list.style.maxWidth).toBe("1264px")
  })

  it("stops observing once unmounted", () => {
    const { view, wrapper } = renderMasonry()
    const observer = MockResizeObserver.latest()

    resizeTo(wrapper, 1264)
    expect(observer?.observedTargets).toContain(wrapper)

    view.unmount()
    expect(observer?.observedTargets).toEqual([])
  })
})

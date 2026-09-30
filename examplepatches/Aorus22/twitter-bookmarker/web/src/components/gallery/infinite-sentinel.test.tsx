import { act, render, screen } from "@testing-library/react"
import { describe, expect, it, vi } from "vitest"

import { InfiniteSentinel, SENTINEL_ROOT_MARGIN } from "./infinite-sentinel"
import { MockIntersectionObserver } from "@/test/intersection-observer"

/**
 * SCROLL-01/SCROLL-04 component contract: the sentinel is a decorative,
 * unannounced marker that observes itself with a generous rootMargin and asks
 * for the next page when it nears the viewport. The observer lifecycle is
 * controlled through the jsdom stub installed in `src/test/setup.ts`.
 */

describe("InfiniteSentinel — decorative trigger (SCROLL-01, a11y)", () => {
  it("renders an empty aria-hidden marker, never content", () => {
    render(<InfiniteSentinel onIntersect={() => {}} />)

    const sentinel = screen.getByTestId("infinite-sentinel")
    expect(sentinel).toHaveAttribute("aria-hidden", "true")
    expect(sentinel).toBeEmptyDOMElement()
  })

  it("observes one target with the 600px-before-the-bottom rootMargin", () => {
    render(<InfiniteSentinel onIntersect={() => {}} />)

    const observer = MockIntersectionObserver.latest()
    expect(observer).toBeDefined()
    expect(observer?.rootMargin).toBe(SENTINEL_ROOT_MARGIN)
    expect(SENTINEL_ROOT_MARGIN).toContain("600px")
    expect(observer?.observedCount).toBe(1)
  })

  it("fires onIntersect for an intersecting entry", () => {
    const onIntersect = vi.fn()
    render(<InfiniteSentinel onIntersect={onIntersect} />)

    act(() => {
      MockIntersectionObserver.latest()?.emit(true)
    })

    expect(onIntersect).toHaveBeenCalledTimes(1)
  })

  it("ignores a non-intersecting entry", () => {
    const onIntersect = vi.fn()
    render(<InfiniteSentinel onIntersect={onIntersect} />)

    act(() => {
      MockIntersectionObserver.latest()?.emit(false)
    })

    expect(onIntersect).not.toHaveBeenCalled()
  })

  it("delivers every intersecting entry in a batch", () => {
    const onIntersect = vi.fn()
    render(<InfiniteSentinel onIntersect={onIntersect} />)

    const observer = MockIntersectionObserver.latest()
    expect(observer).toBeDefined()
    act(() => {
      observer?.emit(true)
      observer?.emit(true)
    })

    expect(onIntersect).toHaveBeenCalledTimes(2)
  })

  it("stops observing while disabled and resumes when re-enabled", () => {
    const onIntersect = vi.fn()
    const { rerender } = render(<InfiniteSentinel onIntersect={onIntersect} />)
    const observer = MockIntersectionObserver.latest()
    expect(observer?.observedCount).toBe(1)

    rerender(<InfiniteSentinel onIntersect={onIntersect} disabled />)

    expect(observer?.observedCount).toBe(0)
    act(() => {
      observer?.emit(true)
    })
    expect(onIntersect).not.toHaveBeenCalled()
  })

  it("never re-observes when the callback identity changes", () => {
    const first = vi.fn()
    const second = vi.fn()
    const { rerender } = render(<InfiniteSentinel onIntersect={first} />)
    const instancesAfterMount = MockIntersectionObserver.instances.length

    rerender(<InfiniteSentinel onIntersect={second} />)

    expect(MockIntersectionObserver.instances.length).toBe(instancesAfterMount)
    act(() => {
      MockIntersectionObserver.latest()?.emit(true)
    })
    expect(first).not.toHaveBeenCalled()
    expect(second).toHaveBeenCalledTimes(1)
  })
})

import { useEffect, useRef } from "react"

import { cn } from "@/lib/utils"

/**
 * Infinite-scroll sentinel (PRD-2 §34, SCROLL-01).
 *
 * A zero-height, **decorative** marker rendered after the last card. When it
 * nears the viewport the observer fires `onIntersect`, which asks for the next
 * page. The generous {@link SENTINEL_ROOT_MARGIN} starts that request ~600px
 * before the user actually reaches the bottom, so the next page is usually
 * already there.
 *
 * The marker carries `aria-hidden="true"` and no content: it is a scroll trigger,
 * never page content a screen reader should announce (the bottom loader is the
 * announced affordance, design spec §6).
 *
 * `onIntersect` is read through a ref, so re-rendering the page (a new page
 * appending, a filter changing) never recreates the observer nor captures a
 * stale callback. The observer is disconnected whenever `disabled` is true —
 * at the end of the list, no request can be issued.
 */

/** How far before the viewport bottom the next page starts loading. */
export const SENTINEL_ROOT_MARGIN = "600px 0px"

export interface InfiniteSentinelProps {
  /** Called whenever the sentinel enters (or is inside) the root margin. */
  onIntersect: () => void
  /** Stop observing without unmounting (used when `hasMore` is false). */
  disabled?: boolean
  rootMargin?: string
  className?: string
}

export function InfiniteSentinel({
  onIntersect,
  disabled = false,
  rootMargin = SENTINEL_ROOT_MARGIN,
  className,
}: InfiniteSentinelProps) {
  const sentinelRef = useRef<HTMLDivElement>(null)
  const onIntersectRef = useRef(onIntersect)

  useEffect(() => {
    onIntersectRef.current = onIntersect
  }, [onIntersect])

  useEffect(() => {
    const node = sentinelRef.current
    if (disabled || node === null) {
      return
    }
    // Guarded for the test/SSR environments that lack the API entirely; the
    // suite installs a controllable stub in `src/test/setup.ts`.
    if (typeof IntersectionObserver !== "function") {
      return
    }

    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            onIntersectRef.current()
          }
        }
      },
      { rootMargin }
    )

    observer.observe(node)
    return () => {
      observer.disconnect()
    }
  }, [disabled, rootMargin])

  return (
    <div
      ref={sentinelRef}
      data-testid="infinite-sentinel"
      aria-hidden="true"
      className={cn("h-px w-full", className)}
    />
  )
}

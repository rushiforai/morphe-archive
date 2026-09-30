import { useLayoutEffect, useState, type RefObject } from "react"

import { columnsForWidth } from "@/lib/masonry"

/**
 * Responsive masonry column count (PRD-2 §21/§66).
 *
 * The breakpoints are exact-fit on the **available content width**
 * ({@link columnsForWidth}), so the masonry measures its own container rather
 * than the viewport: the shell's gutters and `1312px` content cap are therefore
 * already accounted for and a 292-wide card can never overflow its column.
 *
 * Measurement order:
 *   1. the observed element's `clientWidth`;
 *   2. `window.innerWidth` when there is no layout engine (jsdom) or before the
 *      first layout pass.
 *
 * Recomputed on `resize` and, where available, a `ResizeObserver`.
 */

function measureViewportWidth(): number {
  if (typeof window !== "undefined" && window.innerWidth > 0) {
    return window.innerWidth
  }

  return 0
}

function measureWidth(containerRef?: RefObject<HTMLElement | null>): number {
  const element = containerRef?.current
  if (element !== null && element !== undefined && element.clientWidth > 0) {
    return element.clientWidth
  }

  return measureViewportWidth()
}

export function useMasonryColumns(
  containerRef?: RefObject<HTMLElement | null>
): number {
  // The initial value deliberately uses the viewport only: a ref must not be
  // read during render, so the element is measured in the effect below (and the
  // two values agree wherever there is no layout engine).
  const [width, setWidth] = useState(() => measureViewportWidth())

  // `useLayoutEffect`, not `useEffect`: the first render can only guess from the
  // viewport, and the breakpoints are calibrated for the *content* width, so a
  // wide window would paint one frame with too many columns before correcting.
  // Measuring before paint keeps the first painted layout correct.
  useLayoutEffect(() => {
    const update = () => {
      setWidth(measureWidth(containerRef))
    }

    update()
    window.addEventListener("resize", update)

    const observer =
      typeof ResizeObserver === "undefined"
        ? undefined
        : new ResizeObserver(update)
    const element = containerRef?.current
    if (observer !== undefined && element !== null && element !== undefined) {
      observer.observe(element)
    }

    return () => {
      window.removeEventListener("resize", update)
      observer?.disconnect()
    }
  }, [containerRef])

  return columnsForWidth(width)
}

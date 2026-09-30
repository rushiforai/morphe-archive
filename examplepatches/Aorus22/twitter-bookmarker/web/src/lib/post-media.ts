/**
 * Adaptive multi-media layout for one post card (PRD-2 §20, design spec §3.3).
 *
 * The card unit is the **tweet**, not the image, so every media URL of a post
 * is rendered by one of these layouts — nothing is ever sliced down to the
 * first image:
 *
 * | media | layout   | geometry                                     |
 * |-------|----------|----------------------------------------------|
 * | 0     | `single` | nothing to render (text-only uses the quote panel) |
 * | 1     | `single` | one natural-aspect tile                      |
 * | 2     | `duo`    | 50/50 side by side                           |
 * | 3     | `trio`   | wide tile on top + 2 tiles below             |
 * | 4+    | `grid`   | 2 columns × N rows (4 → 2×2, 5/6 → 2×3, …)   |
 *
 * All tiles are `r14` with a 6px gap, and every tile box has an intrinsic
 * aspect (or a `min-height` for the single natural-aspect case) so a broken
 * remote image still occupies a neutral same-box placeholder instead of
 * collapsing the card (PRD-2 §62).
 */

export type MediaLayoutKind = "single" | "duo" | "trio" | "grid"

export interface MediaLayout {
  kind: MediaLayoutKind
  /** Grid tracks the tiles flow into. */
  columns: 1 | 2
}

/** Pick the multi-media layout for a number of media items (never truncates). */
export function selectMediaLayout(mediaCount: number): MediaLayout {
  const count = Number.isFinite(mediaCount)
    ? Math.max(0, Math.trunc(mediaCount))
    : 0

  if (count <= 1) {
    return { kind: "single", columns: 1 }
  }
  if (count === 2) {
    return { kind: "duo", columns: 2 }
  }
  if (count === 3) {
    return { kind: "trio", columns: 2 }
  }

  return { kind: "grid", columns: 2 }
}

/** The grid container classes for a layout (6px gaps = `gap-1.5`). */
export function mediaGridClassName(layout: MediaLayout): string {
  return layout.columns === 2
    ? "grid grid-cols-2 gap-1.5"
    : "grid grid-cols-1 gap-1.5"
}

/**
 * The tile classes for `index` under `layout`.
 *
 * `single` keeps the image's natural aspect ratio and gives the *placeholder*
 * (and any broken image) a 160px minimum box so the card never collapses.
 */
export function mediaTileClassName(layout: MediaLayout, index: number): string {
  switch (layout.kind) {
    case "single":
      return "h-auto min-h-[160px] w-full rounded-md"
    case "duo":
      return "aspect-[3/4] w-full rounded-md"
    case "trio":
      return index === 0
        ? "col-span-2 aspect-[16/10] w-full rounded-md"
        : "aspect-square w-full rounded-md"
    case "grid":
      return "aspect-[4/3] w-full rounded-md"
  }
}

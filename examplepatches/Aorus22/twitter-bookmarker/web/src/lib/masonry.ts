/**
 * Pinterest-masonry geometry (PRD-2 §21, design spec §3.3 frame `6:121`).
 *
 * Every card keeps its **natural** height and nothing is equalised into a row
 * grid (PRD-2 §675: "card height mengikuti natural content/media aspect
 * ratio"). This module owns the numbers that the component and the page share,
 * the responsive decision, and the column packing — all pure functions, so they
 * can be unit-tested at every breakpoint without a layout engine.
 *
 * Figma-validated numbers: card `292`, horizontal gap `32`, vertical gap `22`,
 * column pitch x = 64/388/712/1036 at 1440px.
 */

/** Post-card width; the masonry column is exactly this (design spec §3.3). */
export const MASONRY_CARD_WIDTH = 292

/** Horizontal gap between masonry columns (design spec §3.3: 388−64−292). */
export const MASONRY_COLUMN_GAP = 32

/** Vertical gap between cards in a column (design spec §3.3: 448→970→1035). */
export const MASONRY_ROW_GAP = 22

/** PRD-2 §21/§66 — small viewports get a single column. */
export const MASONRY_MIN_COLUMNS = 1

/** PRD-2 §21 — desktop targets 4–5 columns. */
export const MASONRY_MAX_COLUMNS = 5

function clampColumns(columns: number): number {
  const value = Number.isFinite(columns)
    ? Math.trunc(columns)
    : MASONRY_MIN_COLUMNS
  return Math.min(MASONRY_MAX_COLUMNS, Math.max(MASONRY_MIN_COLUMNS, value))
}

/**
 * The container width that fits exactly `columns` full-width cards plus the
 * gaps between them. Used as the masonry's `max-width` so a column is never
 * stretched past the Figma card width.
 */
export function masonryContainerWidth(columns: number): number {
  const count = clampColumns(columns)
  return count * MASONRY_CARD_WIDTH + (count - 1) * MASONRY_COLUMN_GAP
}

/**
 * Responsive column count for an **available content width**.
 *
 * Exact-fit thresholds, derived from {@link masonryContainerWidth}:
 *
 * | columns | width from |
 * |---------|-----------|
 * | 1       | 0         |
 * | 2       | 616       |
 * | 3       | 940       |
 * | 4       | 1264      |
 * | 5       | 1588      |
 *
 * Because the thresholds are the width 292-wide cards actually need, a 292-wide
 * card can never overflow its column at any viewport width. The shell caps its
 * content column at 1312px, so a 1440px viewport yields **4** columns (the
 * design spec's frame `6:121` layout); 5 is reachable only on a wider container
 * and is kept because PRD-2 §21 allows 4–5.
 *
 * Non-finite or negative widths degrade to one column.
 */
export function columnsForWidth(width: number): number {
  const available = Number.isFinite(width) ? Math.max(0, width) : 0

  for (
    let count = MASONRY_MAX_COLUMNS;
    count > MASONRY_MIN_COLUMNS;
    count -= 1
  ) {
    if (available >= masonryContainerWidth(count)) {
      return count
    }
  }

  return MASONRY_MIN_COLUMNS
}

/**
 * Pack `keys` into `columnCount` masonry columns **without ever moving a key
 * that is already placed**.
 *
 * This is the fix for the infinite-scroll reflow. CSS multi-column
 * (`column-count`) balances the *whole* list against the container's own
 * content height, so appending one page re-distributed everything: measured in
 * headless Chrome at 1440px, appending page 2 of a 70-post collection moved
 * **22 of the 30 already-rendered cards**, by up to 3106px vertically and two
 * columns (648px) horizontally. `column-fill: auto` cannot help — with an auto
 * height it is ignored, and with a definite height an over-estimate collapses
 * the grid to a single column while an under-estimate overflows sideways.
 *
 * So the assignment lives here instead of in the browser: `assigned` is the
 * caller's persistent memory (`key -> column`), and only keys that are **new**
 * are given a column. A new key goes to the column with the smallest known
 * height, breaking ties by how many keys this pass has already added — so a
 * first render, where no height has been measured yet, still distributes
 * round-robin rather than stacking every card into column 1.
 *
 * `columnHeights` are real measured heights from the previous commit, and
 * `estimatedHeight` is the mean item height used to price the not-yet-measured
 * keys of the page being appended. Both influence **only new keys**, so an
 * inaccurate estimate can leave the columns uneven but can never move a card
 * the user has already seen.
 *
 * Mutating `assigned` is deliberate and idempotent: re-running the same call
 * with the same inputs yields the same buckets, which is what a React
 * StrictMode double render relies on.
 *
 * @returns one array of indexes into `keys` per column, each ascending
 */
export function distributeMasonryKeys(
  keys: readonly string[],
  assigned: Map<string, number>,
  columnCount: number,
  columnHeights: readonly number[] = [],
  estimatedHeight = 0
): number[][] {
  const count = clampColumns(columnCount)

  // Forget keys that are no longer rendered (a filter, sort or collection
  // change) so the map cannot grow without bound across a session.
  const live = new Set(keys)
  for (const key of assigned.keys()) {
    if (!live.has(key)) {
      assigned.delete(key)
    }
  }

  const buckets: number[][] = Array.from({ length: count }, () => [])
  const fill = Array.from({ length: count }, (_, column) => {
    const height = columnHeights[column]
    return Number.isFinite(height) && height > 0 ? height : 0
  })
  const added = new Array<number>(count).fill(0)

  keys.forEach((key, index) => {
    let column = assigned.get(key)

    if (column === undefined || column < 0 || column >= count) {
      column = 0
      for (let candidate = 1; candidate < count; candidate += 1) {
        const shorter = fill[candidate] < fill[column]
        const tied =
          fill[candidate] === fill[column] && added[candidate] < added[column]
        if (shorter || tied) {
          column = candidate
        }
      }

      assigned.set(key, column)
      fill[column] += estimatedHeight
      added[column] += 1
    }

    buckets[column].push(index)
  })

  return buckets
}

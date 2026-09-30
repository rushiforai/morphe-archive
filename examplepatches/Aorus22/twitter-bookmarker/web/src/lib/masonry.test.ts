import { describe, expect, it } from "vitest"

import {
  columnsForWidth,
  distributeMasonryKeys,
  MASONRY_CARD_WIDTH,
  MASONRY_COLUMN_GAP,
  MASONRY_MAX_COLUMNS,
  MASONRY_MIN_COLUMNS,
  MASONRY_ROW_GAP,
  masonryContainerWidth,
} from "./masonry"

/**
 * The masonry mapping is pure so every breakpoint is testable without a layout
 * engine: jsdom has no real `clientWidth`, so the alternative — asserting on a
 * rendered component — could not distinguish the breakpoints at all.
 */
describe("masonry constants (design spec §3.3, Figma-validated)", () => {
  it("uses the measured card width and gaps", () => {
    expect(MASONRY_CARD_WIDTH).toBe(292)
    expect(MASONRY_COLUMN_GAP).toBe(32)
    expect(MASONRY_ROW_GAP).toBe(22)
    expect(MASONRY_MIN_COLUMNS).toBe(1)
    expect(MASONRY_MAX_COLUMNS).toBe(5)
  })
})

describe("masonryContainerWidth", () => {
  it("fits n cards plus the gaps between them", () => {
    expect(masonryContainerWidth(1)).toBe(292)
    expect(masonryContainerWidth(2)).toBe(616)
    expect(masonryContainerWidth(3)).toBe(940)
    expect(masonryContainerWidth(4)).toBe(1264)
    expect(masonryContainerWidth(5)).toBe(1588)
  })

  it("clamps nonsense column counts into the supported range", () => {
    expect(masonryContainerWidth(0)).toBe(292)
    expect(masonryContainerWidth(-3)).toBe(292)
    expect(masonryContainerWidth(99)).toBe(1588)
    expect(masonryContainerWidth(Number.NaN)).toBe(292)
  })
})

describe("columnsForWidth (PRD-2 §21/§66)", () => {
  it("returns 1 column on small viewports", () => {
    expect(columnsForWidth(320)).toBe(1)
    expect(columnsForWidth(390)).toBe(1)
    expect(columnsForWidth(615)).toBe(1)
  })

  it("returns 2–3 columns on medium viewports", () => {
    expect(columnsForWidth(616)).toBe(2)
    expect(columnsForWidth(768)).toBe(2)
    expect(columnsForWidth(939)).toBe(2)
    expect(columnsForWidth(940)).toBe(3)
    expect(columnsForWidth(1100)).toBe(3)
    expect(columnsForWidth(1263)).toBe(3)
  })

  it("returns 4–5 columns on desktop viewports", () => {
    expect(columnsForWidth(1264)).toBe(4)
    expect(columnsForWidth(1312)).toBe(4)
    expect(columnsForWidth(1440)).toBe(4)
    expect(columnsForWidth(1587)).toBe(4)
    expect(columnsForWidth(1588)).toBe(5)
    expect(columnsForWidth(1920)).toBe(5)
  })

  it("gives 4 columns at the 1440px frame's 1312px content column", () => {
    // The shell caps the content column at 1312 (1440 − 2×64), which is the
    // width the masonry actually measures.
    expect(columnsForWidth(1440 - 128)).toBe(4)
  })

  it("never returns a count whose cards would overflow the available width", () => {
    for (const width of [
      300, 500, 700, 900, 1000, 1200, 1300, 1400, 1600, 2000,
    ]) {
      const columns = columnsForWidth(width)
      if (width >= MASONRY_CARD_WIDTH) {
        expect(masonryContainerWidth(columns)).toBeLessThanOrEqual(width)
      }
    }
  })

  it("degrades to a single column for nonsense widths", () => {
    expect(columnsForWidth(0)).toBe(1)
    expect(columnsForWidth(-100)).toBe(1)
    expect(columnsForWidth(Number.NaN)).toBe(1)
    expect(columnsForWidth(Number.POSITIVE_INFINITY)).toBe(1)
  })
})

/**
 * The append-only packing that replaced CSS `column-count`.
 *
 * The bug: `column-count` balances the whole list against the container's
 * content height, so appending one page re-distributed every card — measured in
 * headless Chrome at 1440px, 22 of the 30 rendered cards moved when page 2 of a
 * 70-post collection arrived, by up to 3106px vertically and two columns
 * horizontally. These tests pin the replacement guarantee in a layout engine
 * jsdom does not have: **a key that has a column keeps it, forever.**
 */
describe("distributeMasonryKeys — append-only packing (the scroll-shuffle fix)", () => {
  const keys = (count: number, offset = 0): string[] =>
    Array.from({ length: count }, (_, index) => `k${offset + index}`)

  it("round-robins when nothing has been measured yet", () => {
    // All heights are 0 and the mean estimate is 0, so the tie-break by
    // "placed this pass" is the only thing keeping the first render from
    // stacking every card into column 1.
    const buckets = distributeMasonryKeys(
      ["a", "b", "c", "d", "e", "f"],
      new Map<string, number>(),
      3
    )

    expect(buckets).toEqual([
      [0, 3],
      [1, 4],
      [2, 5],
    ])
  })

  it("never moves a key that already has a column", () => {
    const assigned = new Map<string, number>()
    const firstPage = keys(30)

    distributeMasonryKeys(firstPage, assigned, 4, [], 300)
    const before = new Map(assigned)
    expect(before.size).toBe(30)

    const secondPage = [...firstPage, ...keys(30, 30)]
    const buckets = distributeMasonryKeys(
      secondPage,
      assigned,
      4,
      [5000, 4200, 5600, 4600],
      300
    )

    for (const [key, column] of before) {
      expect(assigned.get(key)).toBe(column)
    }

    // ...and the new page lands at the *bottom* of its column, so a card can
    // never be pushed above one the user has already read.
    for (const column of buckets) {
      const original = column.filter((index) => index < firstPage.length)
      expect(column.slice(0, original.length)).toEqual(original)
    }
  })

  it("puts a new key in the shortest measured column", () => {
    const assigned = new Map<string, number>([
      ["a", 0],
      ["b", 1],
      ["c", 2],
    ])

    distributeMasonryKeys(["a", "b", "c", "d"], assigned, 3, [0, 900, 500], 100)

    expect(assigned.get("d")).toBe(0)
  })

  it("spreads an appended page across every column", () => {
    const assigned = new Map<string, number>()
    const firstPage = keys(30)
    distributeMasonryKeys(firstPage, assigned, 4, [], 300)

    const buckets = distributeMasonryKeys(
      [...firstPage, ...keys(30, 30)],
      assigned,
      4,
      [5000, 4200, 5600, 4600],
      300
    )

    for (const column of buckets) {
      expect(column.filter((index) => index >= 30).length).toBeGreaterThan(0)
    }
  })

  it("forgets keys that are no longer rendered", () => {
    const assigned = new Map<string, number>([
      ["a", 0],
      ["b", 1],
      ["filtered-out", 2],
    ])

    distributeMasonryKeys(["a", "b"], assigned, 3, [], 0)

    expect(assigned.has("filtered-out")).toBe(false)
    expect(assigned.size).toBe(2)
  })

  it("re-places a key whose column no longer exists", () => {
    const assigned = new Map<string, number>([["a", 4]])

    // One column, so column 4 is unreachable and the key has to be re-packed.
    expect(distributeMasonryKeys(["a"], assigned, 1, [], 0)).toEqual([[0]])
    expect(assigned.get("a")).toBe(0)
  })

  it("clamps a nonsense column count instead of returning no columns", () => {
    expect(distributeMasonryKeys(["a", "b", "c"], new Map(), 0)).toEqual([
      [0, 1, 2],
    ])
    expect(
      distributeMasonryKeys(["a", "b", "c"], new Map(), Number.NaN)
    ).toEqual([[0, 1, 2]])
  })

  it("ignores unusable measured heights", () => {
    expect(
      distributeMasonryKeys(["a", "b"], new Map(), 2, [Number.NaN, -5], 0)
    ).toEqual([[0], [1]])
  })

  it("keeps declaration order inside each column", () => {
    const buckets = distributeMasonryKeys(keys(12), new Map(), 3, [], 0)

    for (const column of buckets) {
      expect(column).toEqual([...column].sort((a, b) => a - b))
    }
  })

  it("is idempotent, so a StrictMode double render is harmless", () => {
    const assigned = new Map<string, number>()
    const list = keys(9)

    const once = distributeMasonryKeys(list, assigned, 3, [], 0)
    const twice = distributeMasonryKeys(list, assigned, 3, [], 0)

    expect(twice).toEqual(once)
  })
})

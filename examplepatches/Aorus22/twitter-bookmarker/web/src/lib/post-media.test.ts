import { describe, expect, it } from "vitest"

import {
  mediaGridClassName,
  mediaTileClassName,
  selectMediaLayout,
} from "./post-media"

describe("selectMediaLayout (PRD-2 §20, design spec §3.3)", () => {
  it("renders nothing special for a text-only post", () => {
    expect(selectMediaLayout(0)).toEqual({ kind: "single", columns: 1 })
  })

  it("uses a single natural-aspect tile for one media", () => {
    expect(selectMediaLayout(1)).toEqual({ kind: "single", columns: 1 })
    expect(mediaTileClassName(selectMediaLayout(1), 0)).toContain("h-auto")
    expect(mediaTileClassName(selectMediaLayout(1), 0)).toContain(
      "min-h-[160px]"
    )
  })

  it("splits two media 50/50 side by side", () => {
    const layout = selectMediaLayout(2)
    expect(layout).toEqual({ kind: "duo", columns: 2 })
    expect(mediaGridClassName(layout)).toContain("grid-cols-2")
  })

  it("puts a wide tile on top and two below for three media", () => {
    const layout = selectMediaLayout(3)
    expect(layout).toEqual({ kind: "trio", columns: 2 })
    expect(mediaTileClassName(layout, 0)).toContain("col-span-2")
    expect(mediaTileClassName(layout, 1)).not.toContain("col-span-2")
    expect(mediaTileClassName(layout, 2)).not.toContain("col-span-2")
  })

  it("uses the compact 2-column grid for four or more media", () => {
    for (const count of [4, 5, 6, 9]) {
      const layout = selectMediaLayout(count)
      expect(layout.kind).toBe("grid")
      expect(layout.columns).toBe(2)
      expect(mediaGridClassName(layout)).toContain("grid-cols-2")
    }
  })

  it("clamps nonsense counts to the text-only layout", () => {
    expect(selectMediaLayout(-2).kind).toBe("single")
    expect(selectMediaLayout(Number.NaN).kind).toBe("single")
  })
})

describe("media grid styling", () => {
  it("keeps every tile at r14 with a 6px gap (gap-1.5)", () => {
    for (const count of [1, 2, 3, 4, 6]) {
      const layout = selectMediaLayout(count)
      expect(mediaGridClassName(layout)).toContain("gap-1.5")
      for (let index = 0; index < count; index += 1) {
        expect(mediaTileClassName(layout, index)).toContain("rounded-md")
      }
    }
  })
})

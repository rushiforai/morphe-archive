import { describe, expect, it } from "vitest"

import { COVER_TILE_LIMIT, selectCoverLayout, sliceCoverMedia } from "./cover"

describe("selectCoverLayout", () => {
  it("uses the gradient placeholder when there is no media (PRD-2 §17: 0)", () => {
    expect(selectCoverLayout(0)).toEqual({ kind: "placeholder", tileCount: 0 })
  })

  it("uses one full tile for a single media item (PRD-2 §17: 1)", () => {
    expect(selectCoverLayout(1)).toEqual({ kind: "single", tileCount: 1 })
  })

  it("stacks two full-width tiles for two media items", () => {
    expect(selectCoverLayout(2)).toEqual({ kind: "stack", tileCount: 2 })
  })

  it("keeps three media items balanced: 2 on top + 1 wide below (PRD-2 §17: 3)", () => {
    expect(selectCoverLayout(3)).toEqual({ kind: "feature", tileCount: 3 })
  })

  it("uses a 2x2 collage for four media items (PRD-2 §17: 4)", () => {
    expect(selectCoverLayout(4)).toEqual({ kind: "quad", tileCount: 4 })
  })

  it("never renders more than four tiles for 4+ media (PRD-2 §17)", () => {
    expect(selectCoverLayout(9)).toEqual({
      kind: "quad",
      tileCount: COVER_TILE_LIMIT,
    })
  })

  it("treats negative or non-finite counts as the placeholder", () => {
    expect(selectCoverLayout(-3).kind).toBe("placeholder")
    expect(selectCoverLayout(Number.NaN).kind).toBe("placeholder")
    expect(selectCoverLayout(Number.POSITIVE_INFINITY).kind).toBe("placeholder")
  })
})

describe("sliceCoverMedia", () => {
  it("keeps the first four entries in backend (saved_at DESC) order", () => {
    const media = ["newest", "second", "third", "fourth", "fifth"]

    expect(sliceCoverMedia(media)).toEqual([
      "newest",
      "second",
      "third",
      "fourth",
    ])
  })

  it("does not mutate the input array", () => {
    const media = ["a", "b", "c", "d", "e"]
    sliceCoverMedia(media)

    expect(media).toEqual(["a", "b", "c", "d", "e"])
  })

  it("returns every entry when there are fewer than four", () => {
    expect(sliceCoverMedia(["only"])).toEqual(["only"])
    expect(sliceCoverMedia([])).toEqual([])
  })
})

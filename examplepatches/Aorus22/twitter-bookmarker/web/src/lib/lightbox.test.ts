import { describe, expect, it } from "vitest"

import {
  findSlotIndex,
  flattenMediaSlots,
  isFirstSlot,
  isLastSlot,
  mediaDotWindow,
  postsWithMedia,
  slotAt,
  stepMediaIndex,
  stepPostIndex,
  stepSlotIndex,
  type MediaSlot,
} from "./lightbox"

/**
 * LIGHT-03 pure contract (PRD-2 §27): the lightbox walks one flattened
 * `(postIndex, mediaIndex)` sequence, text-only posts contribute nothing,
 * navigation crosses tweet boundaries, and the two loaded edges are honest
 * clamps — never a wrap.
 *
 * The two navigation axes are separate contracts: `stepMediaIndex` never leaves
 * the open tweet, `stepPostIndex` always jumps to a *different* tweet that has
 * media, and `mediaDotWindow` decides how many dots that tweet's media get.
 */

/** `[2 media, 0 media (text-only), 1 media]` — the canonical mixed dataset. */
const MIXED = [{ media: ["a1", "a2"] }, { media: [] }, { media: ["c1"] }]

describe("flattenMediaSlots — the flattened sequence (LIGHT-03)", () => {
  it("walks a post's media in order then continues into the next post", () => {
    expect(flattenMediaSlots(MIXED)).toEqual<MediaSlot[]>([
      { postIndex: 0, mediaIndex: 0 },
      { postIndex: 0, mediaIndex: 1 },
      { postIndex: 2, mediaIndex: 0 },
    ])
  })

  it("skips text-only posts without shifting later positions", () => {
    const slots = flattenMediaSlots(MIXED)

    expect(slots).toHaveLength(3)
    // The text-only post (index 1) produced no slot at all.
    expect(slots.some((slot) => slot.postIndex === 1)).toBe(false)
    // The post after it kept its own index.
    expect(slots[2]).toEqual({ postIndex: 2, mediaIndex: 0 })
  })

  it("handles a dataset with no media at all", () => {
    expect(flattenMediaSlots([{ media: [] }, { media: [] }])).toEqual([])
    expect(flattenMediaSlots([])).toEqual([])
  })

  it("never truncates a post with more than four media", () => {
    const slots = flattenMediaSlots([{ media: ["1", "2", "3", "4", "5", "6"] }])

    expect(slots).toHaveLength(6)
    expect(slots[5]).toEqual({ postIndex: 0, mediaIndex: 5 })
  })

  it("survives a malformed media field from the backend", () => {
    const slots = flattenMediaSlots([
      { media: undefined as unknown as string[] },
      { media: ["ok"] },
    ])

    expect(slots).toEqual([{ postIndex: 1, mediaIndex: 0 }])
  })
})

describe("findSlotIndex / slotAt — position lookup (LIGHT-03)", () => {
  const slots = flattenMediaSlots(MIXED)

  it("maps a clicked (post, media) pair to its flattened position", () => {
    expect(findSlotIndex(slots, 0, 0)).toBe(0)
    expect(findSlotIndex(slots, 0, 1)).toBe(1)
    expect(findSlotIndex(slots, 2, 0)).toBe(2)
  })

  it("returns -1 for a text-only post, an out-of-range media index, or an unknown post", () => {
    expect(findSlotIndex(slots, 1, 0)).toBe(-1)
    expect(findSlotIndex(slots, 0, 2)).toBe(-1)
    expect(findSlotIndex(slots, 9, 0)).toBe(-1)
  })

  it("returns the slot at an index and nothing outside the sequence", () => {
    expect(slotAt(slots, 1)).toEqual({ postIndex: 0, mediaIndex: 1 })
    expect(slotAt(slots, 3)).toBeUndefined()
    expect(slotAt(slots, -1)).toBeUndefined()
    expect(slotAt(slots, Number.NaN)).toBeUndefined()
  })
})

describe("stepSlotIndex — boundaries are clamps, not wraps (LIGHT-03)", () => {
  it("steps forward and backward inside the sequence", () => {
    expect(stepSlotIndex(0, 3, "next")).toBe(1)
    expect(stepSlotIndex(2, 3, "prev")).toBe(1)
  })

  it("stops at the very last loaded item instead of wrapping", () => {
    expect(stepSlotIndex(2, 3, "next")).toBe(2)
    expect(stepSlotIndex(0, 1, "next")).toBe(0)
  })

  it("stops at the very first loaded item instead of wrapping", () => {
    expect(stepSlotIndex(0, 3, "prev")).toBe(0)
    expect(stepSlotIndex(0, 1, "prev")).toBe(0)
  })

  it("clamps a nonsense index into range rather than returning an invalid slot", () => {
    expect(stepSlotIndex(99, 3, "next")).toBe(2)
    expect(stepSlotIndex(-5, 3, "prev")).toBe(0)
  })

  it("has nothing to step to when no media is loaded", () => {
    expect(stepSlotIndex(0, 0, "next")).toBe(-1)
    expect(stepSlotIndex(0, 0, "prev")).toBe(-1)
    expect(stepSlotIndex(Number.NaN, 3, "next")).toBe(-1)
  })

  it("crosses into the next tweet's media at a post boundary (PRD-2 §27)", () => {
    const slots = flattenMediaSlots(MIXED)
    const lastOfFirstPost = findSlotIndex(slots, 0, 1)

    // One step forward leaves post 0 and, skipping the text-only post 1,
    // lands on post 2's only image.
    const next = stepSlotIndex(lastOfFirstPost, slots.length, "next")
    expect(slotAt(slots, next)).toEqual({ postIndex: 2, mediaIndex: 0 })

    // And back again.
    expect(slotAt(slots, stepSlotIndex(next, slots.length, "prev"))).toEqual({
      postIndex: 0,
      mediaIndex: 1,
    })
  })
})

describe("isFirstSlot / isLastSlot (LIGHT-03)", () => {
  it("detects the two loaded edges", () => {
    expect(isFirstSlot(0, 3)).toBe(true)
    expect(isFirstSlot(1, 3)).toBe(false)
    expect(isLastSlot(2, 3)).toBe(true)
    expect(isLastSlot(1, 3)).toBe(false)
  })

  it("is false for every index when nothing is loaded", () => {
    expect(isFirstSlot(0, 0)).toBe(false)
    expect(isLastSlot(0, 0)).toBe(false)
  })
})

/** `[3 media, 0 media, 2 media, 0 media, 1 media]` — posts 0 / 2 / 4 own media. */
const SPARSE = [
  { media: ["a1", "a2", "a3"] },
  { media: [] },
  { media: ["c1", "c2"] },
  { media: [] },
  { media: ["e1"] },
]
const SPARSE_SLOTS = flattenMediaSlots(SPARSE)

describe("stepMediaIndex — inside the open tweet only (PRD-2 §27)", () => {
  it("walks a tweet's own media and stops at its last image", () => {
    // Slots 0,1,2 belong to post 0.
    expect(stepMediaIndex(0, SPARSE_SLOTS, "next")).toBe(1)
    expect(stepMediaIndex(1, SPARSE_SLOTS, "next")).toBe(2)
    // The next entry belongs to post 2, so this is the end of the tweet.
    expect(stepMediaIndex(2, SPARSE_SLOTS, "next")).toBe(2)
  })

  it("stops at a tweet's first image instead of entering the previous tweet", () => {
    // Slot 3 is post 2's first image; slot 2 is post 0's last.
    expect(stepMediaIndex(3, SPARSE_SLOTS, "prev")).toBe(3)
    expect(stepMediaIndex(4, SPARSE_SLOTS, "prev")).toBe(3)
    expect(stepMediaIndex(2, SPARSE_SLOTS, "prev")).toBe(1)
  })

  it("is a no-op on a one-image tweet in both directions", () => {
    expect(stepMediaIndex(5, SPARSE_SLOTS, "next")).toBe(5)
    expect(stepMediaIndex(5, SPARSE_SLOTS, "prev")).toBe(5)
  })

  it("returns -1 for an index that is not in the sequence", () => {
    expect(stepMediaIndex(-1, SPARSE_SLOTS, "next")).toBe(-1)
    expect(stepMediaIndex(99, SPARSE_SLOTS, "next")).toBe(-1)
    expect(stepMediaIndex(Number.NaN, SPARSE_SLOTS, "next")).toBe(-1)
    expect(stepMediaIndex(0, [], "next")).toBe(-1)
  })
})

describe("postsWithMedia — navigation destinations", () => {
  it("lists each media-bearing post once, in gallery order", () => {
    expect(postsWithMedia(SPARSE_SLOTS)).toEqual([0, 2, 4])
  })

  it("is empty when nothing has media", () => {
    expect(postsWithMedia([])).toEqual([])
    expect(postsWithMedia(flattenMediaSlots([{ media: [] }]))).toEqual([])
  })

  it("de-duplicates a post whose slots are not contiguous", () => {
    // Defensive: a hand-built slot list must not turn one post into two stops.
    const ungrouped: MediaSlot[] = [
      { postIndex: 0, mediaIndex: 0 },
      { postIndex: 1, mediaIndex: 0 },
      { postIndex: 0, mediaIndex: 1 },
    ]

    expect(postsWithMedia(ungrouped)).toEqual([0, 1])
  })
})

describe("stepPostIndex — between tweets, skipping the text-only ones", () => {
  it("lands on the neighbour's first media, not on the same media index", () => {
    // From post 0's last image to post 2's first.
    const next = stepPostIndex(2, SPARSE_SLOTS, "next")
    expect(next).toBe(3)
    expect(slotAt(SPARSE_SLOTS, next)).toEqual({ postIndex: 2, mediaIndex: 0 })
  })

  it("jumps from the middle of a tweet straight to the next tweet", () => {
    expect(stepPostIndex(0, SPARSE_SLOTS, "next")).toBe(3)
  })

  it("never lands on a text-only post in either direction", () => {
    // Post 2 -> post 4 (post 3 has no media); post 2 -> post 0 (post 1 has none).
    const forward = stepPostIndex(3, SPARSE_SLOTS, "next")
    expect(slotAt(SPARSE_SLOTS, forward)).toEqual({
      postIndex: 4,
      mediaIndex: 0,
    })

    const backward = stepPostIndex(3, SPARSE_SLOTS, "prev")
    expect(slotAt(SPARSE_SLOTS, backward)).toEqual({
      postIndex: 0,
      mediaIndex: 0,
    })
  })

  it("clamps at both loaded edges instead of wrapping", () => {
    expect(stepPostIndex(0, SPARSE_SLOTS, "prev")).toBe(0)
    expect(stepPostIndex(5, SPARSE_SLOTS, "next")).toBe(5)
  })

  it("returns -1 for an index that is not in the sequence", () => {
    expect(stepPostIndex(-1, SPARSE_SLOTS, "next")).toBe(-1)
    expect(stepPostIndex(99, SPARSE_SLOTS, "next")).toBe(-1)
    expect(stepPostIndex(0, [], "next")).toBe(-1)
  })
})

describe("mediaDotWindow — how many dots a tweet gets", () => {
  it("renders every media when the tweet fits under the limit", () => {
    expect(mediaDotWindow(0, 1)).toEqual({ start: 0, count: 1 })
    expect(mediaDotWindow(3, 5)).toEqual({ start: 0, count: 5 })
    expect(mediaDotWindow(8, 9)).toEqual({ start: 0, count: 9 })
  })

  it("slides a full window that always contains the active media", () => {
    // 39 images is a real thread; the window is 9 wide and clamps at the ends.
    expect(mediaDotWindow(0, 39)).toEqual({ start: 0, count: 9 })
    expect(mediaDotWindow(4, 39)).toEqual({ start: 0, count: 9 })
    expect(mediaDotWindow(5, 39)).toEqual({ start: 1, count: 9 })
    expect(mediaDotWindow(20, 39)).toEqual({ start: 16, count: 9 })
    expect(mediaDotWindow(38, 39)).toEqual({ start: 30, count: 9 })

    // The active media is inside the window for every position.
    for (let index = 0; index < 39; index += 1) {
      const { start, count } = mediaDotWindow(index, 39)
      expect(index).toBeGreaterThanOrEqual(start)
      expect(index).toBeLessThan(start + count)
      expect(count).toBe(9)
    }
  })

  it("clamps an out-of-range active index into the sequence", () => {
    expect(mediaDotWindow(-5, 4)).toEqual({ start: 0, count: 4 })
    expect(mediaDotWindow(99, 4)).toEqual({ start: 0, count: 4 })
    expect(mediaDotWindow(Number.NaN, 4)).toEqual({ start: 0, count: 4 })
  })

  it("renders no dots for a tweet with no media", () => {
    expect(mediaDotWindow(0, 0)).toEqual({ start: 0, count: 0 })
    expect(mediaDotWindow(3, Number.NaN)).toEqual({ start: 0, count: 0 })
    expect(mediaDotWindow(0, -4)).toEqual({ start: 0, count: 0 })
  })

  it("honours a custom limit and never exceeds the media count", () => {
    expect(mediaDotWindow(2, 10, 3)).toEqual({ start: 1, count: 3 })
    // A limit above the media count is the whole sequence, not a padded window.
    expect(mediaDotWindow(1, 3, 50)).toEqual({ start: 0, count: 3 })
    // A nonsense limit still renders one dot rather than none.
    expect(mediaDotWindow(4, 10, 0)).toEqual({ start: 4, count: 1 })
  })
})

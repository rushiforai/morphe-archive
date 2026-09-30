import { describe, expect, it } from "vitest"

import {
  formatCollectionCounts,
  formatCollectionMeta,
  formatCount,
  normalizeCount,
  sumCounts,
} from "./collection-meta"

const NOW = new Date(2026, 8, 28, 12, 0, 0)
const SAVED_AT = new Date(2026, 8, 27, 12, 0, 0).toISOString()

describe("normalizeCount", () => {
  it("truncates to a whole, non-negative number", () => {
    expect(normalizeCount(83)).toBe(83)
    expect(normalizeCount(83.9)).toBe(83)
    expect(normalizeCount(-3)).toBe(0)
  })

  it("degrades non-finite input to zero", () => {
    expect(normalizeCount(Number.NaN)).toBe(0)
    expect(normalizeCount(Number.POSITIVE_INFINITY)).toBe(0)
  })
})

describe("sumCounts", () => {
  it("adds one field across collections", () => {
    const collections = [
      { post_count: 8, media_count: 13 },
      { post_count: 4, media_count: 3 },
      { post_count: 0, media_count: 0 },
    ]

    expect(sumCounts(collections, (c) => c.post_count)).toBe(12)
    expect(sumCounts(collections, (c) => c.media_count)).toBe(16)
  })

  it("clamps a malformed member so the total still agrees with the rows", () => {
    expect(
      sumCounts([{ n: 5 }, { n: Number.NaN }, { n: -2 }], (item) => item.n)
    ).toBe(5)
  })

  it("is zero for an empty archive", () => {
    expect(sumCounts([], (item: { n: number }) => item.n)).toBe(0)
  })
})

describe("formatCount", () => {
  it("pluralises counts", () => {
    expect(formatCount(0, "post")).toBe("0 posts")
    expect(formatCount(1, "post")).toBe("1 post")
    expect(formatCount(83, "post")).toBe("83 posts")
  })

  it("honours an explicit invariant plural (`media`)", () => {
    expect(formatCount(1, "media", "media")).toBe("1 media")
    expect(formatCount(126, "media", "media")).toBe("126 media")
  })

  it("clamps nonsense counts to zero", () => {
    expect(formatCount(-5, "post")).toBe("0 posts")
    expect(formatCount(Number.NaN, "post")).toBe("0 posts")
  })
})

describe("formatCollectionMeta", () => {
  it("renders post count, media count and the last-saved date (PRD-2 §16)", () => {
    expect(
      formatCollectionMeta(
        { post_count: 83, media_count: 126, last_saved_at: SAVED_AT },
        { now: NOW, locale: "en-US" }
      )
    ).toBe("83 posts · 126 media · Last saved Sep 27")
  })

  it("still renders a card for an empty collection", () => {
    expect(
      formatCollectionMeta(
        { post_count: 0, media_count: 0, last_saved_at: null },
        { now: NOW }
      )
    ).toBe("0 posts · 0 media · No saves yet")
  })

  it("uses the singular form for one post", () => {
    expect(
      formatCollectionMeta(
        { post_count: 1, media_count: 1, last_saved_at: SAVED_AT },
        { now: NOW, locale: "en-US" }
      )
    ).toBe("1 post · 1 media · Last saved Sep 27")
  })
})

describe("formatCollectionCounts", () => {
  it("renders the collection-header counts line (design spec §3.3)", () => {
    expect(formatCollectionCounts({ post_count: 186, media_count: 220 })).toBe(
      "186 posts · 220 media"
    )
  })

  it("singularises a one-post, one-media collection", () => {
    expect(formatCollectionCounts({ post_count: 1, media_count: 1 })).toBe(
      "1 post · 1 media"
    )
  })

  it("renders zeros for a postless collection without a date segment", () => {
    expect(formatCollectionCounts({ post_count: 0, media_count: 0 })).toBe(
      "0 posts · 0 media"
    )
  })
})

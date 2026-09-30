import { describe, expect, it } from "vitest"

import {
  MAX_POSTS_PAGE_LIMIT,
  clampPageLimit,
  mergeUniquePosts,
  resolveNextPage,
} from "./pagination"
import { makePost } from "@/test/fixtures"

/**
 * SCROLL-03/SCROLL-04 pure contract: the opaque cursor is never interpreted, a
 * missing next page is always detected (including the malformed
 * `has_more: true` + null-cursor case), and dedupe keeps the first-seen
 * instance and position. No React, no fetch.
 */

describe("resolveNextPage — the cursor contract (SCROLL-04, PRD-2 §43)", () => {
  it("returns the opaque cursor verbatim when the backend advertises more", () => {
    const opaque = "saved_desc|2026-09-27T10:20:30Z|42"

    expect(
      resolveNextPage({ items: [], next_cursor: opaque, has_more: true })
    ).toEqual({
      nextCursor: opaque,
      hasMore: true,
    })
  })

  it("does not normalise a cursor with URL-hostile characters", () => {
    const opaque = "a+b/c=d&e?f#g h"

    expect(
      resolveNextPage({ items: [], next_cursor: opaque, has_more: true })
        .nextCursor
    ).toBe(opaque)
  })

  it("stops when has_more is false, even if a cursor leaked through", () => {
    expect(
      resolveNextPage({ items: [], next_cursor: "stale", has_more: false })
    ).toEqual({ nextCursor: null, hasMore: false })
  })

  it("does not loop when has_more is true but next_cursor is null", () => {
    expect(
      resolveNextPage({ items: [], next_cursor: null, has_more: true })
    ).toEqual({ nextCursor: null, hasMore: false })
  })

  it("does not loop on an empty-string cursor", () => {
    expect(
      resolveNextPage({ items: [], next_cursor: "", has_more: true })
    ).toEqual({ nextCursor: null, hasMore: false })
  })

  it("ignores a non-string cursor from a malformed backend", () => {
    expect(
      resolveNextPage({
        items: [],
        next_cursor: 42 as unknown as string,
        has_more: true,
      })
    ).toEqual({ nextCursor: null, hasMore: false })
  })
})

describe("mergeUniquePosts — defensive tweet_id dedupe (SCROLL-03, PRD-2 §44)", () => {
  it("appends a disjoint page in order", () => {
    const first = [makePost({ tweet_id: "1" }), makePost({ tweet_id: "2" })]
    const second = [makePost({ tweet_id: "3" })]

    expect(
      mergeUniquePosts(first, second).map((post) => post.tweet_id)
    ).toEqual(["1", "2", "3"])
  })

  it("keeps the first-seen instance and position for an overlapping tweet_id", () => {
    const first = [
      makePost({ tweet_id: "1", text: "first page one" }),
      makePost({ tweet_id: "2", text: "first page two" }),
      makePost({ tweet_id: "3", text: "first page three" }),
    ]
    const second = [
      makePost({ tweet_id: "3", text: "overlapping, must be dropped" }),
      makePost({ tweet_id: "4", text: "new" }),
    ]

    const merged = mergeUniquePosts(first, second)

    expect(merged.map((post) => post.tweet_id)).toEqual(["1", "2", "3", "4"])
    expect(merged[2].text).toBe("first page three")
  })

  it("adds nothing when a page is fully overlapping (the mid-scroll drift case)", () => {
    const first = [makePost({ tweet_id: "1" }), makePost({ tweet_id: "2" })]
    const drifted = [makePost({ tweet_id: "2" }), makePost({ tweet_id: "1" })]

    expect(mergeUniquePosts(first, drifted)).toHaveLength(2)
  })

  it("dedupes duplicates inside a single incoming page", () => {
    const merged = mergeUniquePosts(
      [],
      [makePost({ tweet_id: "1" }), makePost({ tweet_id: "1" })]
    )

    expect(merged.map((post) => post.tweet_id)).toEqual(["1"])
  })

  it("never mutates its inputs", () => {
    const first = [makePost({ tweet_id: "1" })]
    const second = [makePost({ tweet_id: "1" }), makePost({ tweet_id: "2" })]

    mergeUniquePosts(first, second)

    expect(first).toHaveLength(1)
    expect(second).toHaveLength(2)
  })
})

describe("clampPageLimit — the §34 page-size contract (SCROLL-01)", () => {
  it("keeps the 30 default as-is", () => {
    expect(clampPageLimit(30)).toBe(30)
  })

  it("never exceeds the API maximum of 100", () => {
    expect(clampPageLimit(500)).toBe(MAX_POSTS_PAGE_LIMIT)
  })

  it("coerces toward a usable integer", () => {
    expect(clampPageLimit(0)).toBe(1)
    expect(clampPageLimit(12.7)).toBe(12)
    expect(clampPageLimit(Number.NaN)).toBe(MAX_POSTS_PAGE_LIMIT)
  })
})

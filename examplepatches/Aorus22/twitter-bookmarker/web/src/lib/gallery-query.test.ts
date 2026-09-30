import { describe, expect, it } from "vitest"

import { toUtcFrom, toUtcTo } from "./date-bounds"
import {
  DEFAULT_GALLERY_QUERY,
  galleryQueryKey,
  galleryQueryToPostsParams,
  hasActiveDateFilters,
  hasActiveQuery,
  parseGalleryQuery,
  serializeGalleryQuery,
  type GalleryQuery,
} from "./gallery-query"

/**
 * DISC-04/05/07 — the URL representation of discovery state and the exact
 * request params it derives. Parsing must never throw on a hand-edited or
 * stale URL, and every date must reach the API as an inclusive RFC3339 UTC
 * boundary.
 */

const params = (entries: Record<string, string>) => new URLSearchParams(entries)

describe("gallery-query — defensive URL parsing (DISC-07)", () => {
  it("treats a URL with no params as the default view", () => {
    expect(parseGalleryQuery(new URLSearchParams())).toEqual(
      DEFAULT_GALLERY_QUERY
    )
    expect(parseGalleryQuery(new URLSearchParams()).sort).toBe("saved_desc")
  })

  it("falls back to the default for an unknown or empty sort", () => {
    expect(parseGalleryQuery(params({ sort: "newest" })).sort).toBe(
      "saved_desc"
    )
    expect(parseGalleryQuery(params({ sort: "" })).sort).toBe("saved_desc")
  })

  it("accepts each of the four PRD-2 §33 sort modes", () => {
    for (const sort of ["saved_desc", "saved_asc", "tweet_desc", "tweet_asc"]) {
      expect(parseGalleryQuery(params({ sort })).sort).toBe(sort)
    }
  })

  it("ignores malformed dates instead of crashing", () => {
    const parsed = parseGalleryQuery(
      params({
        tweet_from: "yesterday",
        tweet_to: "2026-13-45",
        saved_from: "2026-02-31",
        saved_to: "2026-09-27",
      })
    )

    expect(parsed.tweetFrom).toBeUndefined()
    expect(parsed.tweetTo).toBeUndefined()
    expect(parsed.savedFrom).toBeUndefined()
    expect(parsed.savedTo).toBe("2026-09-27")
  })

  it("keeps the raw search text and never exposes a cursor", () => {
    const parsed = parseGalleryQuery(
      params({ q: "  wayland  ", cursor: "opaque-token" })
    )

    expect(parsed.q).toBe("  wayland  ")
    expect(parsed).not.toHaveProperty("cursor")
  })
})

describe("gallery-query — serialisation (DISC-07)", () => {
  it("round-trips state → URL → state", () => {
    const query: GalleryQuery = {
      q: "linux desktop",
      sort: "saved_asc",
      tweetFrom: "2026-01-01",
      tweetTo: "2026-09-01",
      savedFrom: "2026-09-20",
      savedTo: "2026-09-27",
    }

    expect(parseGalleryQuery(serializeGalleryQuery(query))).toEqual(query)
  })

  it("omits a blank search and writes sort explicitly", () => {
    const serialized = serializeGalleryQuery({
      q: "   ",
      sort: "saved_desc",
    }).toString()

    expect(serialized).toBe("sort=saved_desc")
  })

  it("never writes a cursor", () => {
    const serialized = serializeGalleryQuery({
      ...DEFAULT_GALLERY_QUERY,
      q: "wayland",
    })

    expect(serialized.toString()).not.toContain("cursor")
    expect(Array.from(serialized.keys())).toEqual(["q", "sort"])
  })

  it("writes only real dates", () => {
    const serialized = serializeGalleryQuery({
      ...DEFAULT_GALLERY_QUERY,
      tweetFrom: "2026-02-31",
      savedTo: "2026-09-27",
    })

    expect(serialized.get("tweet_from")).toBeNull()
    expect(serialized.get("saved_to")).toBe("2026-09-27")
  })
})

describe("gallery-query — request params (DISC-01, DISC-04, DISC-05)", () => {
  it("sends search as q and sort as sort, with limit", () => {
    const result = galleryQueryToPostsParams(
      { q: "  wayland  ", sort: "tweet_asc" },
      30
    )

    expect(result.q).toBe("wayland")
    expect(result.sort).toBe("tweet_asc")
    expect(result.limit).toBe(30)
  })

  it("omits an empty search entirely", () => {
    const result = galleryQueryToPostsParams(
      { q: "   ", sort: "saved_desc" },
      30
    )

    expect(result.q).toBeUndefined()
  })

  it("sends both ranges at once (AND) with inclusive RFC3339 UTC bounds", () => {
    const result = galleryQueryToPostsParams(
      {
        q: "",
        sort: "saved_desc",
        tweetFrom: "2026-01-01",
        tweetTo: "2026-09-01",
        savedFrom: "2026-09-20",
        savedTo: "2026-09-27",
      },
      30
    )

    expect(result.tweet_from).toBe(toUtcFrom("2026-01-01"))
    expect(result.tweet_to).toBe(toUtcTo("2026-09-01"))
    expect(result.saved_from).toBe(toUtcFrom("2026-09-20"))
    expect(result.saved_to).toBe(toUtcTo("2026-09-27"))
    expect(result.tweet_from?.endsWith("Z")).toBe(true)
    expect(result.saved_to).toMatch(/\.999Z$/)
  })

  it("omits a cleared field and an inverted range", () => {
    const cleared = galleryQueryToPostsParams({ q: "", sort: "saved_desc" }, 30)
    expect(cleared.tweet_from).toBeUndefined()
    expect(cleared.saved_to).toBeUndefined()

    const inverted = galleryQueryToPostsParams(
      {
        q: "",
        sort: "saved_desc",
        savedFrom: "2026-09-27",
        savedTo: "2026-01-01",
      },
      30
    )
    expect(inverted.saved_from).toBeUndefined()
    expect(inverted.saved_to).toBeUndefined()
  })
})

describe("gallery-query — activity helpers", () => {
  it("reports an applied date filter for the Filter dot", () => {
    expect(
      hasActiveDateFilters({
        ...DEFAULT_GALLERY_QUERY,
        savedFrom: "2026-09-01",
      })
    ).toBe(true)
    expect(
      hasActiveDateFilters({ ...DEFAULT_GALLERY_QUERY, tweetTo: "2026-09-01" })
    ).toBe(true)
    expect(
      hasActiveDateFilters({ ...DEFAULT_GALLERY_QUERY, q: "wayland" })
    ).toBe(false)
    expect(
      hasActiveDateFilters({
        ...DEFAULT_GALLERY_QUERY,
        savedFrom: "2026-09-27",
        savedTo: "2026-01-01",
      })
    ).toBe(false)
  })

  it("treats search or dates as an active query for the empty state", () => {
    expect(hasActiveQuery(DEFAULT_GALLERY_QUERY)).toBe(false)
    expect(hasActiveQuery({ ...DEFAULT_GALLERY_QUERY, q: "wayland" })).toBe(
      true
    )
    expect(hasActiveQuery({ ...DEFAULT_GALLERY_QUERY, q: "   " })).toBe(false)
    expect(
      hasActiveQuery({ ...DEFAULT_GALLERY_QUERY, savedTo: "2026-09-27" })
    ).toBe(true)
  })

  it("keys a query by every field so a change is observable", () => {
    const base = DEFAULT_GALLERY_QUERY
    expect(galleryQueryKey(base)).toBe(galleryQueryKey({ ...base }))
    expect(galleryQueryKey(base)).not.toBe(
      galleryQueryKey({ ...base, sort: "tweet_desc" })
    )
    expect(galleryQueryKey(base)).not.toBe(galleryQueryKey({ ...base, q: "x" }))
    expect(galleryQueryKey(base)).not.toBe(
      galleryQueryKey({ ...base, savedFrom: "2026-01-01" })
    )
  })
})

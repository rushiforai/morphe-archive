import { describe, expect, it } from "vitest"

import { orderCollections } from "./collection-order"
import type { GalleryCollection } from "@/types"

function collection(
  slug: string,
  lastSavedAt: string | null
): GalleryCollection {
  return {
    slug,
    name: slug,
    post_count: 1,
    media_count: 0,
    last_saved_at: lastSavedAt,
    cover_media: [],
  }
}

describe("orderCollections", () => {
  it("returns the backend order untouched when every collection has a timestamp", () => {
    const input = [
      collection("b", "2026-09-27T10:00:00Z"),
      collection("a", "2026-09-26T10:00:00Z"),
    ]

    const result = orderCollections(input)

    expect(result).toBe(input)
    expect(result.map((c) => c.slug)).toEqual(["b", "a"])
  })

  it("moves timestamp-less collections after collections with data (PRD-2 §38)", () => {
    const result = orderCollections([
      collection("undated", null),
      collection("newer", "2026-09-27T10:00:00Z"),
      collection("older", "2026-09-26T10:00:00Z"),
    ])

    expect(result.map((c) => c.slug)).toEqual(["newer", "older", "undated"])
  })

  it("keeps the relative order stable inside each group", () => {
    const result = orderCollections([
      collection("u1", null),
      collection("d1", "2026-09-27T10:00:00Z"),
      collection("u2", null),
      collection("d2", "2026-09-25T10:00:00Z"),
    ])

    expect(result.map((c) => c.slug)).toEqual(["d1", "d2", "u1", "u2"])
  })

  it("handles the empty list", () => {
    expect(orderCollections([])).toEqual([])
  })
})

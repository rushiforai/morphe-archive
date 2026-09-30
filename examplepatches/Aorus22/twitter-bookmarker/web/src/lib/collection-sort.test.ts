import { describe, expect, it } from "vitest"

import { DEFAULT_SORT, SORT_OPTIONS, sortLabel } from "./collection-sort"

describe("SORT_OPTIONS (PRD-2 §33)", () => {
  it("offers exactly the four supported modes, newest-bookmarked first", () => {
    expect(SORT_OPTIONS.map((option) => option.value)).toEqual([
      "saved_desc",
      "saved_asc",
      "tweet_desc",
      "tweet_asc",
    ])
    expect(SORT_OPTIONS[0].label).toBe("Newest Bookmarked")
  })

  it("defaults to saved_desc", () => {
    expect(DEFAULT_SORT).toBe("saved_desc")
  })

  it("maps every mode to its PRD label", () => {
    expect(sortLabel("saved_desc")).toBe("Newest Bookmarked")
    expect(sortLabel("saved_asc")).toBe("Oldest Bookmarked")
    expect(sortLabel("tweet_desc")).toBe("Newest Posted")
    expect(sortLabel("tweet_asc")).toBe("Oldest Posted")
  })
})

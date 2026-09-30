import { describe, expect, it } from "vitest"

import { selectPostsViewState } from "./posts-state"

/**
 * The three empty/error states must stay genuinely distinct (COLL-10, PRD-2
 * §60): "no posts in this collection" and "no posts because of filters" are
 * different messages with different actions, and neither is the error state.
 */
describe("selectPostsViewState (COLL-10)", () => {
  it("prefers the loading state while the first page is in flight", () => {
    expect(selectPostsViewState("loading", 0, false)).toBe("loading")
    expect(selectPostsViewState("loading", 7, true)).toBe("loading")
  })

  it("prefers the error state for a failed or not-found collection", () => {
    expect(selectPostsViewState("error", 0, false)).toBe("error")
    expect(selectPostsViewState("error", 0, true)).toBe("error")
  })

  it("renders posts whenever the collection has any", () => {
    expect(selectPostsViewState("success", 6, false)).toBe("posts")
    expect(selectPostsViewState("success", 1, true)).toBe("posts")
  })

  it("distinguishes a postless collection from zero filtered results", () => {
    expect(selectPostsViewState("success", 0, false)).toBe("empty-collection")
    expect(selectPostsViewState("success", 0, true)).toBe("empty-filters")
  })

  it("treats a nonsense count as zero", () => {
    expect(selectPostsViewState("success", Number.NaN, false)).toBe(
      "empty-collection"
    )
    expect(selectPostsViewState("success", -3, false)).toBe("empty-collection")
  })
})

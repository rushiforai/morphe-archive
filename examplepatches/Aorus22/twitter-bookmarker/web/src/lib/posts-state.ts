/**
 * The one content-state decision for the collection page (COLL-10, PRD-2 §60).
 *
 * The empty-collection and filter-no-match states are deliberately **two
 * different states**, not one shared "empty": a valid collection with no posts
 * keeps its own copy, while zero results *because of filters* offers
 * `Clear filters`.
 *
 * Phase 6 owns the applied filters, so in Phase 5 `filtersActive` can never
 * become true — the branch exists, is unit-tested, and lights up unchanged once
 * the server-side query lands.
 */

export type PostsStatus = "loading" | "success" | "error"

export type PostsViewState =
  "loading" | "error" | "empty-collection" | "empty-filters" | "posts"

export function selectPostsViewState(
  status: PostsStatus,
  postCount: number,
  filtersActive: boolean
): PostsViewState {
  if (status === "loading") {
    return "loading"
  }
  if (status === "error") {
    return "error"
  }

  const count = Number.isFinite(postCount)
    ? Math.max(0, Math.trunc(postCount))
    : 0
  if (count > 0) {
    return "posts"
  }

  return filtersActive ? "empty-filters" : "empty-collection"
}

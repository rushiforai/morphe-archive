/**
 * Cursor-pagination helpers (PRD-2 §34/§43/§44).
 *
 * The gallery API pages with an **opaque** cursor: the client receives
 * `next_cursor` and echoes it back verbatim on the next request. Nothing here
 * parses, decodes, constructs or mutates a cursor — it is a black box string.
 *
 * Two defensive rules live in this module so both the hook and its tests share
 * one definition:
 *
 *   1. {@link resolveNextPage} decides whether a page response advertises a next
 *      page: `has_more: false` stops, and so does `has_more: true` with a
 *      missing/empty cursor. A malformed backend therefore cannot make the
 *      sentinel loop forever (SCROLL-04).
 *   2. {@link mergeUniquePosts} appends a page while dropping any `tweet_id`
 *      already loaded, keeping the first-seen instance and position. This is the
 *      documented defensive dedupe for a collection that gained rows mid-scroll,
 *      which drifts a sort-key cursor window (PRD-2 §44, SCROLL-03).
 */

import type { GalleryPost, GalleryPostsResponse } from "@/types"

/** PRD-2 §34: the API's maximum page size. The client never asks for more. */
export const MAX_POSTS_PAGE_LIMIT = 100

export interface NextPage {
  /** Opaque cursor for the next request, or `null` when there is no next page. */
  nextCursor: string | null
  hasMore: boolean
}

/**
 * Normalise a posts response into the next-page decision.
 *
 * A cursor is only ever surfaced when `has_more` is true **and** the backend
 * actually returned a non-empty string cursor. Every other combination means
 * "stop" (PRD-2 §43: at the end `next_cursor` is JSON `null` and `has_more`
 * false).
 */
export function resolveNextPage(response: GalleryPostsResponse): NextPage {
  if (!response.has_more) {
    return { nextCursor: null, hasMore: false }
  }

  const cursor = response.next_cursor
  if (typeof cursor !== "string" || cursor === "") {
    return { nextCursor: null, hasMore: false }
  }

  return { nextCursor: cursor, hasMore: true }
}

/**
 * Append `incoming` to `existing`, skipping any `tweet_id` already present.
 *
 * `existing` order is preserved exactly and the first-seen instance wins, so an
 * overlapping item never renders twice and never moves (SCROLL-03). Inputs are
 * never mutated.
 */
export function mergeUniquePosts(
  existing: readonly GalleryPost[],
  incoming: readonly GalleryPost[]
): GalleryPost[] {
  const seen = new Set(existing.map((post) => post.tweet_id))
  const merged = existing.slice()

  for (const post of incoming) {
    if (seen.has(post.tweet_id)) {
      continue
    }
    seen.add(post.tweet_id)
    merged.push(post)
  }

  return merged
}

/**
 * Clamp a requested page size into the backend's accepted range.
 *
 * The default is 30 (PRD-2 §34); 100 is the API maximum. Non-finite input
 * degrades to the maximum rather than producing a malformed query.
 */
export function clampPageLimit(limit: number): number {
  if (!Number.isFinite(limit)) {
    return MAX_POSTS_PAGE_LIMIT
  }
  return Math.min(MAX_POSTS_PAGE_LIMIT, Math.max(1, Math.trunc(limit)))
}

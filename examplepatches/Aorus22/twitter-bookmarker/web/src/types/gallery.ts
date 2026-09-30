/**
 * Gallery API DTOs.
 *
 * Field names are the wire contract — copied verbatim from PRD-2 §74/§75 and
 * matching the Phase 2 response shapes asserted in
 * `.planning/phases/02-gallery-http-api/02-VERIFICATION.md`.
 */

/** One saved collection, identified by its slug. */
export interface GalleryCollection {
  slug: string
  name: string
  post_count: number
  media_count: number
  /** RFC3339 UTC, or `null` for a collection that has never been saved to. */
  last_saved_at: string | null
  /** Up to four newest media URLs, `saved_at` DESC. */
  cover_media: string[]
}

/** One bookmark row. */
export interface GalleryPost {
  tweet_id: string
  url: string
  media: string[]
  author: string
  username: string
  /** RFC3339 UTC. */
  tweet_date: string
  /** RFC3339 UTC. */
  saved_at: string
  text: string
}

/** `GET /api/gallery/collections` */
export interface GalleryCollectionListResponse {
  collections: GalleryCollection[]
}

/** `GET /api/gallery/collections/{slug}/posts` */
export interface GalleryPostsResponse {
  items: GalleryPost[]
  /** Opaque cursor for the next page, or `null` at the end. */
  next_cursor: string | null
  has_more: boolean
}

/** The four sort modes the backend accepts (PRD-2 §33). */
export type GallerySort =
  "saved_desc" | "saved_asc" | "tweet_desc" | "tweet_asc"

/**
 * Query parameters for the posts endpoint (PRD-2 §40).
 * Every field is optional; undefined/null/empty values are omitted from the URL.
 */
export interface GalleryPostsParams {
  cursor?: string
  limit?: number
  q?: string
  /** RFC3339 lower bound on the tweet date. */
  tweet_from?: string
  /** RFC3339 upper bound on the tweet date. */
  tweet_to?: string
  /** RFC3339 lower bound on the bookmark date. */
  saved_from?: string
  /** RFC3339 upper bound on the bookmark date. */
  saved_to?: string
  sort?: GallerySort
}

/** The backend's error envelope: `{"status":"error","reason":"..."}`. */
export interface GalleryErrorResponse {
  status: "error"
  reason: string
}

/**
 * `DELETE /v1/bookmarks/{tweet_id}`
 *
 * Curation is addressed on the bookmark resource, not under `/api/gallery`:
 * that API is GET-only by contract (API-07), and adding a method to it would
 * turn a read path into a write path.
 *
 * `recoverable` states the property the UI relies on when it offers a delete at
 * all: the backend moves the row into `deleted_bookmarks` rather than destroying
 * it, so the deletion can be undone from the database by hand.
 */
export interface BookmarkDeleteResponse {
  status: string
  tweet_id: string
  recoverable: boolean
}

/** `PUT /v1/bookmarks/{tweet_id}/collection` */
export interface BookmarkMoveResponse {
  status: string
  tweet_id: string
  slug: string
}

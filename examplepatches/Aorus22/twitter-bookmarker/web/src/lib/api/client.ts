/**
 * Gallery API client.
 *
 * Every request is a **relative** URL under `/api/gallery/...` (PRD-2 §55):
 * there is no host, no port, no `VITE_*` base URL and no hardcoded backend
 * address anywhere in `src/`. In development Vite proxies `/api` to the Go
 * backend (`web/vite.config.ts`); in production the Go server serves both the
 * SPA and the API from the same origin (PRD-2 §56).
 */
import { COULD_NOT_CONNECT_MESSAGE } from "@/lib/messages"
import type {
  BookmarkDeleteResponse,
  BookmarkMoveResponse,
  GalleryCollection,
  GalleryCollectionListResponse,
  GalleryPostsParams,
  GalleryPostsResponse,
} from "@/types"
import { ApiError } from "./errors"

/** Relative mount point of the gallery API. */
export const GALLERY_API_BASE = "/api/gallery"

/**
 * Relative mount point of the bookmark resource.
 *
 * Curation (delete, move) lives here, next to the save that created the
 * bookmark, and deliberately **not** under `/api/gallery`: that API is GET-only
 * by contract (API-07), so adding a method to it would turn a read path into a
 * write path. Keeping the two prefixes separate is what preserves that.
 */
export const BOOKMARK_API_BASE = "/v1/bookmarks"

const MALFORMED_RESPONSE_REASON = "Backend returned an unexpected response"

/**
 * Read the `reason` from the backend's error envelope
 * `{"status":"error","reason":"..."}`. Returns `null` when the body is empty,
 * not JSON, or has no usable reason.
 */
async function readErrorReason(response: Response): Promise<string | null> {
  let body: unknown
  try {
    body = await response.json()
  } catch {
    return null
  }

  if (typeof body !== "object" || body === null) {
    return null
  }

  const reason = (body as { reason?: unknown }).reason
  if (typeof reason === "string" && reason.trim() !== "") {
    return reason
  }

  return null
}

/**
 * Perform one request and decode the JSON body.
 *
 * @throws {ApiError} on a non-2xx status (carrying the backend `reason` and the
 * status), on a transport failure (status `0`), or on an undecodable body.
 */
async function request<T>(path: string, init?: RequestInit): Promise<T> {
  let response: Response
  try {
    response = await fetch(path, init)
  } catch (cause) {
    throw new ApiError(COULD_NOT_CONNECT_MESSAGE, 0, { cause })
  }

  if (!response.ok) {
    const reason = await readErrorReason(response)
    throw new ApiError(
      reason ?? `${MALFORMED_RESPONSE_REASON} (HTTP ${response.status})`,
      response.status
    )
  }

  try {
    return (await response.json()) as T
  } catch (cause) {
    throw new ApiError(MALFORMED_RESPONSE_REASON, response.status, { cause })
  }
}

/**
 * Serialise params into a query string, omitting anything `undefined`, `null`
 * or an empty/whitespace-only string so a blank search box never narrows the
 * result set. Returns `""` (no `?`) when nothing is left.
 */
function toQueryString(params: GalleryPostsParams): string {
  const search = new URLSearchParams()

  for (const [key, value] of Object.entries(params)) {
    if (value === undefined || value === null) {
      continue
    }
    if (typeof value === "string" && value.trim() === "") {
      continue
    }
    search.set(key, String(value))
  }

  const query = search.toString()
  return query === "" ? "" : `?${query}`
}

/**
 * `GET /api/gallery/collections`
 *
 * @returns every valid collection, ordered `last_saved_at` DESC by the backend
 * (PRD-2 §38). A missing `collections` key decodes to an empty list rather than
 * crashing a page.
 */
export async function fetchCollections(): Promise<GalleryCollection[]> {
  const body = await request<GalleryCollectionListResponse>(
    `${GALLERY_API_BASE}/collections`
  )

  return Array.isArray(body?.collections) ? body.collections : []
}

/**
 * `GET /api/gallery/collections/{slug}/posts`
 *
 * @param slug the collection slug, URL-encoded here (never interpolated raw).
 * @param params optional query parameters; undefined/null/empty values are
 * omitted from the URL.
 */
export async function fetchPosts(
  slug: string,
  params: GalleryPostsParams = {}
): Promise<GalleryPostsResponse> {
  const path =
    `${GALLERY_API_BASE}/collections/${encodeURIComponent(slug)}/posts` +
    toQueryString(params)

  const body = await request<GalleryPostsResponse>(path)

  return {
    items: Array.isArray(body?.items) ? body.items : [],
    next_cursor: body?.next_cursor ?? null,
    has_more: Boolean(body?.has_more),
  }
}

/**
 * `DELETE /v1/bookmarks/{tweet_id}` — remove a bookmark from the archive.
 *
 * The deletion is recoverable: the backend moves the row into
 * `deleted_bookmarks`, so nothing is destroyed and the restore recipe in the
 * README still works afterwards.
 *
 * @param tweetId the numeric Status ID, URL-encoded here (never interpolated raw).
 * @throws {ApiError} 404 when the tweet is not saved (a stale view), 400 for a
 * malformed id, 500 for a storage failure.
 */
export async function deleteBookmark(
  tweetId: string
): Promise<BookmarkDeleteResponse> {
  return request<BookmarkDeleteResponse>(
    `${BOOKMARK_API_BASE}/${encodeURIComponent(tweetId)}`,
    { method: "DELETE" }
  )
}

/**
 * `PUT /v1/bookmarks/{tweet_id}/collection` — move a bookmark into another
 * collection.
 *
 * The destination must already exist. The web app never creates a collection:
 * the extension owns folder names, so an unknown slug is a stale picker and the
 * backend answers 404 rather than inventing a name from a slug.
 *
 * @throws {ApiError} 404 when the tweet is not saved or the collection does not
 * exist, 400 for a malformed id or slug.
 */
export async function moveBookmark(
  tweetId: string,
  slug: string
): Promise<BookmarkMoveResponse> {
  return request<BookmarkMoveResponse>(
    `${BOOKMARK_API_BASE}/${encodeURIComponent(tweetId)}/collection`,
    {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ slug }),
    }
  )
}

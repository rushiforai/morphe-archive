import { vi } from "vitest"

import type { GalleryCollection, GalleryPost } from "@/types"

/**
 * Shared fixtures for the gallery suites.
 *
 * Every test mocks `fetch` (there is no network and no server, and the
 * operator-owned backend on its dev port is never contacted), so these helpers
 * build a realistic API surface once instead of in every file. This module is
 * *not* a test file: `vitest.config.ts` only collects `src/**\/*.test.{ts,tsx}`.
 */

/** A stored remote media URL — always the verbatim `pbs.twimg.com` host. */
export function pbsUrl(name: string): string {
  return `https://pbs.twimg.com/media/${name}.jpg`
}

export const POST_NOW = new Date(2026, 3, 3, 12, 0, 0)
export const POST_TWEET_DATE = new Date(2026, 2, 12, 12, 0, 0).toISOString()
export const POST_SAVED_AT = new Date(2026, 3, 3, 12, 0, 0).toISOString()

/** One bookmark row; `media: []` is a text-only post (PRD-2 §22). */
export function makePost(
  overrides: Partial<GalleryPost> & { tweet_id: string }
): GalleryPost {
  // The stored handle carries the sigil (extension `getUsername` returns "@foo"),
  // so the default fixture carries it too — a bare "tester" once hid a
  // `@@handle` bug.
  const username = overrides.username ?? "@tester"
  return {
    url: `https://x.com/${username.replace(/^@+/, "")}/status/${overrides.tweet_id}`,
    media: [],
    author: "Test Author",
    username,
    tweet_date: POST_TWEET_DATE,
    saved_at: POST_SAVED_AT,
    text: "A saved tweet.",
    ...overrides,
  }
}

/** Turn a slug like `linux-tips` into the human name `Linux Tips`. */
function humanizeSlug(slug: string): string {
  return slug
    .split(/[^a-zA-Z0-9]+/)
    .filter((word) => word !== "")
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ")
}

/** One collection summary row; `name` defaults to a humanised slug. */
export function makeCollection(
  overrides: Partial<GalleryCollection> & { slug: string }
): GalleryCollection {
  return {
    name: humanizeSlug(overrides.slug),
    post_count: 0,
    media_count: 0,
    last_saved_at: null,
    cover_media: [],
    ...overrides,
  }
}

/** Minimal stand-in for the parts of `Response` the API client reads. */
export function jsonResponse(body: unknown, status = 200): Response {
  return {
    ok: status >= 200 && status < 300,
    status,
    json: async () => body,
  } as unknown as Response
}

export interface GalleryFetchRoutes {
  /** `GET /api/gallery/collections` (header summary). */
  collections?: () => Response | Promise<Response>
  /** `GET /api/gallery/collections/{slug}/posts`. */
  posts?: (url: string) => Response | Promise<Response>
  /** `DELETE /v1/bookmarks/{tweet_id}` — curation, not a gallery route. */
  deleteBookmark?: (tweetId: string) => Response | Promise<Response>
  /** `PUT /v1/bookmarks/{tweet_id}/collection`. */
  moveBookmark?: (tweetId: string, slug: string) => Response | Promise<Response>
}

/** The Tweet Status ID out of a `/v1/bookmarks/<id>[/collection]` URL. */
export function bookmarkIdFromUrl(url: string): string {
  const path = url.split("?")[0]
  const rest = path.split("/v1/bookmarks/")[1]
  return decodeURIComponent(rest?.split("/")[0] ?? "")
}

/** The `slug` field out of a JSON request body, or `""`. */
export function slugFromBody(body: BodyInit | null | undefined): string {
  if (typeof body !== "string") {
    return ""
  }
  try {
    const parsed: unknown = JSON.parse(body)
    const slug = (parsed as { slug?: unknown } | null)?.slug
    return typeof slug === "string" ? slug : ""
  } catch {
    return ""
  }
}

/**
 * Install a URL- and method-routing `fetch` mock and return it.
 *
 * The collection page issues posts + collections requests, and curation adds a
 * `DELETE` and a `PUT` on a **different prefix** (`/v1/bookmarks`, see
 * `BOOKMARK_API_BASE`), so the mock routes on the URL *and* the method: a
 * mutation answered with the collections payload would look like a success to
 * the caller and hide a real regression.
 */
export function stubGalleryFetch(routes: GalleryFetchRoutes = {}) {
  const mock = vi.fn((input: RequestInfo | URL, init?: RequestInit) => {
    const url = String(input)
    const method = (init?.method ?? "GET").toUpperCase()

    // Matched before the gallery branches on purpose: these paths share no
    // substring with them, and the fallback below would otherwise swallow a
    // mutation.
    if (url.includes("/v1/bookmarks")) {
      const tweetId = bookmarkIdFromUrl(url)

      if (method === "DELETE") {
        const response = routes.deleteBookmark?.(tweetId)
        return Promise.resolve(
          response ??
            jsonResponse({
              status: "deleted",
              tweet_id: tweetId,
              recoverable: true,
            })
        )
      }

      if (method === "PUT") {
        const slug = slugFromBody(init?.body)
        const response = routes.moveBookmark?.(tweetId, slug)
        return Promise.resolve(
          response ?? jsonResponse({ status: "moved", tweet_id: tweetId, slug })
        )
      }
    }

    if (url.includes("/posts")) {
      const response = routes.posts?.(url)
      return Promise.resolve(
        response ??
          jsonResponse({ items: [], next_cursor: null, has_more: false })
      )
    }

    const response = routes.collections?.()
    return Promise.resolve(response ?? jsonResponse({ collections: [] }))
  })

  vi.stubGlobal("fetch", mock)
  return mock
}

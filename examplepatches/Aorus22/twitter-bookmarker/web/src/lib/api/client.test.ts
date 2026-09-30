import { describe, expect, it } from "vitest"

import { COULD_NOT_CONNECT_MESSAGE } from "@/lib/messages"
import { deleteBookmark, moveBookmark } from "./client"
import { ApiError, isApiError } from "./errors"

import { jsonResponse, stubGalleryFetch } from "@/test/fixtures"

/**
 * The curation half of the API client: `deleteBookmark` and `moveBookmark`.
 *
 * Both write to the bookmark resource (`/v1/bookmarks`), never to the gallery
 * API, which is GET-only by contract (API-07). Every fetch is mocked; failures
 * must surface as a typed {@link ApiError} rather than a resolved `undefined`,
 * because the UI renders its "nothing was changed" copy from the rejection.
 */

/**
 * Await a request that must fail and narrow the rejection to `ApiError`.
 *
 * Uses the UI's own `isApiError` guard, so the suite fails if the client ever
 * degrades to an untyped throw; a resolved promise fails too, which is exactly
 * what the "never resolves" cases pin.
 */
async function apiErrorFrom(promise: Promise<unknown>): Promise<ApiError> {
  let caught: unknown = undefined
  try {
    await promise
  } catch (error) {
    caught = error
  }

  if (!isApiError(caught)) {
    throw new Error(
      `Expected an ApiError rejection, received ${String(caught)}`
    )
  }

  return caught
}

describe("deleteBookmark — recoverable deletion (API-07)", () => {
  it("DELETEs /v1/bookmarks/{id} and decodes the recoverable response", async () => {
    const fetchMock = stubGalleryFetch()

    const result = await deleteBookmark("123")

    const [url, init] = fetchMock.mock.calls[0]
    expect(String(url)).toBe("/v1/bookmarks/123")
    expect(init?.method).toBe("DELETE")
    expect(result).toEqual({
      status: "deleted",
      tweet_id: "123",
      recoverable: true,
    })
  })

  it("URL-encodes the tweet id instead of interpolating it raw", async () => {
    const fetchMock = stubGalleryFetch()

    // Raw, "12/34" would read as two path segments and turn a delete of one
    // bookmark into a request against a different resource.
    const result = await deleteBookmark("12/34")

    expect(String(fetchMock.mock.calls[0][0])).toBe("/v1/bookmarks/12%2F34")
    expect(result.tweet_id).toBe("12/34")
  })
})

describe("moveBookmark — collection move (API-07)", () => {
  it("PUTs /v1/bookmarks/{id}/collection with the slug as a JSON body", async () => {
    const fetchMock = stubGalleryFetch()

    const result = await moveBookmark("123", "chibi-art")

    const [url, init] = fetchMock.mock.calls[0]
    expect(String(url)).toBe("/v1/bookmarks/123/collection")
    expect(init?.method).toBe("PUT")
    expect(init?.headers).toEqual({ "Content-Type": "application/json" })
    expect(init?.body).toBe('{"slug":"chibi-art"}')
    expect(result).toEqual({
      status: "moved",
      tweet_id: "123",
      slug: "chibi-art",
    })
  })

  it("URL-encodes the tweet id and keeps the slug out of the path", async () => {
    const fetchMock = stubGalleryFetch()

    await moveBookmark("12/34", "chibi/art")

    const [url, init] = fetchMock.mock.calls[0]
    // The id must stay one path segment; the destination travels only in the
    // JSON body, because the bookmark resource has no slug-bearing route.
    expect(String(url)).toBe("/v1/bookmarks/12%2F34/collection")
    expect(String(url)).not.toContain("chibi")
    expect(init?.body).toBe('{"slug":"chibi/art"}')
  })
})

describe("bookmark client — failure handling (PRD-2 §61)", () => {
  it("rejects with the backend reason and the 404 status when the bookmark is gone", async () => {
    stubGalleryFetch({
      deleteBookmark: () =>
        jsonResponse({ status: "error", reason: "bookmark not found" }, 404),
    })

    const error = await apiErrorFrom(deleteBookmark("123"))

    expect(error.reason).toBe("bookmark not found")
    expect(error.status).toBe(404)
  })

  it("preserves the 500 status for a storage failure", async () => {
    stubGalleryFetch({
      moveBookmark: () =>
        jsonResponse({ status: "error", reason: "storage failure" }, 500),
    })

    const error = await apiErrorFrom(moveBookmark("123", "chibi-art"))

    expect(error.reason).toBe("storage failure")
    expect(error.status).toBe(500)
  })

  it("never treats an unparseable error body as a success", async () => {
    stubGalleryFetch({
      deleteBookmark: () =>
        ({
          ok: false,
          status: 500,
          json: async () => {
            throw new SyntaxError("Unexpected token < in JSON")
          },
        }) as unknown as Response,
    })

    const error = await apiErrorFrom(deleteBookmark("123"))

    expect(error.status).toBe(500)
    expect(error.reason).not.toBe("")
  })

  it("reports a transport failure as status 0 with the connection copy", async () => {
    stubGalleryFetch({
      moveBookmark: () => Promise.reject(new TypeError("Failed to fetch")),
    })

    const error = await apiErrorFrom(moveBookmark("123", "chibi-art"))

    expect(error.isNetworkError).toBe(true)
    expect(error.status).toBe(0)
    expect(error.reason).toBe(COULD_NOT_CONNECT_MESSAGE)
  })

  it("rejects when a 2xx body cannot be decoded instead of resolving undefined", async () => {
    stubGalleryFetch({
      deleteBookmark: () =>
        ({
          ok: true,
          status: 200,
          json: async () => {
            throw new SyntaxError("Unexpected end of JSON input")
          },
        }) as unknown as Response,
    })

    const error = await apiErrorFrom(deleteBookmark("123"))

    expect(error.status).toBe(200)
  })

  it("keeps curation off the GET-only gallery API (API-07)", async () => {
    const fetchMock = stubGalleryFetch()

    await deleteBookmark("123")
    await moveBookmark("123", "chibi-art")

    const urls = fetchMock.mock.calls.map((call) => String(call[0]))
    expect(urls).toHaveLength(2)
    for (const url of urls) {
      expect(url.startsWith("/v1/bookmarks")).toBe(true)
      expect(url).not.toContain("/api/gallery/")
    }
  })
})

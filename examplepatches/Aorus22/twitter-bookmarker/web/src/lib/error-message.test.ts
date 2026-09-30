import { describe, expect, it } from "vitest"

import { ApiError } from "@/lib/api"
import {
  COULD_NOT_CONNECT_MESSAGE,
  COULD_NOT_LOAD_COLLECTION_MESSAGE,
} from "@/lib/messages"

import { describeGalleryError } from "./error-message"

describe("describeGalleryError (PRD-2 §61)", () => {
  it("renders the backend connection copy for a transport failure", () => {
    const error = new ApiError(COULD_NOT_CONNECT_MESSAGE, 0)

    expect(describeGalleryError(error)).toBe(COULD_NOT_CONNECT_MESSAGE)
  })

  it("falls back to the connection copy when a transport error has no reason", () => {
    expect(describeGalleryError(new ApiError("   ", 0))).toBe(
      COULD_NOT_CONNECT_MESSAGE
    )
  })

  it("renders the collection-load copy for a 404 (collection does not exist)", () => {
    expect(describeGalleryError(new ApiError("not found", 404))).toBe(
      COULD_NOT_LOAD_COLLECTION_MESSAGE
    )
  })

  it("renders the collection-load copy for any other API failure", () => {
    expect(describeGalleryError(new ApiError("boom", 500))).toBe(
      COULD_NOT_LOAD_COLLECTION_MESSAGE
    )
  })

  it("never leaks a non-API error message into the UI", () => {
    expect(describeGalleryError(new TypeError("Failed to fetch"))).toBe(
      COULD_NOT_LOAD_COLLECTION_MESSAGE
    )
    expect(describeGalleryError(null)).toBe(COULD_NOT_LOAD_COLLECTION_MESSAGE)
  })
})

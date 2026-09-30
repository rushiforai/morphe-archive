import { isApiError } from "@/lib/api"

import {
  COULD_NOT_CONNECT_MESSAGE,
  COULD_NOT_LOAD_COLLECTION_MESSAGE,
} from "./messages"

/**
 * Map a gallery API failure to the exact PRD-2 §61 user-facing copy.
 *
 * Extracted from the Phase 4 collections hook so the collections and posts
 * hooks share one mapping:
 *
 *   - a transport failure (status `0`, i.e. the backend is not running) carries
 *     the §61 connection message from the API client;
 *   - every other gallery API failure — including a `404` for a collection that
 *     does not exist — renders the §61 gallery-error copy;
 *   - anything that is not an `ApiError` at all still renders that same copy
 *     rather than leaking an internal message.
 */
export function describeGalleryError(error: unknown): string {
  if (isApiError(error)) {
    if (error.isNetworkError) {
      return error.reason.trim() !== ""
        ? error.reason
        : COULD_NOT_CONNECT_MESSAGE
    }
    return COULD_NOT_LOAD_COLLECTION_MESSAGE
  }

  return COULD_NOT_LOAD_COLLECTION_MESSAGE
}

import { DEFAULT_SORT, SORT_OPTIONS } from "@/lib/collection-sort"
import {
  isInvertedRange,
  isLocalDate,
  localDateToUtcBounds,
} from "@/lib/date-bounds"
import type { GalleryPostsParams, GallerySort } from "@/types"

/**
 * The collection page's discovery state and its URL representation
 * (PRD-2 §76, DISC-07).
 *
 * The URL is the single source of truth for search, filters and sort, so
 * refresh, back/forward and bookmarking all preserve the view. The **cursor is
 * deliberately never written here**: it is transient paging state and Phase 7
 * owns it.
 *
 * Date decision: the URL carries the **local calendar date** the user picked
 * (`YYYY-MM-DD`) — short, human-readable and stable across a later timezone
 * change — while the request derives RFC3339 UTC instants from it at call time
 * (`galleryQueryToPostsParams`). `parseGalleryQuery` is defensive: an unknown
 * sort falls back to `saved_desc`, a malformed date is ignored, and a URL with
 * no params is exactly the default view.
 */

/** Local-date filter fields, shared by the panel draft and the committed query. */
export interface GalleryFilterDates {
  tweetFrom?: string
  tweetTo?: string
  savedFrom?: string
  savedTo?: string
}

/** The full committed discovery state. */
export interface GalleryQuery extends GalleryFilterDates {
  q: string
  sort: GallerySort
}

export const DEFAULT_GALLERY_QUERY: GalleryQuery = {
  q: "",
  sort: DEFAULT_SORT,
}

const SORT_VALUES = new Set<string>(SORT_OPTIONS.map((option) => option.value))

function dateParam(params: URLSearchParams, key: string): string | undefined {
  const value = params.get(key)
  return isLocalDate(value) ? value : undefined
}

/** Parse a URL query string into committed state, never throwing on garbage. */
export function parseGalleryQuery(params: URLSearchParams): GalleryQuery {
  const rawSort = params.get("sort") ?? ""
  const sort = SORT_VALUES.has(rawSort)
    ? (rawSort as GallerySort)
    : DEFAULT_SORT

  return {
    // The raw value is preserved so the input echo round-trips exactly while
    // typing; emptiness is judged with `trim()` and the backend trims too
    // (PRD-2 §45), so whitespace never narrows a result set.
    q: params.get("q") ?? "",
    sort,
    tweetFrom: dateParam(params, "tweet_from"),
    tweetTo: dateParam(params, "tweet_to"),
    savedFrom: dateParam(params, "saved_from"),
    savedTo: dateParam(params, "saved_to"),
  }
}

/**
 * Serialise committed state for the URL. Empty search and empty dates are
 * omitted; `sort` is always written explicitly (PRD-2 §76's example includes
 * it) and a cursor is never written.
 */
export function serializeGalleryQuery(query: GalleryQuery): URLSearchParams {
  const params = new URLSearchParams()

  if (query.q.trim() !== "") {
    params.set("q", query.q)
  }
  params.set("sort", query.sort)

  if (isLocalDate(query.tweetFrom)) {
    params.set("tweet_from", query.tweetFrom)
  }
  if (isLocalDate(query.tweetTo)) {
    params.set("tweet_to", query.tweetTo)
  }
  if (isLocalDate(query.savedFrom)) {
    params.set("saved_from", query.savedFrom)
  }
  if (isLocalDate(query.savedTo)) {
    params.set("saved_to", query.savedTo)
  }

  return params
}

/** A stable identity for a query, for effects that must run once per change. */
export function galleryQueryKey(query: GalleryQuery): string {
  return [
    query.q,
    query.sort,
    query.tweetFrom ?? "",
    query.tweetTo ?? "",
    query.savedFrom ?? "",
    query.savedTo ?? "",
  ].join("\u0000")
}

/** The panel draft's view of the committed query. */
export function datesFromQuery(query: GalleryQuery): GalleryFilterDates {
  return {
    tweetFrom: query.tweetFrom,
    tweetTo: query.tweetTo,
    savedFrom: query.savedFrom,
    savedTo: query.savedTo,
  }
}

/** Apply a committed panel draft to the rest of the query (sort/search kept). */
export function applyFilterDates(
  query: GalleryQuery,
  dates: GalleryFilterDates
): GalleryQuery {
  return {
    ...query,
    tweetFrom: dates.tweetFrom,
    tweetTo: dates.tweetTo,
    savedFrom: dates.savedFrom,
    savedTo: dates.savedTo,
  }
}

function isRangeApplied(from?: string, to?: string): boolean {
  if (isInvertedRange(from, to)) {
    return false
  }
  return isLocalDate(from) || isLocalDate(to)
}

/**
 * True when a **date** filter is actually applied — what the `Filter` control's
 * active dot reflects. An inverted range is not applied (it emits no bounds).
 */
export function hasActiveDateFilters(query: GalleryQuery): boolean {
  return (
    isRangeApplied(query.tweetFrom, query.tweetTo) ||
    isRangeApplied(query.savedFrom, query.savedTo)
  )
}

/**
 * True when search **or** a date filter narrows the result set — what makes the
 * zero-result state `empty-filters` rather than `empty-collection`.
 */
export function hasActiveQuery(query: GalleryQuery): boolean {
  return query.q.trim() !== "" || hasActiveDateFilters(query)
}

/**
 * Derive the exact Phase 2 request params (PRD-2 §40): `q` and each non-empty
 * date converted to an **inclusive RFC3339 UTC** boundary. Cleared fields are
 * omitted entirely so the backend never sees an empty or malformed value.
 */
export function galleryQueryToPostsParams(
  query: GalleryQuery,
  limit: number
): GalleryPostsParams {
  const tweet = localDateToUtcBounds({
    from: query.tweetFrom,
    to: query.tweetTo,
  })
  const saved = localDateToUtcBounds({
    from: query.savedFrom,
    to: query.savedTo,
  })
  const q = query.q.trim()

  return {
    limit,
    sort: query.sort,
    q: q === "" ? undefined : q,
    tweet_from: tweet.from,
    tweet_to: tweet.to,
    saved_from: saved.from,
    saved_to: saved.to,
  }
}

import { useCallback, useEffect, useMemo, useRef, useState } from "react"
import { useSearchParams } from "react-router-dom"

import { POSTS_PAGE_LIMIT } from "@/hooks/use-posts"
import {
  applyFilterDates,
  galleryQueryKey,
  galleryQueryToPostsParams,
  hasActiveDateFilters,
  hasActiveQuery as queryHasActivity,
  parseGalleryQuery,
  serializeGalleryQuery,
  type GalleryFilterDates,
  type GalleryQuery,
} from "@/lib/gallery-query"
import type { GalleryPostsParams, GallerySort } from "@/types"

/**
 * URL-synced discovery state for the collection page (PRD-2 §76/§77, DISC-07).
 *
 * The URL query string is the single source of truth: `useSearchParams` reads
 * it, and every mutation writes it back. There is no second copy of the query
 * in React state, so refresh, back/forward and a shared link all behave.
 *
 * Debounce rules:
 *   - `setSearch` echoes the keystroke immediately (through a draft tied to the
 *     URL it was typed against) and schedules **one** `replace: true` URL write
 *     after {@link SEARCH_DEBOUNCE_MS}; typing never floods the back stack.
 *   - `setSort`, `applyFilters` and `clearFilters` are explicit actions and
 *     **push**, so back/forward steps through them.
 *   - The cursor is never part of this state; Phase 7 owns paging.
 */

/** Search debounce window (PRD-2 §28). */
export const SEARCH_DEBOUNCE_MS = 300

export interface UseGalleryQueryResult {
  /** Committed state, parsed from the URL. */
  query: GalleryQuery
  /** What the search input shows right now (immediate, pre-debounce echo). */
  search: string
  setSearch: (value: string) => void
  setSort: (value: GallerySort) => void
  /** Commit the filter panel draft (a push). */
  applyFilters: (dates: GalleryFilterDates) => void
  /** Drop search + all four dates, keep sort (a push). */
  clearFilters: () => void
  /** True when a non-inverted date filter is applied (the toolbar dot). */
  filterActive: boolean
  /** True when search or a date filter narrows the result set. */
  hasActiveQuery: boolean
  /** Stable identity of the committed query, for query-change effects. */
  queryKey: string
  /** Exact request params, dates converted to inclusive RFC3339 UTC bounds. */
  requestParams: GalleryPostsParams
}

export function useGalleryQuery(): UseGalleryQueryResult {
  const [searchParams, setSearchParams] = useSearchParams()
  const urlString = searchParams.toString()

  const query = useMemo(() => parseGalleryQuery(searchParams), [searchParams])
  const queryKey = useMemo(() => galleryQueryKey(query), [query])

  // The input echo is a draft bound to the URL string it was typed against: it
  // wins while the URL is unchanged and yields to the URL the instant the URL
  // moves (our debounced write, or back/forward). No effect has to set state.
  const [searchDraft, setSearchDraft] = useState({
    value: query.q,
    source: urlString,
  })
  const search = searchDraft.source === urlString ? searchDraft.value : query.q

  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const pendingSelfWriteRef = useRef<string | null>(null)
  const lastUrlRef = useRef(urlString)
  const queryRef = useRef(query)

  useEffect(() => {
    queryRef.current = query
  }, [query])

  const cancelPending = useCallback(() => {
    if (timerRef.current !== null) {
      clearTimeout(timerRef.current)
      timerRef.current = null
    }
  }, [])

  // An external URL change (back/forward, a link) drops a pending debounce so a
  // stale keystroke can never write over restored history.
  useEffect(() => {
    const current = searchParams.toString()
    if (lastUrlRef.current === current) {
      return
    }
    lastUrlRef.current = current

    const isSelfWrite = pendingSelfWriteRef.current === current
    pendingSelfWriteRef.current = null
    if (!isSelfWrite) {
      cancelPending()
    }
  }, [searchParams, cancelPending])

  useEffect(() => cancelPending, [cancelPending])

  const mutate = useCallback(
    (patch: (current: GalleryQuery) => GalleryQuery, replace: boolean) => {
      const next = serializeGalleryQuery(patch(queryRef.current))
      pendingSelfWriteRef.current = next.toString()
      setSearchParams(next, { replace })
    },
    [setSearchParams]
  )

  const setSearch = useCallback(
    (value: string) => {
      setSearchDraft({ value, source: lastUrlRef.current })
      cancelPending()
      timerRef.current = setTimeout(() => {
        timerRef.current = null
        // The raw value is stored (the backend trims, PRD-2 §45); a blank query
        // is omitted by `serializeGalleryQuery`, so clearing search works.
        mutate((current) => ({ ...current, q: value }), true)
      }, SEARCH_DEBOUNCE_MS)
    },
    [cancelPending, mutate]
  )

  const setSort = useCallback(
    (value: GallerySort) => {
      mutate((current) => ({ ...current, sort: value }), false)
    },
    [mutate]
  )

  const applyFilters = useCallback(
    (dates: GalleryFilterDates) => {
      mutate((current) => applyFilterDates(current, dates), false)
    },
    [mutate]
  )

  const clearFilters = useCallback(() => {
    cancelPending()
    setSearchDraft({ value: "", source: lastUrlRef.current })
    mutate(
      (current) => ({
        ...current,
        q: "",
        tweetFrom: undefined,
        tweetTo: undefined,
        savedFrom: undefined,
        savedTo: undefined,
      }),
      false
    )
  }, [cancelPending, mutate])

  const requestParams = useMemo(
    () => galleryQueryToPostsParams(query, POSTS_PAGE_LIMIT),
    [query]
  )

  return {
    query,
    search,
    setSearch,
    setSort,
    applyFilters,
    clearFilters,
    filterActive: hasActiveDateFilters(query),
    hasActiveQuery: queryHasActivity(query),
    queryKey,
    requestParams,
  }
}

import { act, renderHook } from "@testing-library/react"
import type { ReactNode } from "react"
import { MemoryRouter, useNavigate, useSearchParams } from "react-router-dom"
import { afterEach, describe, expect, it, vi } from "vitest"

import { SEARCH_DEBOUNCE_MS, useGalleryQuery } from "./use-gallery-query"
import { toUtcFrom, toUtcTo } from "@/lib/date-bounds"

/**
 * DISC-01/06/07 — the URL-synced query hook. The URL is the single source of
 * truth, search is debounced to one write per pause, explicit actions push, and
 * an external history move cancels a pending debounce.
 */

function renderQuery(initialEntries: string[], initialIndex?: number) {
  const wrapper = ({ children }: { children: ReactNode }) => (
    <MemoryRouter initialEntries={initialEntries} initialIndex={initialIndex}>
      {children}
    </MemoryRouter>
  )

  return renderHook(
    () => ({
      gallery: useGalleryQuery(),
      params: useSearchParams()[0],
      navigate: useNavigate(),
    }),
    { wrapper }
  )
}

afterEach(() => {
  vi.useRealTimers()
})

describe("useGalleryQuery — debounced search (DISC-01)", () => {
  it("echoes every keystroke immediately but writes the URL once after ~300ms", () => {
    vi.useFakeTimers()
    const { result } = renderQuery(["/collections/linux"])

    act(() => {
      for (const value of ["w", "wa", "way", "wayl", "wayland"]) {
        result.current.gallery.setSearch(value)
      }
    })

    // Immediate echo for the controlled input, but no URL write yet.
    expect(result.current.gallery.search).toBe("wayland")
    expect(result.current.params.get("q")).toBeNull()

    act(() => {
      vi.advanceTimersByTime(SEARCH_DEBOUNCE_MS - 1)
    })
    expect(result.current.params.get("q")).toBeNull()

    act(() => {
      vi.advanceTimersByTime(1)
    })
    expect(result.current.params.get("q")).toBe("wayland")

    // Nothing further on the trailing edge: exactly one debounced write.
    act(() => {
      vi.advanceTimersByTime(SEARCH_DEBOUNCE_MS * 5)
    })
    expect(result.current.params.get("q")).toBe("wayland")
    expect(result.current.gallery.query.q).toBe("wayland")
  })

  it("keeps an explicit sort chosen while the search debounce is pending", () => {
    vi.useFakeTimers()
    const { result } = renderQuery(["/collections/linux"])

    act(() => {
      result.current.gallery.setSearch("wayland")
      result.current.gallery.setSort("tweet_asc")
    })

    act(() => {
      vi.advanceTimersByTime(SEARCH_DEBOUNCE_MS)
    })

    expect(result.current.params.get("q")).toBe("wayland")
    expect(result.current.params.get("sort")).toBe("tweet_asc")
  })

  it("clears the query when the search box is emptied", () => {
    vi.useFakeTimers()
    const { result } = renderQuery([
      "/collections/linux?q=wayland&sort=saved_desc",
    ])

    act(() => {
      result.current.gallery.setSearch("")
    })
    act(() => {
      vi.advanceTimersByTime(SEARCH_DEBOUNCE_MS)
    })

    expect(result.current.params.get("q")).toBeNull()
    expect(result.current.gallery.query.q).toBe("")
  })
})

describe("useGalleryQuery — URL is the source of truth (DISC-07)", () => {
  it("behaves as the default view for a URL with no params", () => {
    const { result } = renderQuery(["/collections/linux"])

    expect(result.current.gallery.query.sort).toBe("saved_desc")
    expect(result.current.gallery.search).toBe("")
    expect(result.current.gallery.filterActive).toBe(false)
    expect(result.current.gallery.hasActiveQuery).toBe(false)
  })

  it("ignores an unknown sort and a malformed date", () => {
    const { result } = renderQuery([
      "/collections/linux?sort=bogus&saved_from=nope&tweet_to=2026-02-31",
    ])

    expect(result.current.gallery.query.sort).toBe("saved_desc")
    expect(result.current.gallery.query.savedFrom).toBeUndefined()
    expect(result.current.gallery.query.tweetTo).toBeUndefined()
  })

  it("restores the previous query on Back", () => {
    const { result } = renderQuery([
      "/collections/linux?q=first&sort=saved_desc",
      "/collections/linux?q=second&sort=saved_desc",
    ])

    expect(result.current.gallery.search).toBe("second")
    expect(result.current.gallery.requestParams.q).toBe("second")

    act(() => {
      result.current.navigate(-1)
    })

    expect(result.current.gallery.search).toBe("first")
    expect(result.current.gallery.requestParams.q).toBe("first")
  })

  it("drops a pending debounce when history moves externally", () => {
    vi.useFakeTimers()
    const { result } = renderQuery([
      "/collections/linux",
      "/collections/linux?sort=tweet_desc",
    ])

    act(() => {
      result.current.gallery.setSearch("stale")
    })
    act(() => {
      result.current.navigate(-1)
    })

    act(() => {
      vi.advanceTimersByTime(SEARCH_DEBOUNCE_MS * 3)
    })

    expect(result.current.gallery.search).toBe("")
    expect(result.current.params.get("q")).toBeNull()
    expect(result.current.params.get("sort")).toBeNull()
  })

  it("derives inclusive RFC3339 UTC request params from URL dates", () => {
    const { result } = renderQuery([
      "/collections/linux?saved_from=2026-09-20&saved_to=2026-09-27&tweet_from=2026-01-01&sort=saved_desc",
    ])

    expect(result.current.gallery.requestParams.saved_from).toBe(
      toUtcFrom("2026-09-20")
    )
    expect(result.current.gallery.requestParams.saved_to).toBe(
      toUtcTo("2026-09-27")
    )
    expect(result.current.gallery.requestParams.tweet_from).toBe(
      toUtcFrom("2026-01-01")
    )
    expect(result.current.gallery.filterActive).toBe(true)
    expect(result.current.gallery.hasActiveQuery).toBe(true)
  })
})

describe("useGalleryQuery — filter and sort commits (DISC-02, DISC-06)", () => {
  it("sleeps over the filter draft and clearFilters drops search + dates, keeping sort", () => {
    const { result } = renderQuery([
      "/collections/linux?q=wayland&saved_from=2026-09-20&sort=tweet_asc",
    ])

    act(() => {
      result.current.gallery.applyFilters({
        tweetFrom: "2026-01-01",
        tweetTo: "2026-09-01",
        savedFrom: "2026-09-20",
        savedTo: "2026-09-27",
      })
    })

    expect(result.current.params.get("tweet_from")).toBe("2026-01-01")
    expect(result.current.params.get("saved_to")).toBe("2026-09-27")
    expect(result.current.gallery.filterActive).toBe(true)

    act(() => {
      result.current.gallery.clearFilters()
    })

    expect(result.current.params.get("q")).toBeNull()
    expect(result.current.params.get("saved_from")).toBeNull()
    expect(result.current.params.get("tweet_from")).toBeNull()
    expect(result.current.params.get("sort")).toBe("tweet_asc")
    expect(result.current.gallery.search).toBe("")
    expect(result.current.gallery.filterActive).toBe(false)
    expect(result.current.gallery.hasActiveQuery).toBe(false)
  })

  it("makes all four sort modes selectable with saved_desc the default", () => {
    const { result } = renderQuery(["/collections/linux"])
    expect(result.current.gallery.query.sort).toBe("saved_desc")

    for (const sort of [
      "saved_asc",
      "tweet_desc",
      "tweet_asc",
      "saved_desc",
    ] as const) {
      act(() => {
        result.current.gallery.setSort(sort)
      })
      expect(result.current.params.get("sort")).toBe(sort)
      expect(result.current.gallery.query.sort).toBe(sort)
    }
  })
})

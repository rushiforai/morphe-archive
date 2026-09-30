import { fireEvent, render, screen, waitFor } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import {
  MemoryRouter,
  Route,
  Routes,
  useLocation,
  useNavigate,
} from "react-router-dom"
import { afterEach, describe, expect, it, vi } from "vitest"

import { CollectionPage } from "./collection-page"
import { toUtcFrom, toUtcTo } from "@/lib/date-bounds"
import { chooseSort } from "@/test/interactions"
import {
  jsonResponse,
  makeCollection,
  makePost,
  pbsUrl,
  stubGalleryFetch,
} from "@/test/fixtures"

/**
 * DISC-01…DISC-08 end-to-end on the collection route: the URL is the source of
 * truth, the toolbar commits to it (debounced search, filter panel, sort), the
 * request carries the derived params, the view state follows the applied query,
 * and a query change resets the scroll position.
 *
 * Every `fetch` is mocked and URL-routed — no network, no server.
 */

const LINUX = makeCollection({
  slug: "linux",
  name: "Linux",
  post_count: 2,
  media_count: 1,
})

const POSTS = [
  makePost({ tweet_id: "1", media: [pbsUrl("a")], text: "One image." }),
  makePost({ tweet_id: "2", text: "Text only.", media: [] }),
]

function locationProbe() {
  return screen.getByTestId("location").textContent ?? ""
}

function postsRequests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return fetchMock.mock.calls
    .map((call) => String(call[0]))
    .filter((url) => url.includes("/posts"))
}

function paramsOf(url: string) {
  return new URL(url, "http://gallery.test").searchParams
}

function LocationProbe() {
  const location = useLocation()
  return <span data-testid="location">{location.search}</span>
}

/** History controls so a test can exercise Back/Forward like a user would. */
function HistoryControls() {
  const navigate = useNavigate()
  return (
    <div>
      <button type="button" onClick={() => navigate(-1)}>
        History back
      </button>
      <button type="button" onClick={() => navigate(1)}>
        History forward
      </button>
    </div>
  )
}

function renderPage(initialEntries: string[], initialIndex?: number) {
  return render(
    <MemoryRouter initialEntries={initialEntries} initialIndex={initialIndex}>
      <LocationProbe />
      <HistoryControls />
      <Routes>
        <Route path="/collections/:slug" element={<CollectionPage />} />
      </Routes>
    </MemoryRouter>
  )
}

/** Posts endpoint that returns the seeded posts only when no query narrows it. */
function filteredPostsRoute() {
  return (url: string) => {
    const params = paramsOf(url)
    const narrowed =
      params.get("q") !== null ||
      params.get("tweet_from") !== null ||
      params.get("saved_from") !== null
    return jsonResponse({
      items: narrowed ? [] : POSTS,
      next_cursor: null,
      has_more: false,
    })
  }
}

const ORIGINAL_INNER_WIDTH = window.innerWidth

afterEach(() => {
  Object.defineProperty(window, "innerWidth", {
    value: ORIGINAL_INNER_WIDTH,
    writable: true,
    configurable: true,
  })
})

describe("CollectionPage — URL drives the request (DISC-01, DISC-04, DISC-05, DISC-07)", () => {
  it("sends the query, sort and both inclusive date ranges read from the URL", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage([
      "/collections/linux?q=wayland&sort=tweet_asc&tweet_from=2026-01-01&tweet_to=2026-09-01&saved_from=2026-09-20&saved_to=2026-09-27",
    ])

    await screen.findByTestId("gallery-masonry")

    const params = paramsOf(postsRequests(fetchMock)[0])
    expect(params.get("q")).toBe("wayland")
    expect(params.get("sort")).toBe("tweet_asc")
    expect(params.get("limit")).toBe("30")
    expect(params.get("tweet_from")).toBe(toUtcFrom("2026-01-01"))
    expect(params.get("tweet_to")).toBe(toUtcTo("2026-09-01"))
    expect(params.get("saved_from")).toBe(toUtcFrom("2026-09-20"))
    expect(params.get("saved_to")).toBe(toUtcTo("2026-09-27"))
  })

  it("shows the active dot for a filtered URL without any interaction", async () => {
    stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux?saved_from=2026-09-20&saved_to=2026-09-27"])

    await screen.findByTestId("gallery-masonry")
    expect(screen.getByTestId("collection-filter-dot")).toBeInTheDocument()
  })
})

describe("CollectionPage — search (DISC-01)", () => {
  it("debounces the typed text into one request and into the URL", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux"])
    await screen.findByTestId("gallery-masonry")

    const search = screen.getByTestId("collection-search")
    fireEvent.change(search, { target: { value: "lin" } })
    fireEvent.change(search, { target: { value: "linux" } })

    expect(search).toHaveValue("linux")
    expect(locationProbe()).not.toContain("q=")

    await waitFor(() => {
      expect(locationProbe()).toContain("q=linux")
    })
    await waitFor(() => {
      expect(
        postsRequests(fetchMock).some(
          (url) => paramsOf(url).get("q") === "linux"
        )
      ).toBe(true)
    })
    expect(
      postsRequests(fetchMock).some((url) => paramsOf(url).get("q") === "lin")
    ).toBe(false)
  })
})

describe("CollectionPage — filter panel (DISC-02, DISC-03, DISC-06)", () => {
  it("applies a manual Bookmarked range to the URL and the request", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux"])
    await screen.findByTestId("gallery-masonry")

    fireEvent.click(screen.getByTestId("collection-filter"))
    await screen.findByTestId("filter-panel")

    fireEvent.change(screen.getByLabelText("Bookmarked date from"), {
      target: { value: "2026-09-20" },
    })
    fireEvent.change(screen.getByLabelText("Bookmarked date to"), {
      target: { value: "2026-09-27" },
    })
    fireEvent.click(screen.getByTestId("filter-apply"))

    await waitFor(() => {
      expect(locationProbe()).toContain("saved_from=2026-09-20")
    })
    await waitFor(() => {
      expect(
        postsRequests(fetchMock).some((url) => {
          const params = paramsOf(url)
          return (
            params.get("saved_from") === toUtcFrom("2026-09-20") &&
            params.get("saved_to") === toUtcTo("2026-09-27")
          )
        })
      ).toBe(true)
    })
    expect(screen.getByTestId("collection-filter-dot")).toBeInTheDocument()
  })

  it("seeds the Bookmarked range from a quick preset", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux"])
    await screen.findByTestId("gallery-masonry")

    fireEvent.click(screen.getByTestId("collection-filter"))
    await screen.findByTestId("filter-panel")
    fireEvent.click(screen.getByRole("button", { name: "Last 7 Days" }))
    fireEvent.click(screen.getByTestId("filter-apply"))

    await waitFor(() => {
      expect(locationProbe()).toContain("saved_from=")
    })
    const applied = postsRequests(fetchMock).find((url) =>
      paramsOf(url).get("saved_from")
    )
    expect(applied).toBeDefined()
    const params = paramsOf(applied as string)
    expect(params.get("saved_to")).not.toBeNull()
    // A 7-day window: the two bounds are six days apart.
    const from = new Date(`${params.get("saved_from")}`)
    const to = new Date(`${params.get("saved_to")}`)
    expect(to.getTime() - from.getTime()).toBeGreaterThan(
      5 * 24 * 60 * 60 * 1000
    )
    expect(to.getTime() - from.getTime()).toBeLessThan(7 * 24 * 60 * 60 * 1000)
  })

  it("clears the applied filter through Reset + Apply", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux?saved_from=2026-09-20&saved_to=2026-09-27"])
    await screen.findByTestId("gallery-masonry")
    expect(screen.getByTestId("collection-filter-dot")).toBeInTheDocument()
    const requestsBeforeReset = postsRequests(fetchMock).length

    fireEvent.click(screen.getByTestId("collection-filter"))
    await screen.findByTestId("filter-panel")
    expect(screen.getByLabelText("Bookmarked date from")).toHaveValue(
      "2026-09-20"
    )

    fireEvent.click(screen.getByTestId("filter-reset"))
    fireEvent.click(screen.getByTestId("filter-apply"))

    await waitFor(() => {
      expect(locationProbe()).not.toContain("saved_from")
    })
    await waitFor(() => {
      expect(
        screen.queryByTestId("collection-filter-dot")
      ).not.toBeInTheDocument()
    })
    expect(
      postsRequests(fetchMock)
        .slice(requestsBeforeReset)
        .every((url) => paramsOf(url).get("saved_from") === null)
    ).toBe(true)
  })

  it("uses the Sheet below the md breakpoint (PRD-2 §66)", async () => {
    Object.defineProperty(window, "innerWidth", {
      value: 400,
      writable: true,
      configurable: true,
    })
    stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux"])
    await screen.findByTestId("gallery-masonry")

    fireEvent.click(screen.getByTestId("collection-filter"))

    expect(await screen.findByTestId("filter-sheet")).toBeInTheDocument()
    expect(screen.getByTestId("filter-panel")).toBeInTheDocument()
    expect(screen.queryByTestId("filter-popover")).not.toBeInTheDocument()
  })
})

describe("CollectionPage — sort (DISC-06)", () => {
  it("pushes the chosen sort into the URL and refetches with it", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux"])
    await screen.findByTestId("gallery-masonry")

    const user = userEvent.setup()
    await chooseSort(user, "Newest Posted")

    await waitFor(() => {
      expect(locationProbe()).toContain("sort=tweet_desc")
    })
    await waitFor(() => {
      expect(
        postsRequests(fetchMock).some(
          (url) => paramsOf(url).get("sort") === "tweet_desc"
        )
      ).toBe(true)
    })
  })

  it("restores the previous sort on Back and refetches", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux", "/collections/linux?sort=tweet_asc"], 1)
    await screen.findByTestId("gallery-masonry")
    expect(screen.getByTestId("collection-sort")).toHaveTextContent(
      "Oldest Posted"
    )

    fireEvent.click(screen.getByRole("button", { name: "History back" }))

    await waitFor(() => {
      expect(screen.getByTestId("collection-sort")).toHaveTextContent(
        "Newest Bookmarked"
      )
    })
    await waitFor(() => {
      expect(
        postsRequests(fetchMock).some(
          (url) => paramsOf(url).get("sort") === "saved_desc"
        )
      ).toBe(true)
    })
  })
})

describe("CollectionPage — empty states and reset (DISC-08, PRD-2 §77)", () => {
  it("shows the filter-no-match state with a working Clear filters", async () => {
    stubGalleryFetch({
      posts: filteredPostsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux?q=nothing-matches-this"])

    await screen.findByTestId("collection-filter-empty-state")
    expect(screen.getByTestId("collection-content")).toHaveAttribute(
      "data-view-state",
      "empty-filters"
    )
    expect(screen.getByText("No posts match your filters")).toBeInTheDocument()
    expect(screen.queryByTestId("post-card")).not.toBeInTheDocument()

    fireEvent.click(screen.getByRole("button", { name: "Clear filters" }))

    await screen.findByTestId("gallery-masonry")
    expect(screen.getAllByTestId("post-card")).toHaveLength(2)
    expect(locationProbe()).not.toContain("q=")
    expect(
      screen.queryByText("No posts match your filters")
    ).not.toBeInTheDocument()
  })

  it("skips the scroll reset on mount and scrolls to the top on a query change", async () => {
    const scrollTo = vi.spyOn(window, "scrollTo")
    stubGalleryFetch({
      posts: () =>
        jsonResponse({ items: POSTS, next_cursor: null, has_more: false }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage(["/collections/linux"])
    await screen.findByTestId("gallery-masonry")
    expect(scrollTo).not.toHaveBeenCalled()

    const user = userEvent.setup()
    await chooseSort(user, "Oldest Posted")

    await waitFor(() => {
      expect(scrollTo).toHaveBeenCalledTimes(1)
    })
    expect(scrollTo).toHaveBeenCalledWith({
      top: 0,
      left: 0,
      behavior: "auto",
    })
  })
})

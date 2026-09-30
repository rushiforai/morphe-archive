import { act, render, screen, waitFor, within } from "@testing-library/react"
import { MemoryRouter, Route, Routes } from "react-router-dom"
import { describe, expect, it, vi } from "vitest"

import { CollectionPage } from "./collection-page"
import {
  jsonResponse,
  makeCollection,
  makePost,
  stubGalleryFetch,
} from "@/test/fixtures"
import { MockIntersectionObserver } from "@/test/intersection-observer"

/**
 * SCROLL-01…SCROLL-05 end-to-end on the collection route: the sentinel drives
 * cursor paging, pages accumulate without duplicates, the first load is
 * skeleton-covered and later loads show only a compact bottom loader while the
 * existing cards stay mounted, the end of the list stops the requests, and a
 * focus refetch resets to page one.
 *
 * Every `fetch` is mocked and cursor-routed (no network, no server). The
 * `IntersectionObserver` is the controllable stub from `src/test/setup.ts`.
 */

const LINUX = makeCollection({
  slug: "linux",
  name: "Linux",
  post_count: 75,
  media_count: 3,
})

function page(ids: string[], nextCursor: string | null, hasMore: boolean) {
  return jsonResponse({
    items: ids.map((id) =>
      makePost({ tweet_id: id, username: `user-${id}`, text: `Post ${id}` })
    ),
    next_cursor: nextCursor,
    has_more: hasMore,
  })
}

const PAGE_1 = ["one", "two"]
const PAGE_2 = ["three", "four"]
const PAGE_3 = ["five"]

function renderPage() {
  return render(
    <MemoryRouter initialEntries={["/collections/linux"]}>
      <Routes>
        <Route path="/collections/:slug" element={<CollectionPage />} />
      </Routes>
    </MemoryRouter>
  )
}

function postsRequests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return fetchMock.mock.calls
    .map((call) => String(call[0]))
    .filter((url) => url.includes("/posts"))
}

function cursorOf(url: string): string | null {
  return new URL(url, "http://gallery.test").searchParams.get("cursor")
}

function logicalIndex(card: HTMLElement): number {
  return Number(card.closest("li")?.getAttribute("data-index") ?? "0")
}

/** Which masonry column (0-based, left to right) a card is currently in. */
function columnOf(card: HTMLElement): number {
  const column = card.closest("ul")
  const parent = column?.parentElement
  if (column == null || parent == null) {
    return -1
  }
  return Array.from(parent.children).indexOf(column)
}

/**
 * Cards in **logical** order. The masonry packs cards into flex columns and
 * renders them column by column, so DOM order is column-major; the logical
 * position is the `data-index` it stamps on each row. That is the order the API
 * returned, the order a single column reads top to bottom, and the order the
 * lightbox walks.
 */
function cardUsernames() {
  return screen
    .getAllByTestId("post-card")
    .slice()
    .sort((a, b) => logicalIndex(a) - logicalIndex(b))
    .map((card) => within(card).getByText(/@/).textContent)
}

function emitIntersection(isIntersecting = true) {
  return act(async () => {
    MockIntersectionObserver.latest()?.emit(isIntersecting)
  })
}

describe("CollectionPage — first-load and page-load affordances (SCROLL-02)", () => {
  it("shows masonry skeletons for the first load and no bottom loader", async () => {
    let resolvePage!: (response: Response) => void
    const pending = new Promise<Response>((resolve) => {
      resolvePage = resolve
    })
    stubGalleryFetch({
      posts: () => pending,
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    expect(screen.getByTestId("collection-content")).toHaveAttribute(
      "data-view-state",
      "loading"
    )
    expect(
      screen.getByRole("status", { name: "Loading posts" })
    ).toBeInTheDocument()
    expect(
      screen.queryByTestId("gallery-bottom-loader")
    ).not.toBeInTheDocument()

    await act(async () => {
      resolvePage(page(PAGE_1, "c1", true))
    })

    await screen.findByTestId("gallery-masonry")
    expect(screen.getAllByTestId("post-card")).toHaveLength(2)
    // The first page is not an "append": no bottom loader without a fetch.
    expect(
      screen.queryByTestId("gallery-bottom-loader")
    ).not.toBeInTheDocument()
  })

  it("keeps the loaded posts mounted under a bottom loader while page two loads", async () => {
    let resolvePage2!: (response: Response) => void
    const pending = new Promise<Response>((resolve) => {
      resolvePage2 = resolve
    })
    stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null ? page(PAGE_1, "c1", true) : pending,
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    expect(screen.getByText("@user-one")).toBeInTheDocument()

    await emitIntersection()

    // Mid-fetch: the small loader is present, the loaded cards are untouched,
    // and the full-page skeleton has NOT replaced them (PRD-2 §35).
    const loader = screen.getByTestId("gallery-bottom-loader")
    expect(loader).toHaveAttribute("role", "status")
    expect(loader).toHaveTextContent("Loading more posts")
    expect(screen.getByText("@user-one")).toBeInTheDocument()
    expect(screen.getByText("Post two")).toBeInTheDocument()
    expect(screen.getAllByTestId("post-card")).toHaveLength(2)
    expect(
      screen.queryByRole("status", { name: "Loading posts" })
    ).not.toBeInTheDocument()

    await act(async () => {
      resolvePage2(page(PAGE_2, null, false))
    })

    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })
    expect(
      screen.queryByTestId("gallery-bottom-loader")
    ).not.toBeInTheDocument()
    expect(cardUsernames()).toEqual([
      "@user-one",
      "@user-two",
      "@user-three",
      "@user-four",
    ])
  })

  it("does not render a Load More button or numbered pagination", async () => {
    stubGalleryFetch({
      posts: () => page(PAGE_1, null, false),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    expect(
      screen.queryByRole("button", { name: /load more/i })
    ).not.toBeInTheDocument()
    expect(screen.queryByRole("navigation")).not.toBeInTheDocument()
  })
})

describe("CollectionPage — sentinel-driven accumulation (SCROLL-01, SCROLL-03, SCROLL-04)", () => {
  it("requests exactly one extra page for repeated sentinel firings in flight", async () => {
    let resolvePage2!: (response: Response) => void
    const pending = new Promise<Response>((resolve) => {
      resolvePage2 = resolve
    })
    const fetchMock = stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null ? page(PAGE_1, "c1", true) : pending,
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    await emitIntersection()
    await emitIntersection()
    await emitIntersection()

    expect(postsRequests(fetchMock)).toHaveLength(2)
    expect(postsRequests(fetchMock)[1]).toContain("cursor=c1")

    await act(async () => {
      resolvePage2(page(PAGE_2, null, false))
    })
    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })
    expect(postsRequests(fetchMock)).toHaveLength(2)
  })

  it("accumulates three pages in order and stops when has_more is false", async () => {
    const fetchMock = stubGalleryFetch({
      posts: (url) => {
        const cursor = cursorOf(url)
        if (cursor === null) {
          return page(PAGE_1, "c1", true)
        }
        if (cursor === "c1") {
          return page(PAGE_2, "c2", true)
        }
        return page(PAGE_3, null, false)
      },
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    await emitIntersection()
    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })

    await emitIntersection()
    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(5)
    })

    expect(postsRequests(fetchMock)).toHaveLength(3)
    expect(postsRequests(fetchMock)[1]).toContain("cursor=c1")
    expect(postsRequests(fetchMock)[2]).toContain("cursor=c2")
    expect(
      postsRequests(fetchMock).every((url) => url.includes("limit=30"))
    ).toBe(true)
    // Order is stable across appends: each page follows the previous one.
    expect(cardUsernames()).toEqual([
      "@user-one",
      "@user-two",
      "@user-three",
      "@user-four",
      "@user-five",
    ])

    // The sentinel is disarmed at the end: firing it again changes nothing.
    await emitIntersection()
    expect(postsRequests(fetchMock)).toHaveLength(3)
  })

  it("does not loop when has_more is true with a null cursor", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () => page(PAGE_1, null, true),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    expect(postsRequests(fetchMock)).toHaveLength(1)

    await emitIntersection()

    expect(postsRequests(fetchMock)).toHaveLength(1)
    expect(screen.getAllByTestId("post-card")).toHaveLength(2)
    // The defensive stop leaves the sentinel with nothing observing it, so it
    // can never fire a request.
    expect(
      MockIntersectionObserver.instances.every(
        (observer) => observer.observedCount === 0
      )
    ).toBe(true)
  })

  it("renders an overlapping tweet_id once at its first-seen position", async () => {
    stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null
          ? jsonResponse({
              items: [
                makePost({
                  tweet_id: "d1",
                  username: "user-d1",
                  text: "first d1",
                }),
                makePost({
                  tweet_id: "d2",
                  username: "user-d2",
                  text: "first d2",
                }),
                makePost({
                  tweet_id: "d3",
                  username: "user-d3",
                  text: "first d3",
                }),
              ],
              next_cursor: "c1",
              has_more: true,
            })
          : jsonResponse({
              items: [
                makePost({
                  tweet_id: "d3",
                  username: "user-d3",
                  text: "duplicate d3",
                }),
                makePost({
                  tweet_id: "d4",
                  username: "user-d4",
                  text: "first d4",
                }),
              ],
              next_cursor: null,
              has_more: false,
            }),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    await emitIntersection()

    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })

    expect(cardUsernames()).toEqual([
      "@user-d1",
      "@user-d2",
      "@user-d3",
      "@user-d4",
    ])
    expect(screen.getByText("first d3")).toBeInTheDocument()
    expect(screen.queryByText("duplicate d3")).not.toBeInTheDocument()
  })

  it("marks the sentinel decorative and the loader a live status (a11y)", async () => {
    let resolvePage2!: (response: Response) => void
    const pending = new Promise<Response>((resolve) => {
      resolvePage2 = resolve
    })
    stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null ? page(PAGE_1, "c1", true) : pending,
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    const sentinel = screen.getByTestId("infinite-sentinel")
    expect(sentinel).toHaveAttribute("aria-hidden", "true")
    expect(sentinel).toBeEmptyDOMElement()

    await emitIntersection()

    const loader = screen.getByTestId("gallery-bottom-loader")
    expect(loader).toHaveAttribute("role", "status")
    expect(loader).toHaveTextContent("Loading more posts")
    expect(sentinel).toHaveAttribute("aria-hidden", "true")

    await act(async () => {
      resolvePage2(page(PAGE_2, null, false))
    })
  })

  it("keeps the exact masonry measures while pages are appended", async () => {
    stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null
          ? page(PAGE_1, "c1", true)
          : page(PAGE_2, null, false),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    const masonry = await screen.findByTestId("gallery-masonry")
    expect(masonry.style.columnGap).toBe("32px")

    // The packing memory lives outside the DOM, so the assignment of the cards
    // already on screen must survive the append untouched. This is the
    // regression the flex-column rewrite fixes: CSS multi-column re-balanced the
    // whole list, so page 2 re-distributed page 1 (measured in Chrome: 22 of 30
    // cards moved, up to 3106px).
    const columnsBefore = new Map(
      screen
        .getAllByTestId("post-card")
        .map((card) => [logicalIndex(card), columnOf(card)])
    )

    await emitIntersection()
    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })

    expect(masonry.style.columnGap).toBe("32px")
    expect(masonry.querySelector("ul")?.getAttribute("style")).toContain(
      "gap: 22px"
    )

    for (const card of screen.getAllByTestId("post-card")) {
      const index = logicalIndex(card)
      const before = columnsBefore.get(index)
      if (before !== undefined) {
        expect(columnOf(card)).toBe(before)
      }
    }
  })
})

describe("CollectionPage — refetch policy (SCROLL-05)", () => {
  it("resets to page one on window focus without duplicating posts", async () => {
    const fetchMock = stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null
          ? page(PAGE_1, "c1", true)
          : page(PAGE_2, null, false),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    await emitIntersection()
    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })

    act(() => {
      window.dispatchEvent(new Event("focus"))
    })

    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(2)
    })

    const usernames = cardUsernames()
    expect(usernames).toEqual(["@user-one", "@user-two"])
    expect(new Set(usernames).size).toBe(2)
    // The focus refetch went back to page one (no cursor) — paging was reset.
    const lastRequest = postsRequests(fetchMock).at(-1)
    expect(lastRequest).not.toContain("cursor=")
  })

  it("does not move the viewport when a page is appended", async () => {
    const scrollTo = vi.spyOn(window, "scrollTo")
    stubGalleryFetch({
      posts: (url) =>
        cursorOf(url) === null
          ? page(PAGE_1, "c1", true)
          : page(PAGE_2, null, false),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    expect(scrollTo).not.toHaveBeenCalled()

    await emitIntersection()
    await waitFor(() => {
      expect(screen.getAllByTestId("post-card")).toHaveLength(4)
    })

    expect(scrollTo).not.toHaveBeenCalled()
  })

  it("never polls: no request is issued without an intersection or focus", async () => {
    const fetchMock = stubGalleryFetch({
      posts: () => page(PAGE_1, "c1", true),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    expect(postsRequests(fetchMock)).toHaveLength(1)

    // Give any (incorrect) timer-driven refetch ample real time to fire.
    await act(async () => {
      await new Promise((resolve) => setTimeout(resolve, 120))
    })

    expect(postsRequests(fetchMock)).toHaveLength(1)
  })
})

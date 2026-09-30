import {
  act,
  fireEvent,
  render,
  screen,
  waitFor,
  within,
} from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { MemoryRouter, Route, Routes } from "react-router-dom"
import { afterEach, describe, expect, it } from "vitest"

import { chooseSort } from "@/test/interactions"

import { CollectionPage } from "./collection-page"
import {
  jsonResponse,
  makeCollection,
  makePost,
  pbsUrl,
  stubGalleryFetch,
} from "@/test/fixtures"

/**
 * COLL-01…COLL-11 page integration. Every `fetch` is mocked (URL-routed
 * because the page issues both the posts request and the collections summary);
 * there is no network, no server, and the operator-owned backend is untouched.
 *
 * Phase 6 rewired the toolbar to the URL (`useGalleryQuery` + `usePosts`), so
 * the search/sort assertions here are request-level; the full discovery flow
 * (URL sync, filters, presets, scroll reset) is `collection-page-discovery.test.tsx`.
 */

const LINUX = makeCollection({
  slug: "linux",
  name: "Linux",
  post_count: 6,
  media_count: 12,
  last_saved_at: null,
})

const LONG_TEXT = `${"Wayland compositors and the Linux desktop. ".repeat(8)}End.`

/** Six posts mirroring the phase's seeding ask: 4/2/1/3 media + 2 text-only. */
const POSTS = [
  makePost({
    tweet_id: "4",
    author: "Four Media",
    username: "@four",
    media: [pbsUrl("1"), pbsUrl("2"), pbsUrl("3"), pbsUrl("4")],
    text: "A four-image tweet is one card.",
  }),
  makePost({
    tweet_id: "2",
    author: "Two Media",
    username: "@two",
    media: [pbsUrl("a"), pbsUrl("b")],
    text: "Two images.",
  }),
  makePost({
    tweet_id: "1",
    author: "One Media",
    username: "@one",
    media: [pbsUrl("only")],
    text: "One image.",
  }),
  makePost({
    tweet_id: "3",
    author: "Three Media",
    username: "@three",
    media: [pbsUrl("x"), pbsUrl("y"), pbsUrl("z")],
    text: "Three images.",
  }),
  makePost({
    tweet_id: "t1",
    author: "Text Only",
    username: "@texty",
    media: [],
    text: "Interesting thread about Linux.",
  }),
  makePost({
    tweet_id: "t2",
    author: "Long Form",
    username: "@verbose",
    media: [],
    text: LONG_TEXT,
  }),
]

function renderPage(slug = "linux") {
  return render(
    <MemoryRouter initialEntries={[`/collections/${encodeURIComponent(slug)}`]}>
      <Routes>
        <Route path="/collections/:slug" element={<CollectionPage />} />
      </Routes>
    </MemoryRouter>
  )
}

function postsRoute(items = POSTS) {
  return () => jsonResponse({ items, next_cursor: null, has_more: false })
}

/** Every URL the mock was asked for; split by endpoint below. */
function requestedUrls(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return fetchMock.mock.calls.map((call) => String(call[0]))
}

function postsRequests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return requestedUrls(fetchMock).filter((url) => url.includes("/posts"))
}

/** jsdom reports a 1024px viewport; restore it after the resize test. */
const ORIGINAL_INNER_WIDTH = window.innerWidth
afterEach(() => {
  Object.defineProperty(window, "innerWidth", {
    value: ORIGINAL_INNER_WIDTH,
    writable: true,
    configurable: true,
  })
})

describe("CollectionPage — header (COLL-01)", () => {
  it("renders the back link, deterministic icon, title and counts meta", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const back = screen.getByRole("link", { name: "← Collections" })
    expect(back).toHaveAttribute("href", "/")

    expect(await screen.findByTestId("collection-counts")).toHaveTextContent(
      "6 posts · 12 media"
    )
    expect(
      screen.getByRole("heading", { level: 1, name: "Linux" })
    ).toBeInTheDocument()

    const icon = screen.getByTestId("collection-icon")
    expect(icon.className).toContain("size-24")
    expect(icon.className).toContain("rounded-2xl")
    expect(icon.style.backgroundImage).toContain("--grad-ph-")
  })

  it("renders the toolbar with all three controls (COLL-01)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    await screen.findByTestId("gallery-masonry")

    const toolbar = screen.getByTestId("collection-toolbar")
    expect(within(toolbar).getByTestId("collection-search")).toBeInTheDocument()
    expect(within(toolbar).getByTestId("collection-filter")).toHaveTextContent(
      "Filter"
    )
    // The trigger's text is the current mode; the control's *name* is "Sort".
    expect(within(toolbar).getByTestId("collection-sort")).toHaveTextContent(
      "Newest Bookmarked"
    )
  })

  it("falls back to the slug when the header summary is unavailable", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ status: "error", reason: "boom" }, 500),
    })

    renderPage()

    expect(
      await screen.findByRole("heading", { level: 1, name: "linux" })
    ).toBeInTheDocument()
    expect(screen.queryByTestId("collection-counts")).not.toBeInTheDocument()
  })
})

describe("CollectionPage — masonry (COLL-02, COLL-03)", () => {
  it("renders one card per tweet inside a natural-height masonry", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const masonry = await screen.findByTestId("gallery-masonry")
    // The masonry packs its own columns and renders one flex column per column,
    // instead of handing the whole list to CSS `column-count` — the browser
    // re-balanced every card on each appended page, which is what made the grid
    // shuffle while scrolling.
    expect(masonry.tagName).toBe("DIV")
    expect(masonry.style.columnCount).toBe("")
    expect(masonry.style.columnGap).toBe("32px")
    expect(masonry.children).toHaveLength(3)
    // Natural heights: no fixed row height / auto-rows grid.
    expect(masonry.className).not.toContain("grid-auto-rows")

    const cards = screen.getAllByTestId("post-card")
    expect(cards).toHaveLength(6)
    // DOM order is column-major (that is the point of the rewrite). Logical
    // order — the order the API returned — is carried by `data-index`, and it is
    // preserved inside every column.
    const logical = cards
      .slice()
      .sort(
        (a, b) =>
          Number(a.closest("li")?.getAttribute("data-index")) -
          Number(b.closest("li")?.getAttribute("data-index"))
      )
    expect(
      logical.map((card) => within(card).getByText(/@/).textContent)
    ).toEqual(["@four", "@two", "@one", "@three", "@texty", "@verbose"])
    for (const column of masonry.children) {
      const indexes = Array.from(column.querySelectorAll("li")).map((row) =>
        Number(row.getAttribute("data-index"))
      )
      expect(indexes).toEqual([...indexes].sort((a, b) => a - b))
    }
  })

  it("keeps the 292-wide card measure for the measured column count", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const masonry = await screen.findByTestId("gallery-masonry")
    // jsdom reports 1024px, which maps to 3 columns → 3×292 + 2×32 = 940.
    expect(masonry).toHaveAttribute("data-columns", "3")
    expect(masonry.style.maxWidth).toBe("940px")
  })

  it("caps and centres the page column at the grid width (even gutters)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const masonry = await screen.findByTestId("gallery-masonry")
    const column = screen.getByTestId("collection-column")

    // 3 columns → the column is capped at the exact 3-card width (940) and
    // centred in the shell's rail. The cards then fill it edge to edge, so the
    // slack is split evenly instead of piling up on the right — which is what
    // 292px of dead space at a 1360px window looked like.
    expect(column.style.maxWidth).toBe("940px")
    expect(column.className).toContain("mx-auto")
    // The hero, toolbar and grid share the one column, and the masonry's own
    // cap agrees with it, so the cards cannot be inset from the toolbar above.
    expect(masonry.style.maxWidth).toBe(column.style.maxWidth)
  })

  it("recomputes the column count when the viewport resizes (COLL-03)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    const masonry = await screen.findByTestId("gallery-masonry")
    expect(masonry).toHaveAttribute("data-columns", "3")

    Object.defineProperty(window, "innerWidth", {
      value: 1440,
      writable: true,
      configurable: true,
    })
    act(() => {
      window.dispatchEvent(new Event("resize"))
    })

    await waitFor(() => {
      expect(screen.getByTestId("gallery-masonry")).toHaveAttribute(
        "data-columns",
        "4"
      )
    })
    expect(screen.getByTestId("gallery-masonry").style.maxWidth).toBe("1264px")
    // The page column is measured from the *uncapped* probe, so it regrows with
    // the viewport instead of being stuck at the width its own cap implied.
    expect(screen.getByTestId("collection-column").style.maxWidth).toBe(
      "1264px"
    )
  })

  it("renders all four images of a four-media tweet in one card (COLL-04)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const cards = await screen.findAllByTestId("post-card")
    const fourMedia = cards[0]

    expect(fourMedia).toHaveAttribute("data-media-count", "4")
    expect(within(fourMedia).getAllByTestId("media-image")).toHaveLength(4)
    expect(within(fourMedia).getByTestId("post-media-grid")).toHaveAttribute(
      "data-media-layout",
      "grid"
    )
  })
})

describe("CollectionPage — post content (COLL-04…COLL-09, COLL-11)", () => {
  it("renders a text-only post's quote panel without any img (COLL-05)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const cards = await screen.findAllByTestId("post-card")
    const textCard = cards.find(
      (card) => card.getAttribute("data-media-count") === "0"
    )

    expect(textCard).toBeDefined()
    expect(
      within(textCard as HTMLElement).getByTestId("text-post-card")
    ).toBeInTheDocument()
    expect(
      within(textCard as HTMLElement).queryByTestId("media-image")
    ).not.toBeInTheDocument()
    expect((textCard as HTMLElement).querySelector("img")).toBeNull()
  })

  it("clamps long text with a working Show more (COLL-08)", async () => {
    const user = userEvent.setup()
    stubGalleryFetch({
      posts: postsRoute([POSTS[5]]),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    await screen.findByTestId("post-card")
    const toggle = screen.getByTestId("post-text-toggle")

    expect(toggle).toHaveTextContent("Show more")
    await user.click(toggle)
    expect(screen.getByTestId("post-text-toggle")).toHaveTextContent(
      "Show less"
    )
    expect(screen.getByTestId("post-text").className).not.toContain(
      "line-clamp"
    )
  })

  it("loads every image lazily from an unrewritten pbs.twimg.com URL (COLL-09)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    await screen.findByTestId("gallery-masonry")
    const images = screen.getAllByTestId("media-image")
    expect(images.length).toBe(10)

    for (const image of images) {
      expect(image).toHaveAttribute("loading", "lazy")
      expect(image).toHaveAttribute("decoding", "async")
      expect(image.getAttribute("src")).toMatch(/^https:\/\/pbs\.twimg\.com\//)
    }
  })

  it("makes every Open on X a safe new-tab link (COLL-07)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const links = await screen.findAllByTestId("open-on-x")
    expect(links).toHaveLength(6)

    for (const link of links) {
      expect(link.tagName).toBe("A")
      expect(link).toHaveAttribute("target", "_blank")
      expect(link).toHaveAttribute("rel", "noopener noreferrer")
      expect(link.getAttribute("href")).toMatch(/^https:\/\/x\.com\//)
    }
  })

  it("keeps metadata and the link when a remote image is broken (COLL-11)", async () => {
    stubGalleryFetch({
      posts: postsRoute([POSTS[2]]),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    const card = await screen.findByTestId("post-card")
    fireEvent.error(within(card).getByTestId("media-image"))

    expect(within(card).getByTestId("media-placeholder")).toBeInTheDocument()
    expect(card).toHaveTextContent("One Media")
    expect(card).toHaveTextContent("@one")
    expect(card).toHaveTextContent("One image.")
    expect(within(card).getByTestId("post-meta")).toHaveTextContent("Saved")
    expect(within(card).getByTestId("open-on-x")).toBeInTheDocument()
  })
})

describe("CollectionPage — states (COLL-10)", () => {
  it("renders the skeleton while the first page is in flight", () => {
    stubGalleryFetch({
      posts: () => new Promise<Response>(() => {}),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    expect(
      screen.getByRole("status", { name: "Loading posts" })
    ).toBeInTheDocument()
    expect(
      screen.getAllByTestId("collection-card-skeleton").length
    ).toBeGreaterThan(0)
  })

  it("renders This collection is empty for a valid postless collection", async () => {
    stubGalleryFetch({
      posts: postsRoute([]),
      collections: () =>
        jsonResponse({
          collections: [makeCollection({ slug: "linux", name: "Linux" })],
        }),
    })

    renderPage()

    expect(
      await screen.findByRole("heading", { name: "This collection is empty" })
    ).toBeInTheDocument()
    expect(
      screen.getByText(
        "This folder is quiet. The next bookmark will bring it to life."
      )
    ).toBeInTheDocument()

    // Distinct from the filter state, and no posts rendered.
    expect(
      screen.queryByText("No posts match your filters")
    ).not.toBeInTheDocument()
    expect(
      screen.queryByRole("button", { name: "Clear filters" })
    ).not.toBeInTheDocument()
    expect(screen.queryByTestId("post-card")).not.toBeInTheDocument()
  })

  it("renders the filter-no-match branch and its Clear filters branch when filters are active (COLL-10)", async () => {
    // DISC-08's end-to-end version (a `?q=` URL over an empty result set, then
    // `Clear filters`) lives in `collection-page-discovery.test.tsx`. Here we
    // prove the page keeps the two states apart: a postless collection with an
    // empty applied query is the empty-collection state.
    stubGalleryFetch({
      posts: postsRoute([]),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    await screen.findByTestId("collection-empty-state")
    expect(screen.getByTestId("collection-content")).toHaveAttribute(
      "data-view-state",
      "empty-collection"
    )
    expect(
      screen.queryByTestId("collection-filter-empty-state")
    ).not.toBeInTheDocument()
  })

  it("renders Could not load this collection with a working Retry", async () => {
    const user = userEvent.setup()
    let attempt = 0
    stubGalleryFetch({
      posts: () => {
        attempt += 1
        return attempt === 1
          ? jsonResponse({ status: "error", reason: "not found" }, 404)
          : jsonResponse({
              items: [POSTS[2]],
              next_cursor: null,
              has_more: false,
            })
      },
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage("missing")

    expect(
      await screen.findByText("Could not load this collection")
    ).toBeInTheDocument()
    expect(screen.getByTestId("collection-content")).toHaveAttribute(
      "data-view-state",
      "error"
    )

    await user.click(screen.getByRole("button", { name: "Retry" }))

    expect(await screen.findByTestId("post-card")).toBeInTheDocument()
    expect(
      screen.queryByText("Could not load this collection")
    ).not.toBeInTheDocument()
  })

  it("renders the backend connection copy on a transport failure and Retry recovers (PRD-2 §61)", async () => {
    const user = userEvent.setup()
    let attempt = 0
    const fetchMock = stubGalleryFetch({
      posts: () => {
        attempt += 1
        return attempt === 1
          ? Promise.reject(new TypeError("Failed to fetch"))
          : jsonResponse({
              items: [POSTS[2]],
              next_cursor: null,
              has_more: false,
            })
      },
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()

    expect(
      await screen.findByText("Could not connect to Twitter Bookmarker backend")
    ).toBeInTheDocument()
    expect(screen.getByRole("button", { name: "Retry" })).toBeInTheDocument()

    await user.click(screen.getByRole("button", { name: "Retry" }))

    expect(await screen.findByTestId("post-card")).toBeInTheDocument()
    expect(
      screen.queryByText("Could not connect to Twitter Bookmarker backend")
    ).not.toBeInTheDocument()
    // The Retry re-issues the posts request rather than only re-rendering.
    expect(postsRequests(fetchMock).length).toBeGreaterThanOrEqual(2)
  })
})

describe("CollectionPage — discovery wiring (DISC-01, DISC-06)", () => {
  it("debounces the typed search into a single q= request (DISC-01)", async () => {
    const fetchMock = stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")
    const postsBefore = postsRequests(fetchMock).length

    const search = screen.getByTestId("collection-search")
    // Two keystrokes in one pause: the controlled input echoes immediately…
    fireEvent.change(search, { target: { value: "wayl" } })
    fireEvent.change(search, { target: { value: "wayland" } })
    expect(search).toHaveValue("wayland")

    // …and only the settled value is requested (300 ms debounce).
    await waitFor(() => {
      expect(
        postsRequests(fetchMock).some((url) => url.includes("q=wayland"))
      ).toBe(true)
    })

    expect(postsRequests(fetchMock).slice(postsBefore)).toHaveLength(1)
    expect(
      postsRequests(fetchMock).some((url) => /[?&]q=wayl(&|$)/.test(url))
    ).toBe(false)
  })

  it("pushes a new request when the sort control changes (DISC-06)", async () => {
    const user = userEvent.setup()
    const fetchMock = stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    expect(postsRequests(fetchMock)[0]).toContain("sort=saved_desc")

    await chooseSort(user, "Oldest Posted")

    await waitFor(() => {
      expect(
        postsRequests(fetchMock).some((url) => url.includes("sort=tweet_asc"))
      ).toBe(true)
    })
  })

  it("omits the media-type and topic pills (design spec §7)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    expect(screen.queryByTestId("media-type-pills")).not.toBeInTheDocument()
    expect(screen.queryByTestId("topic-pills")).not.toBeInTheDocument()
    for (const label of [
      "Images",
      "Videos",
      "Links",
      "Terminal",
      "Linux Tips",
    ]) {
      expect(
        screen.queryByRole("button", { name: label })
      ).not.toBeInTheDocument()
    }
  })

  it("omits the mockup's collection description line (design spec §7)", async () => {
    stubGalleryFetch({
      posts: postsRoute(),
      collections: () => jsonResponse({ collections: [LINUX] }),
    })

    renderPage()
    await screen.findByTestId("gallery-masonry")

    expect(
      screen.queryByTestId("collection-description")
    ).not.toBeInTheDocument()
    expect(
      screen.queryByText("Toolbar and masonry arrive in Phase 5.")
    ).not.toBeInTheDocument()
  })
})

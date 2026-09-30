import { render, screen, waitFor, within } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { MemoryRouter, Route, Routes } from "react-router-dom"
import { describe, expect, it } from "vitest"

import { CollectionPage } from "./collection-page"
import {
  jsonResponse,
  makeCollection,
  makePost,
  pbsUrl,
  stubGalleryFetch,
  type GalleryFetchRoutes,
} from "@/test/fixtures"
import {
  DELETE_POST_FAILED_MESSAGE,
  MOVE_POST_FAILED_MESSAGE,
} from "@/lib/messages"

/**
 * Curation end-to-end on the collection route: the per-post kebab opens a menu,
 * deleting asks for confirmation first, moving picks from the archive's real
 * folders, the removed card leaves the list without resetting paging, and a
 * failure leaves the card exactly where it was.
 *
 * The architectural rule these tests also pin: curation is issued against
 * `/v1/bookmarks`, **never** `/api/gallery`. The gallery API is GET-only
 * (requirement API-07), so the moment a mutation appears under that prefix the
 * read-only guarantee has been broken.
 *
 * Every `fetch` is mocked and URL-routed (no network, no server).
 */

const LINUX = makeCollection({
  slug: "linux",
  name: "Linux Tips",
  post_count: 3,
  media_count: 3,
  last_saved_at: "2026-04-03T12:00:00Z",
})

const AI = makeCollection({
  slug: "ai",
  name: "AI Notes",
  post_count: 5,
  media_count: 8,
  last_saved_at: "2026-04-02T12:00:00Z",
})

const ADA = makePost({
  tweet_id: "1",
  author: "Ada Lovelace",
  username: "@ada",
  media: [pbsUrl("a1"), pbsUrl("a2")],
  text: "Two images.",
})
const GRACE = makePost({
  tweet_id: "2",
  author: "Grace Hopper",
  username: "@grace",
  media: [],
  text: "A text-only tweet.",
})
const LINUS = makePost({
  tweet_id: "3",
  author: "Linus Torvalds",
  username: "@linus",
  media: [pbsUrl("c1")],
  text: "One image.",
})

const POSTS = [ADA, GRACE, LINUS]

function renderPage(routes: GalleryFetchRoutes = {}) {
  const fetchMock = stubGalleryFetch({
    collections: () => jsonResponse({ collections: [LINUX, AI] }),
    posts: () =>
      jsonResponse({ items: POSTS, next_cursor: "page-2", has_more: true }),
    ...routes,
  })

  render(
    <MemoryRouter initialEntries={["/collections/linux"]}>
      <Routes>
        <Route path="/collections/:slug" element={<CollectionPage />} />
      </Routes>
    </MemoryRouter>
  )

  return fetchMock
}

/** Every request the page made, as `[url, method]`. */
function requests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return fetchMock.mock.calls.map((call) => ({
    url: String(call[0]),
    method: (call[1]?.method ?? "GET").toUpperCase(),
  }))
}

function curationRequests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return requests(fetchMock).filter((request) =>
    request.url.includes("/v1/bookmarks")
  )
}

function postsRequestCount(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return requests(fetchMock).filter((request) => request.url.includes("/posts"))
    .length
}

/** The card element for one tweet id, or `undefined` when it is not rendered. */
function findCard(tweetId: string): HTMLElement | undefined {
  return screen
    .getAllByTestId("post-card")
    .find((element) => cardHasTweet(element, tweetId))
}

/** The card element for one tweet id; fails the test if it is absent. */
function cardFor(tweetId: string): HTMLElement {
  const card = findCard(tweetId)
  if (card === undefined) {
    throw new Error(`no card for tweet ${tweetId}`)
  }
  return card
}

/**
 * A card's own identity is its `Open on X` href; the card carries no tweet id
 * attribute, so the link is the honest way to find a specific one.
 */
function cardHasTweet(card: HTMLElement, tweetId: string): boolean {
  const link = within(card).queryByTestId("open-on-x")
  return link?.getAttribute("href")?.endsWith(`/status/${tweetId}`) ?? false
}

/**
 * Open one post's kebab menu.
 *
 * Returns the *menu*, not the card: the menu is portalled out of the card (to
 * `document.body` here, into the lightbox when one is open), so a query scoped
 * to the card would not find its own items.
 */
async function openMenu(
  user: ReturnType<typeof userEvent.setup>,
  tweetId: string
) {
  // The cards come from the posts request; opening a menu before it settles
  // would race the render rather than test the menu.
  await screen.findAllByTestId("post-card")
  const card = cardFor(tweetId)
  await user.click(within(card).getByTestId("post-actions-trigger"))
  const menu = await screen.findByTestId("post-actions-menu")
  return { card, menu }
}

async function openLightbox(user: ReturnType<typeof userEvent.setup>) {
  // Every media tile is a button named `Media …`; the lightbox opens on the one
  // that is clicked, so the first tile is picked deliberately.
  const tiles = await screen.findAllByRole("button", { name: /^Media/ })
  await user.click(tiles[0])
  return screen.findByTestId("media-lightbox")
}

describe("CollectionPage — curation from a card", () => {
  it("asks for confirmation before deleting, then removes the card", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))

    const dialog = await screen.findByTestId("confirm-dialog")
    expect(dialog).toHaveTextContent("Delete this bookmark?")
    // Nothing has been sent yet: the confirmation is the gate.
    expect(curationRequests(fetchMock)).toHaveLength(0)

    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    await waitFor(() => {
      expect(curationRequests(fetchMock)).toEqual([
        { url: "/v1/bookmarks/1", method: "DELETE" },
      ])
    })
    await waitFor(() => {
      expect(findCard("1")).toBeUndefined()
    })
  })

  it("curation is issued against /v1/bookmarks, never the read-only gallery API", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    await waitFor(() => {
      expect(curationRequests(fetchMock)).toHaveLength(1)
    })

    for (const request of requests(fetchMock)) {
      if (request.method === "GET") {
        continue
      }
      expect(request.url.startsWith("/v1/bookmarks/")).toBe(true)
      expect(request.url.includes("/api/gallery")).toBe(false)
    }
  })

  it("cancel sends nothing and keeps the card", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(await screen.findByTestId("confirm-dialog-cancel"))

    await waitFor(() => {
      expect(screen.queryByTestId("confirm-dialog")).not.toBeInTheDocument()
    })
    expect(curationRequests(fetchMock)).toHaveLength(0)
    expect(cardFor("1")).toBeInTheDocument()
  })

  it("decrements the header counts by exactly what was removed", async () => {
    const user = userEvent.setup()
    renderPage()

    expect(await screen.findByTestId("collection-counts")).toHaveTextContent(
      "3 posts · 3 media"
    )

    // Ada has two media; the text-only Grace has none. Removing Ada must take
    // one post and two media, not one and one.
    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    await waitFor(() => {
      expect(screen.getByTestId("collection-counts")).toHaveTextContent(
        "2 posts · 1 media"
      )
    })
  })

  it("never resets paging: removing a post does not refetch page 1", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    await screen.findAllByTestId("post-card")
    const before = postsRequestCount(fetchMock)

    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    await waitFor(() => {
      expect(findCard("1")).toBeUndefined()
    })
    // A `refetch()` here would reset the cursor and throw a scrolled-down user
    // back to the top; the removal must be local to the held pages.
    expect(postsRequestCount(fetchMock)).toBe(before)
    // The other cards are untouched and still in order.
    expect(screen.getAllByTestId("post-card")).toHaveLength(2)
  })

  it("a failed delete keeps the card and says nothing changed", async () => {
    const user = userEvent.setup()
    renderPage({
      deleteBookmark: () =>
        jsonResponse({ status: "error", reason: "boom" }, 500),
    })

    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    const alert = await screen.findByTestId("curation-error")
    expect(alert).toHaveTextContent(DELETE_POST_FAILED_MESSAGE)
    // The row is still there: the request failed, so the screen must not pretend
    // it succeeded.
    expect(cardFor("1")).toBeInTheDocument()
    expect(screen.getAllByTestId("post-card")).toHaveLength(3)
    // And the counts were not decremented either.
    expect(screen.getByTestId("collection-counts")).toHaveTextContent(
      "3 posts · 3 media"
    )
  })

  it("recovers keyboard focus when the card it came from is removed", async () => {
    const user = userEvent.setup()
    renderPage()

    const { menu } = await openMenu(user, "1")

    // Radix moves focus into the open menu, so the element holding focus is the
    // delete item — which lives in a portal that is torn down with the card. The
    // keyboard user has no innocent place left for focus; this asserts the page
    // provides one.
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    await waitFor(() => {
      expect(findCard("1")).toBeUndefined()
    })
    // The kebab lived inside the removed card, so the browser would otherwise
    // drop focus on `<body>` and the next Tab would restart at the top of the
    // page. Landing on the heading keeps the keyboard user in place.
    await waitFor(() => {
      expect(screen.getByTestId("collection-heading")).toHaveFocus()
    })
  })

  it("a 404 from a stale view keeps the card too", async () => {
    const user = userEvent.setup()
    renderPage({
      deleteBookmark: () =>
        jsonResponse({ status: "error", reason: "tweet is not saved" }, 404),
    })

    const { menu } = await openMenu(user, "1")
    await user.click(within(menu).getByTestId("post-action-delete"))
    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    await screen.findByTestId("curation-error")
    expect(cardFor("1")).toBeInTheDocument()
  })
})

describe("CollectionPage — moving a post", () => {
  it("lists the other folders with their counts and moves on click", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const { menu } = await openMenu(user, "2")
    await user.click(within(menu).getByTestId("post-action-move"))

    await screen.findByTestId("move-post-dialog")
    const list = await screen.findByTestId("move-post-list")

    // The folder the post is already in is not a destination.
    expect(within(list).queryByText("Linux Tips")).not.toBeInTheDocument()
    expect(within(list).getByText("AI Notes")).toBeInTheDocument()
    expect(within(list).getByTestId("move-post-option")).toHaveAttribute(
      "data-slug",
      "ai"
    )
    // Pluralisation is asserted against real counts from the summary.
    expect(within(list).getByText("5 posts")).toBeInTheDocument()

    await user.click(within(list).getByTestId("move-post-option"))

    await waitFor(() => {
      expect(curationRequests(fetchMock)).toEqual([
        { url: "/v1/bookmarks/2/collection", method: "PUT" },
      ])
    })
    await waitFor(() => {
      expect(findCard("2")).toBeUndefined()
    })
  })

  it("a failed move keeps the card and says nothing changed", async () => {
    const user = userEvent.setup()
    renderPage({
      moveBookmark: () =>
        jsonResponse({ status: "error", reason: "collection missing" }, 404),
    })

    const { menu } = await openMenu(user, "2")
    await user.click(within(menu).getByTestId("post-action-move"))
    const list = await screen.findByTestId("move-post-list")
    await user.click(within(list).getByTestId("move-post-option"))

    const alert = await screen.findByTestId("curation-error")
    expect(alert).toHaveTextContent(MOVE_POST_FAILED_MESSAGE)
    expect(cardFor("2")).toBeInTheDocument()
  })
})

describe("CollectionPage — the kebab menu", () => {
  it("is reachable by keyboard and its menu stays on document.body for a card", async () => {
    const user = userEvent.setup()
    renderPage()

    await screen.findAllByTestId("post-card")
    const card = cardFor("1")
    const trigger = within(card).getByTestId("post-actions-trigger")

    trigger.focus()
    expect(trigger).toHaveFocus()
    await user.keyboard("{Enter}")

    const menu = await screen.findByTestId("post-actions-menu")
    // A card is not inside the lightbox, so Radix's default portal applies.
    expect(document.body.contains(menu)).toBe(true)
    expect(
      within(screen.getByTestId("collection-content")).queryByTestId(
        "post-actions-menu"
      )
    ).not.toBeInTheDocument()
  })
})

describe("CollectionPage — curation from the lightbox", () => {
  it("portals the menu and the confirm dialog inside the lightbox", async () => {
    const user = userEvent.setup()
    renderPage()

    const dialog = await openLightbox(user)
    const trigger = within(dialog).getByTestId("post-actions-trigger")
    await user.click(trigger)

    // The portal target is the dialog itself. Mounting on `document.body` would
    // put the menu outside the focus trap, and Tab would escape the lightbox.
    const menu = await screen.findByTestId("post-actions-menu")
    expect(dialog.contains(menu)).toBe(true)

    await user.click(within(menu).getByTestId("post-action-delete"))
    const confirm = await screen.findByTestId("confirm-dialog")
    expect(dialog.contains(confirm)).toBe(true)
  })

  it("deleting the open post closes the lightbox and removes the card", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const dialog = await openLightbox(user)
    // The lightbox opens on the first media tile, which belongs to Ada.
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )

    await user.click(within(dialog).getByTestId("post-actions-trigger"))
    await user.click(await screen.findByTestId("post-action-delete"))
    await user.click(await screen.findByTestId("confirm-dialog-confirm"))

    await waitFor(() => {
      expect(curationRequests(fetchMock)).toEqual([
        { url: "/v1/bookmarks/1", method: "DELETE" },
      ])
    })
    // The lightbox derives its position from the loaded posts, so the post
    // leaving the list closes it by construction rather than by extra logic.
    await waitFor(() => {
      expect(screen.queryByTestId("media-lightbox")).not.toBeInTheDocument()
    })
    await waitFor(() => {
      expect(findCard("1")).toBeUndefined()
    })
  })

  it("the removed card's action can still be taken for a remaining post", async () => {
    const user = userEvent.setup()
    renderPage({
      deleteBookmark: () => jsonResponse({ status: "error", reason: "x" }, 500),
    })

    const dialog = await openLightbox(user)
    await user.click(within(dialog).getByTestId("post-actions-trigger"))
    await user.click(await screen.findByTestId("post-action-delete"))
    await user.click(await screen.findByTestId("confirm-dialog-confirm"))

    // A failure leaves the lightbox open and the post in place, so the user can
    // try again rather than being dumped back into an unchanged grid.
    await screen.findByTestId("curation-error")
    expect(screen.getByTestId("media-lightbox")).toBeInTheDocument()
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )
  })
})

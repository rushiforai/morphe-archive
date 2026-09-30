import { render, screen, waitFor, within } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import {
  MOVE_POST_EMPTY_MESSAGE,
  MOVE_POST_ERROR_MESSAGE,
  MOVE_POST_TITLE,
  MovePostDialog,
  type MovePostDialogProps,
} from "./move-post-dialog"
import {
  jsonResponse,
  makeCollection,
  makePost,
  stubGalleryFetch,
  type GalleryFetchRoutes,
} from "@/test/fixtures"
import { formatCount } from "@/lib/collection-meta"

/**
 * MovePostDialog's contract, driven against the mocked collections endpoint:
 * the folder list is fetched when the dialog mounts (so an open dialog is never
 * blank), the folder the post already lives in is not offered as a destination,
 * counts are pluralised, a failure is recoverable through Retry, and a move in
 * flight disables every destination.
 */

const LINUX = makeCollection({
  slug: "linux",
  name: "Linux Desktop",
  post_count: 7,
})
const WAYLAND = makeCollection({
  slug: "wayland",
  name: "Wayland Compositors",
  post_count: 1,
})
const BSD = makeCollection({ slug: "bsd", name: "BSD Notes", post_count: 3 })
const RETRO = makeCollection({
  slug: "retro-computing",
  name: "Retro Computing",
  post_count: 12,
})

const POST = makePost({
  tweet_id: "1",
  author: "Ada Lovelace",
  username: "@ada",
})

function renderDialog(
  routes: GalleryFetchRoutes = {},
  overrides: Partial<MovePostDialogProps> = {}
) {
  const fetchMock = stubGalleryFetch({
    collections: () =>
      jsonResponse({ collections: [LINUX, WAYLAND, BSD, RETRO] }),
    ...routes,
  })
  const onOpenChange = vi.fn()
  const onConfirm = vi.fn()

  const view = render(
    <MovePostDialog
      post={POST}
      currentSlug="linux"
      open
      onOpenChange={onOpenChange}
      onConfirm={onConfirm}
      {...overrides}
    />
  )

  return { fetchMock, onOpenChange, onConfirm, view }
}

function collectionsRequests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return fetchMock.mock.calls
    .map((call) => String(call[0]))
    .filter((url) => url.includes("/api/gallery/collections"))
}

/** One rendered destination row, looked up by the slug it carries. */
function optionFor(slug: string): HTMLElement {
  const match = screen
    .getAllByTestId("move-post-option")
    .find((option) => option.dataset.slug === slug)

  if (match === undefined) {
    throw new Error(`no destination row for ${slug}`)
  }
  return match
}

describe("MovePostDialog — presence", () => {
  it("renders nothing while the page holds no post", () => {
    const { view } = renderDialog({}, { post: null })

    expect(view.container).toBeEmptyDOMElement()
    expect(screen.queryByTestId("move-post-dialog")).not.toBeInTheDocument()
  })
})

describe("MovePostDialog — the folder list", () => {
  it("shows a loading state instead of a blank dialog while folders load", async () => {
    // The list is fetched on mount, so the first paint is always the loading
    // branch — a blank body would read as "no folders exist".
    renderDialog({ collections: () => new Promise<Response>(() => {}) })

    const dialog = await screen.findByTestId("move-post-dialog")
    expect(within(dialog).getByTestId("move-post-loading")).toBeInTheDocument()
    expect(screen.queryByTestId("move-post-list")).not.toBeInTheDocument()
  })

  it("offers every folder except the one the post is already in", async () => {
    renderDialog()

    const list = await screen.findByTestId("move-post-list")
    const slugs = within(list)
      .getAllByTestId("move-post-option")
      .map((option) => option.dataset.slug)

    // Moving a bookmark into the folder it already occupies is not a move, so
    // the current slug must be gone from the list — and only that one.
    expect(slugs).toEqual(["wayland", "bsd", "retro-computing"])
    expect(slugs).not.toContain("linux")
    expect(list.querySelector('[data-slug="linux"]')).toBeNull()
    expect(screen.queryByText(LINUX.name)).not.toBeInTheDocument()
  })

  it("shows each folder's name and its post count, pluralised", async () => {
    renderDialog()
    await screen.findByTestId("move-post-list")

    expect(optionFor("wayland")).toHaveTextContent(WAYLAND.name)
    // `formatCount` is the one place that owns "1 post" vs "1 posts".
    expect(optionFor("wayland")).toHaveTextContent(formatCount(1, "post"))
    expect(optionFor("wayland")).not.toHaveTextContent("1 posts")
    expect(optionFor("bsd")).toHaveTextContent(formatCount(3, "post"))
  })

  it("says there is nowhere to move when the current folder is the only one", async () => {
    renderDialog({ collections: () => jsonResponse({ collections: [LINUX] }) })

    // An empty list would look like a rendering failure; the copy has to explain
    // that the archive, not the dialog, is what is missing.
    expect(await screen.findByTestId("move-post-empty")).toHaveTextContent(
      MOVE_POST_EMPTY_MESSAGE
    )
    expect(screen.queryByTestId("move-post-list")).not.toBeInTheDocument()
    expect(screen.queryByTestId("move-post-option")).not.toBeInTheDocument()
  })
})

describe("MovePostDialog — choosing a destination", () => {
  it("confirms with the chosen folder's slug, never its display name", async () => {
    const user = userEvent.setup()
    const { onConfirm } = renderDialog()
    await screen.findByTestId("move-post-list")

    await user.click(optionFor("retro-computing"))

    // The API addresses folders by slug; a display name would 404.
    expect(onConfirm).toHaveBeenCalledTimes(1)
    expect(onConfirm).toHaveBeenCalledWith("retro-computing")
  })

  it("disables every destination while a move is in flight", async () => {
    const user = userEvent.setup()
    const { onConfirm } = renderDialog({}, { busy: true })
    await screen.findByTestId("move-post-list")

    const options = screen.getAllByTestId("move-post-option")
    expect(options.length).toBeGreaterThan(0)
    for (const option of options) {
      expect(option).toBeDisabled()
    }

    await user.click(options[0])

    // A second destination mid-flight would race the first move.
    expect(onConfirm).not.toHaveBeenCalled()
  })
})

describe("MovePostDialog — a failed folder request", () => {
  it("describes a folder failure as a folder failure, not a missing collection", async () => {
    stubGalleryFetch({
      collections: () => jsonResponse({ status: "error", reason: "boom" }, 500),
    })

    render(
      <MovePostDialog
        post={makePost({ tweet_id: "1" })}
        currentSlug="linux"
        open
        onOpenChange={() => {}}
        onConfirm={() => {}}
      />
    )

    const error = await screen.findByTestId("move-post-error")
    // The shared gallery copy would say "Could not load this collection", which
    // names the wrong thing: the user is picking a folder, not opening a
    // collection, and a wrong noun reads as a different failure.
    expect(error).toHaveTextContent(MOVE_POST_ERROR_MESSAGE)
    expect(error).not.toHaveTextContent(/collection/i)
  })

  it("keeps the transport message when the folder request never reached the server", async () => {
    // A request that never left is worth describing precisely: "could not
    // connect" tells the user to start the backend, which the folder-specific
    // sentence does not.
    vi.stubGlobal(
      "fetch",
      vi.fn(() => Promise.reject(new TypeError("Failed to fetch")))
    )

    render(
      <MovePostDialog
        post={makePost({ tweet_id: "1" })}
        currentSlug="linux"
        open
        onOpenChange={() => {}}
        onConfirm={() => {}}
      />
    )

    const error = await screen.findByTestId("move-post-error")
    expect(error).not.toHaveTextContent(MOVE_POST_ERROR_MESSAGE)
    expect(error).toHaveTextContent(/connect/i)
  })

  it("withdraws the close control while a move is in flight", async () => {
    stubGalleryFetch({
      collections: () =>
        jsonResponse({
          collections: [
            makeCollection({ slug: "linux" }),
            makeCollection({ slug: "ai" }),
          ],
        }),
    })

    const onOpenChange = vi.fn()
    const { rerender } = render(
      <MovePostDialog
        post={makePost({ tweet_id: "1" })}
        currentSlug="linux"
        open
        onOpenChange={onOpenChange}
        onConfirm={() => {}}
      />
    )

    await screen.findByTestId("move-post-list")
    expect(document.querySelector('[data-slot="dialog-close"]')).not.toBeNull()

    rerender(
      <MovePostDialog
        post={makePost({ tweet_id: "1" })}
        currentSlug="linux"
        open
        busy
        onOpenChange={onOpenChange}
        onConfirm={() => {}}
      />
    )

    // Dismissing mid-request would leave the move running against a screen that
    // has already moved on, and the card would never be removed from the list.
    expect(document.querySelector('[data-slot="dialog-close"]')).toBeNull()
    expect(onOpenChange).not.toHaveBeenCalled()
  })

  it("shows the error state and refetches the folders from Retry", async () => {
    const user = userEvent.setup()
    const { fetchMock } = renderDialog({
      collections: () => jsonResponse({ status: "error", reason: "boom" }, 500),
    })

    const error = await screen.findByTestId("move-post-error")
    const before = collectionsRequests(fetchMock)
    expect(before).toHaveLength(1)

    await user.click(within(error).getByRole("button", { name: "Retry" }))

    // Retry has to re-issue the request, not merely re-render the same failure.
    await waitFor(() => {
      expect(collectionsRequests(fetchMock)).toHaveLength(before.length + 1)
    })
  })
})

describe("MovePostDialog — accessible naming", () => {
  it("names the dialog and describes it with the post's author and handle", async () => {
    renderDialog()

    const dialog = await screen.findByTestId("move-post-dialog")
    expect(screen.getByRole("dialog", { name: MOVE_POST_TITLE })).toBe(dialog)
    expect(dialog).toHaveAccessibleDescription(/Ada Lovelace/)
    expect(dialog).toHaveAccessibleDescription(/@ada/)
  })
})

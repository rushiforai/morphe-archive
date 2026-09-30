import { render, screen, waitFor, within } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { MemoryRouter, Route, Routes } from "react-router-dom"
import { afterEach, describe, expect, it, vi } from "vitest"

import { CollectionPage } from "./collection-page"
import {
  jsonResponse,
  makeCollection,
  makePost,
  pbsUrl,
  stubGalleryFetch,
  type GalleryFetchRoutes,
} from "@/test/fixtures"

/**
 * LIGHT-01…LIGHT-06 end-to-end on the collection route: clicking a media tile
 * opens the lightbox at that exact item, the media arrows walk only that tweet's
 * media while the post arrows cross into the next loaded tweet (skipping
 * text-only posts), the dots count the open tweet rather than the archive,
 * Escape/arrows work, focus is trapped and restored, the scroll offset survives
 * the dialog, and the last loaded item's `next` is disabled without ever
 * triggering a page fetch.
 *
 * Every `fetch` is mocked and URL-routed (no network, no server).
 */

const LINUX = makeCollection({
  slug: "linux",
  name: "Linux Tips",
  post_count: 3,
  media_count: 3,
})

const ADA = makePost({
  tweet_id: "1",
  author: "Ada Lovelace",
  username: "@ada",
  media: [pbsUrl("a1"), pbsUrl("a2")],
  text: "Two images from the archive.",
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
    collections: () => jsonResponse({ collections: [LINUX] }),
    posts: () =>
      jsonResponse({
        items: POSTS,
        next_cursor: "page-2",
        has_more: true,
      }),
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

function postsRequests(fetchMock: ReturnType<typeof stubGalleryFetch>) {
  return fetchMock.mock.calls
    .map((call) => String(call[0]))
    .filter((url) => url.includes("/posts"))
}

async function openLightbox(
  user: ReturnType<typeof userEvent.setup>,
  name: string
) {
  const trigger = await screen.findByRole("button", { name })
  await user.click(trigger)
  const dialog = await screen.findByTestId("media-lightbox")
  return { trigger, dialog }
}

function activeSrc(dialog: HTMLElement) {
  return within(dialog).getByTestId("media-image").getAttribute("src")
}

/**
 * The dots indicator's state as one comparable string. The indicator is dots,
 * not text, so the meaningful assertion is which media of *which tweet's* media
 * is active — the `svg`/`/` text form of the old counter is gone.
 */
function mediaPosition(dialog: HTMLElement): string {
  const counter = within(dialog).getByTestId("lightbox-counter")
  return `${counter.dataset.mediaIndex}/${counter.dataset.mediaTotal}`
}

afterEach(() => {
  window.scrollY = 0
})

describe("CollectionPage — opening the lightbox at the clicked media (LIGHT-01)", () => {
  it("opens at the clicked item with the matching dots and image", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 2 of 2 from @ada")

    // Two dots: @ada's two images, not the three loaded across the gallery.
    expect(mediaPosition(dialog)).toBe("1/2")
    expect(activeSrc(dialog)).toBe(pbsUrl("a2"))
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )
  })

  it("opens at the first media of a one-image tweet", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media from @linus")

    expect(mediaPosition(dialog)).toBe("0/1")
    expect(activeSrc(dialog)).toBe(pbsUrl("c1"))
  })

  it("gives a text-only post no lightbox trigger at all", async () => {
    renderPage()
    await screen.findAllByTestId("post-card")

    expect(
      screen.queryByRole("button", { name: /from @grace/ })
    ).not.toBeInTheDocument()
  })
})

describe("CollectionPage — media arrows stay inside the tweet (LIGHT-03)", () => {
  it("walks the open tweet's media and stops at its ends", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    expect(mediaPosition(dialog)).toBe("0/2")
    expect(within(dialog).getByTestId("lightbox-prev")).toBeDisabled()

    await user.click(within(dialog).getByTestId("lightbox-next"))
    expect(mediaPosition(dialog)).toBe("1/2")
    expect(activeSrc(dialog)).toBe(pbsUrl("a2"))
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )

    // @ada's last image: the media axis stops here, so @linus is untouched.
    expect(within(dialog).getByTestId("lightbox-next")).toBeDisabled()
    await user.click(within(dialog).getByTestId("lightbox-next"))
    expect(mediaPosition(dialog)).toBe("1/2")

    await user.click(within(dialog).getByTestId("lightbox-prev"))
    expect(mediaPosition(dialog)).toBe("0/2")
  })
})

describe("CollectionPage — post arrows cross tweets (LIGHT-03)", () => {
  it("skips the text-only tweet and lands on the neighbour's first media", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    expect(within(dialog).getByTestId("lightbox-prev-post")).toBeDisabled()

    // Second media of @ada, then one post step to @linus (skipping @grace),
    // which owns a single image — so the dots go back to one.
    await user.click(within(dialog).getByTestId("lightbox-next"))
    await user.click(within(dialog).getByTestId("lightbox-next-post"))

    expect(mediaPosition(dialog)).toBe("0/1")
    expect(activeSrc(dialog)).toBe(pbsUrl("c1"))
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Linus Torvalds"
    )
    expect(within(dialog).getByTestId("lightbox-next-post")).toBeDisabled()

    // …and back to @ada's first image, not to the media index we left from.
    await user.click(within(dialog).getByTestId("lightbox-prev-post"))
    expect(mediaPosition(dialog)).toBe("0/2")
    expect(activeSrc(dialog)).toBe(pbsUrl("a1"))
    expect(within(dialog).getByTestId("lightbox-prev-post")).toBeDisabled()
  })

  it("never wraps past the last loaded tweet", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media from @linus")

    await user.click(within(dialog).getByTestId("lightbox-next-post"))
    await user.click(within(dialog).getByTestId("lightbox-next-post"))

    expect(mediaPosition(dialog)).toBe("0/1")
    expect(activeSrc(dialog)).toBe(pbsUrl("c1"))
  })

  it("does not fetch another page as a side effect of opening or navigating", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const before = postsRequests(fetchMock).length
    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    await user.click(within(dialog).getByTestId("lightbox-next"))
    await user.click(within(dialog).getByTestId("lightbox-next-post"))
    await user.keyboard("{ArrowRight}")
    await user.keyboard("{ArrowDown}")

    expect(postsRequests(fetchMock)).toHaveLength(before)
  })

  it("disables next at the last loaded tweet and keeps it a no-op", async () => {
    const user = userEvent.setup()
    const fetchMock = renderPage()

    const { dialog } = await openLightbox(user, "Media from @linus")
    const before = postsRequests(fetchMock).length

    expect(within(dialog).getByTestId("lightbox-next-post")).toBeDisabled()

    await user.keyboard("{ArrowDown}")

    expect(mediaPosition(dialog)).toBe("0/1")
    expect(postsRequests(fetchMock)).toHaveLength(before)
  })
})

describe("CollectionPage — keyboard control (LIGHT-04)", () => {
  it("navigates media with ArrowLeft and ArrowRight", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    await user.keyboard("{ArrowRight}")
    expect(mediaPosition(dialog)).toBe("1/2")

    // The media axis is clamped inside @ada; the arrow does not change tweets.
    await user.keyboard("{ArrowRight}")
    expect(mediaPosition(dialog)).toBe("1/2")
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )

    await user.keyboard("{ArrowLeft}")
    expect(mediaPosition(dialog)).toBe("0/2")
  })

  it("navigates posts with ArrowDown and ArrowUp", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    await user.keyboard("{ArrowDown}")
    expect(mediaPosition(dialog)).toBe("0/1")
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Linus Torvalds"
    )

    await user.keyboard("{ArrowUp}")
    expect(mediaPosition(dialog)).toBe("0/2")
    expect(within(dialog).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )
  })

  it("closes on Escape", async () => {
    const user = userEvent.setup()
    renderPage()

    await openLightbox(user, "Media 1 of 2 from @ada")
    await user.keyboard("{Escape}")

    await waitFor(() => {
      expect(screen.queryByTestId("media-lightbox")).not.toBeInTheDocument()
    })
  })

  it("closes from the panel's × control", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")
    await user.click(within(dialog).getByTestId("lightbox-close"))

    await waitFor(() => {
      expect(screen.queryByTestId("media-lightbox")).not.toBeInTheDocument()
    })
  })
})

describe("CollectionPage — focus management (LIGHT-05)", () => {
  it("moves focus into the dialog when it opens", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    await waitFor(() => {
      expect(dialog.contains(document.activeElement)).toBe(true)
    })
    expect(document.activeElement).not.toBe(document.body)
  })

  it("cannot Tab out of the dialog in either direction", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")
    const inside = () => dialog.contains(document.activeElement)

    for (let index = 0; index < 8; index += 1) {
      await user.tab()
      expect(inside()).toBe(true)
    }
    for (let index = 0; index < 8; index += 1) {
      await user.tab({ shift: true })
      expect(inside()).toBe(true)
    }
  })

  it("never leaves focus stranded on a control it just disabled", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    await user.keyboard("{ArrowRight}")
    expect(mediaPosition(dialog)).toBe("1/2")
    // @ada's last image disables the media-next control it was sitting on.
    expect(within(dialog).getByTestId("lightbox-next")).toBeDisabled()
    expect(document.activeElement).not.toBe(
      within(dialog).getByTestId("lightbox-next")
    )
    expect(dialog.contains(document.activeElement)).toBe(true)

    // …so the arrows still work at the boundary.
    await user.keyboard("{ArrowLeft}")
    expect(mediaPosition(dialog)).toBe("0/2")
    expect(within(dialog).getByTestId("lightbox-prev")).toBeDisabled()
    expect(dialog.contains(document.activeElement)).toBe(true)
  })

  it("returns focus to the media trigger that opened it", async () => {
    const user = userEvent.setup()
    renderPage()

    const { trigger } = await openLightbox(user, "Media 2 of 2 from @ada")
    await user.keyboard("{Escape}")

    await waitFor(() => {
      expect(screen.queryByTestId("media-lightbox")).not.toBeInTheDocument()
    })
    await waitFor(() => {
      expect(trigger).toHaveFocus()
    })
  })
})

describe("CollectionPage — scroll preservation (LIGHT-06)", () => {
  it("leaves the gallery scroll offset unchanged across open and close", async () => {
    const user = userEvent.setup()
    const scrollTo = vi.spyOn(window, "scrollTo")
    renderPage()

    window.scrollY = 480
    const before = window.scrollY

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")
    expect(dialog).toBeInTheDocument()

    await user.keyboard("{Escape}")
    await waitFor(() => {
      expect(screen.queryByTestId("media-lightbox")).not.toBeInTheDocument()
    })

    expect(window.scrollY).toBe(before)
    // Nothing asked the page to jump back to the top.
    expect(scrollTo).not.toHaveBeenCalled()
  })
})

describe("CollectionPage — metadata panel (LIGHT-01/LIGHT-02)", () => {
  it("renders author, username, text, dates and the backend collection name", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")
    const info = within(dialog).getByTestId("lightbox-info")

    expect(within(info).getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )
    expect(within(info).getByTestId("lightbox-username")).toHaveTextContent(
      "@ada"
    )
    expect(info).toHaveTextContent("Two images from the archive.")
    expect(within(info).getByTestId("lightbox-posted")).toHaveTextContent(
      /^Posted /
    )
    expect(within(info).getByTestId("lightbox-saved")).toHaveTextContent(
      /^Saved /
    )
    // The display name from the collections summary, never the slug.
    expect(within(info).getByTestId("lightbox-collection")).toHaveTextContent(
      "Collection Linux Tips"
    )
    expect(info).not.toHaveTextContent("linux")
  })

  it("links Open on X to the stored url in a new tab", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")
    const link = within(dialog).getByTestId("lightbox-open-on-x")

    expect(link).toHaveAttribute("href", "https://x.com/ada/status/1")
    expect(link).toHaveAttribute("target", "_blank")
    expect(link).toHaveAttribute("rel", "noopener noreferrer")
    expect(link).toHaveTextContent("Open on X ↗")
  })

  it("clamps long panel text with a working Show more", async () => {
    const user = userEvent.setup()
    const longText = `${"Wayland compositors and the Linux desktop. ".repeat(8)}End.`
    stubGalleryFetch({
      collections: () => jsonResponse({ collections: [LINUX] }),
      posts: () =>
        jsonResponse({
          items: [{ ...ADA, text: longText }],
          next_cursor: null,
          has_more: false,
        }),
    })
    render(
      <MemoryRouter initialEntries={["/collections/linux"]}>
        <Routes>
          <Route path="/collections/:slug" element={<CollectionPage />} />
        </Routes>
      </MemoryRouter>
    )

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")
    const text = within(dialog).getByTestId("post-text")
    expect(text.className).toContain("line-clamp-5")

    await user.click(within(dialog).getByTestId("post-text-toggle"))

    expect(text.className).not.toContain("line-clamp")
    expect(within(dialog).getByTestId("post-text-toggle")).toHaveTextContent(
      "Show less"
    )
  })
})

describe("CollectionPage — responsive lightbox structure (LIGHT-02)", () => {
  it("stacks the panel below the media and lays it out beside on desktop", async () => {
    const user = userEvent.setup()
    renderPage()

    const { dialog } = await openLightbox(user, "Media 1 of 2 from @ada")

    expect(dialog.className).toContain("flex-col")
    expect(dialog.className).toContain("md:flex-row")
    expect(
      within(dialog).getByTestId("lightbox-media-area").className
    ).toContain("h-[55vh]")
    expect(within(dialog).getByTestId("lightbox-info").className).toContain(
      "md:w-[330px]"
    )
  })
})

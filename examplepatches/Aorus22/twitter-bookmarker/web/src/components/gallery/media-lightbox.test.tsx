import { fireEvent, render, screen, within } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import { MediaLightbox, type MediaLightboxProps } from "./media-lightbox"
import { makePost, pbsUrl, POST_NOW } from "@/test/fixtures"
import { mediaDotWindow } from "@/lib/lightbox"

/**
 * LIGHT-01/LIGHT-02/LIGHT-04/LIGHT-05 component contract (PRD-2 §26/§27/§67,
 * design spec §3.5). The component is presentational: the flattened index is a
 * prop, so every case here is a direct statement about the rendered panel,
 * controls and responsive structure.
 *
 * The navigation contract under test is the two-axis one: the arrows inside the
 * media area move between the open tweet's own media and stop at its ends, the
 * pair outside the panel moves between tweets, and the indicator is dots counted
 * over the open tweet — never over the loaded archive.
 */

const POSTS = [
  makePost({
    tweet_id: "1",
    author: "Ada Lovelace",
    username: "@ada",
    media: [pbsUrl("a1"), pbsUrl("a2")],
    text: "Two images from the archive.",
  }),
  makePost({
    tweet_id: "2",
    author: "Grace Hopper",
    username: "@grace",
    media: [],
    text: "A text-only tweet.",
  }),
  makePost({
    tweet_id: "3",
    author: "Linus Torvalds",
    username: "@linus",
    media: [pbsUrl("c1")],
    text: "One image.",
  }),
]

const LONG_TEXT = `${"Wayland compositors and the Linux desktop. ".repeat(8)}End.`

function renderLightbox(props: Partial<MediaLightboxProps> = {}) {
  const onClose = vi.fn()
  const onPrevMedia = vi.fn()
  const onNextMedia = vi.fn()
  const onPrevPost = vi.fn()
  const onNextPost = vi.fn()

  const view = render(
    <MediaLightbox
      posts={POSTS}
      index={0}
      collectionName="Linux"
      onPrevMedia={onPrevMedia}
      onNextMedia={onNextMedia}
      onPrevPost={onPrevPost}
      onNextPost={onNextPost}
      onClose={onClose}
      now={POST_NOW}
      {...props}
    />
  )

  return { onClose, onPrevMedia, onNextMedia, onPrevPost, onNextPost, view }
}

/** The indicator's dots, in order. The `sr-only` label span is not one. */
function dots(counter: HTMLElement): HTMLElement[] {
  return Array.from(counter.querySelectorAll('span[aria-hidden="true"]'))
}

/** True when the dot paints as the active one. */
function isActiveDot(dot: HTMLElement): boolean {
  return !dot.className.includes("bg-ink/25")
}

describe("MediaLightbox — contents (LIGHT-01)", () => {
  it("renders nothing while closed", () => {
    renderLightbox({ index: null })

    expect(screen.queryByTestId("media-lightbox")).not.toBeInTheDocument()
  })

  it("shows the active media contained in the media area", () => {
    const { view } = renderLightbox({ index: 0 })

    const mediaArea = screen.getByTestId("lightbox-media-area")
    const image = within(mediaArea).getByTestId("media-image")
    expect(image).toHaveAttribute("src", pbsUrl("a1"))
    expect(image.className).toContain("object-contain")
    // A real alt, because the lightbox image is the dialog's primary content.
    expect(image).toHaveAttribute("alt", "Media 1 of 2 from @ada")
    expect(view.container).toBeInTheDocument()
  })

  it("flattens navigation over the loaded posts, skipping text-only tweets", () => {
    const { view } = renderLightbox({ index: 2 })

    // Slot 2 is post 3's only image — post 2 has no media.
    expect(
      within(screen.getByTestId("lightbox-media-area")).getByTestId(
        "media-image"
      )
    ).toHaveAttribute("src", pbsUrl("c1"))
    expect(screen.getByTestId("lightbox-author")).toHaveTextContent(
      "Linus Torvalds"
    )
    expect(view.container).toBeInTheDocument()
  })

  it("shows the three meta lines with both dates and the collection display name", () => {
    renderLightbox({ index: 0, collectionName: "Linux" })

    expect(screen.getByTestId("lightbox-posted")).toHaveTextContent(
      "Posted Mar 12, 2026"
    )
    expect(screen.getByTestId("lightbox-saved")).toHaveTextContent(
      "Saved Apr 3"
    )
    expect(screen.getByTestId("lightbox-collection")).toHaveTextContent(
      "Collection Linux"
    )
  })

  it("renders author, username, text and a real Open on X anchor", () => {
    renderLightbox({ index: 0 })

    expect(screen.getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )
    expect(screen.getByTestId("lightbox-username")).toHaveTextContent("@ada")
    expect(screen.getByTestId("lightbox-info")).toHaveTextContent(
      "Two images from the archive."
    )

    const link = screen.getByTestId("lightbox-open-on-x")
    expect(link.tagName).toBe("A")
    expect(link).toHaveAttribute("href", "https://x.com/ada/status/1")
    expect(link).toHaveAttribute("target", "_blank")
    expect(link).toHaveAttribute("rel", "noopener noreferrer")
    expect(link).toHaveTextContent("Open on X ↗")
  })

  it("gives the dialog an accessible name and a keyboard hint", () => {
    renderLightbox({ index: 0 })

    expect(
      screen.getByRole("dialog", {
        name: "Post media by Ada Lovelace (@ada)",
      })
    ).toBeInTheDocument()
    expect(screen.getByTestId("media-lightbox")).toHaveAccessibleDescription(
      /left and right arrow keys/
    )
  })
})

describe("MediaLightbox — the media indicator is dots over this tweet (LIGHT-02)", () => {
  it("renders one dot per media in the open tweet, not per loaded media", () => {
    // Three media are loaded across the gallery; this tweet owns two of them.
    renderLightbox({ index: 0 })

    const counter = screen.getByTestId("lightbox-counter")
    expect(dots(counter)).toHaveLength(2)
    expect(counter.dataset.mediaTotal).toBe("2")
    expect(counter.dataset.mediaIndex).toBe("0")
    expect(counter).not.toHaveTextContent("3")
  })

  it("marks the active dot and keeps the position for assistive tech", () => {
    renderLightbox({ index: 1 })

    const counter = screen.getByTestId("lightbox-counter")
    const list = dots(counter)

    expect(isActiveDot(list[0])).toBe(false)
    expect(isActiveDot(list[1])).toBe(true)
    // The visible form is dots; the exact position stays announced.
    expect(counter).toHaveAttribute("aria-label", "Media 2 of 2")
    expect(counter).toHaveAttribute("role", "status")
  })

  it("reports a single media as one dot on a one-image tweet", () => {
    renderLightbox({ index: 2 })

    const counter = screen.getByTestId("lightbox-counter")
    expect(dots(counter)).toHaveLength(1)
    expect(isActiveDot(dots(counter)[0])).toBe(true)
    expect(counter).toHaveAttribute("aria-label", "Media 1 of 1")
  })

  it("slides a bounded window of dots for a long thread", () => {
    const thread = makePost({
      tweet_id: "9",
      username: "@thread",
      media: Array.from({ length: 12 }, (_, index) => pbsUrl(`t${index}`)),
    })
    renderLightbox({ posts: [thread], index: 5 })

    const counter = screen.getByTestId("lightbox-counter")
    const list = dots(counter)

    expect(list).toHaveLength(9)
    expect(counter.dataset.mediaTotal).toBe("12")
    expect(counter.dataset.mediaIndex).toBe("5")
    // The window is the same one the pure helper chose.
    expect(mediaDotWindow(5, 12)).toEqual({ start: 1, count: 9 })
    expect(list.filter(isActiveDot)).toHaveLength(1)
    expect(isActiveDot(list[5 - 1])).toBe(true)
  })
})

describe("MediaLightbox — the two control pairs (LIGHT-02/LIGHT-03)", () => {
  it("names all four controls instead of relying on the glyphs", () => {
    renderLightbox({ index: 1 })

    expect(
      screen.getByRole("button", { name: "Previous media" })
    ).toBeInTheDocument()
    expect(
      screen.getByRole("button", { name: "Next media" })
    ).toBeInTheDocument()
    expect(
      screen.getByRole("button", { name: "Previous post" })
    ).toBeInTheDocument()
    expect(
      screen.getByRole("button", { name: "Next post" })
    ).toBeInTheDocument()
    expect(
      screen.getByRole("button", { name: "Close lightbox" })
    ).toHaveAttribute("data-testid", "lightbox-close")
  })

  it("disables the media arrows at the ends of the open tweet", () => {
    // Two separate renders — one per boundary — because each `render` mounts its
    // own dialog and a combined test would find both copies.
    const first = renderLightbox({ index: 0 })
    expect(screen.getByTestId("lightbox-prev")).toBeDisabled()
    expect(screen.getByTestId("lightbox-next")).toBeEnabled()
    first.view.unmount()

    renderLightbox({ index: 1 })
    expect(screen.getByTestId("lightbox-prev")).toBeEnabled()
    expect(screen.getByTestId("lightbox-next")).toBeDisabled()
  })

  it("disables both media arrows on a one-image tweet", () => {
    renderLightbox({ index: 2 })

    expect(screen.getByTestId("lightbox-prev")).toBeDisabled()
    expect(screen.getByTestId("lightbox-next")).toBeDisabled()
  })

  it("disables the post arrows at the loaded edges", () => {
    const first = renderLightbox({ index: 0 })
    expect(screen.getByTestId("lightbox-prev-post")).toBeDisabled()
    expect(screen.getByTestId("lightbox-next-post")).toBeEnabled()
    first.view.unmount()

    renderLightbox({ index: 2 })
    expect(screen.getByTestId("lightbox-prev-post")).toBeEnabled()
    expect(screen.getByTestId("lightbox-next-post")).toBeDisabled()
  })

  it("calls the media handler each media arrow enables", async () => {
    const user = userEvent.setup()
    const first = renderLightbox({ index: 0 })

    await user.click(screen.getByTestId("lightbox-next"))
    expect(first.onNextMedia).toHaveBeenCalledTimes(1)
    expect(first.onPrevMedia).not.toHaveBeenCalled()
    first.view.unmount()

    const second = renderLightbox({ index: 1 })
    await user.click(screen.getByTestId("lightbox-prev"))
    expect(second.onPrevMedia).toHaveBeenCalledTimes(1)
    expect(second.onNextMedia).not.toHaveBeenCalled()
  })

  it("calls the post handler each post arrow enables", async () => {
    const user = userEvent.setup()
    const first = renderLightbox({ index: 1 })

    // @grace has no media, so @ada -> @linus in one post step.
    await user.click(screen.getByTestId("lightbox-next-post"))
    expect(first.onNextPost).toHaveBeenCalledTimes(1)
    expect(first.onPrevPost).not.toHaveBeenCalled()
    first.view.unmount()

    const second = renderLightbox({ index: 2 })
    await user.click(screen.getByTestId("lightbox-prev-post"))
    expect(second.onPrevPost).toHaveBeenCalledTimes(1)
    expect(second.onNextPost).not.toHaveBeenCalled()
  })

  it("calls close from the info panel's × control", async () => {
    const user = userEvent.setup()
    const { onClose } = renderLightbox({ index: 1 })

    await user.click(screen.getByTestId("lightbox-close"))

    expect(onClose).toHaveBeenCalledTimes(1)
  })

  it("keeps the post controls out of the media area and leaves it unclipped", () => {
    renderLightbox({ index: 0 })

    const mediaArea = screen.getByTestId("lightbox-media-area")
    expect(
      within(mediaArea).queryByTestId("lightbox-next-post")
    ).not.toBeInTheDocument()
    expect(screen.getByTestId("lightbox-next-post").className).toContain(
      "min-[1400px]:-right-14"
    )
    // The panel must not clip, or the gutter controls could not be drawn.
    expect(screen.getByTestId("media-lightbox").className).toContain(
      "md:overflow-visible"
    )
  })
})

describe("MediaLightbox — keyboard (LIGHT-04)", () => {
  it("drives the media arrows with ArrowLeft and ArrowRight", async () => {
    const user = userEvent.setup()
    const { onNextMedia, onPrevMedia, onNextPost } = renderLightbox({
      index: 1,
    })

    await user.keyboard("{ArrowRight}")
    await user.keyboard("{ArrowLeft}")

    expect(onNextMedia).toHaveBeenCalledTimes(1)
    expect(onPrevMedia).toHaveBeenCalledTimes(1)
    expect(onNextPost).not.toHaveBeenCalled()
  })

  it("drives the post arrows with ArrowDown and ArrowUp", async () => {
    const user = userEvent.setup()
    const { onNextPost, onPrevPost, onNextMedia } = renderLightbox({ index: 1 })

    await user.keyboard("{ArrowDown}")
    await user.keyboard("{ArrowUp}")

    expect(onNextPost).toHaveBeenCalledTimes(1)
    expect(onPrevPost).toHaveBeenCalledTimes(1)
    expect(onNextMedia).not.toHaveBeenCalled()
  })

  it("closes on Escape through the dialog primitive", async () => {
    const user = userEvent.setup()
    const { onClose } = renderLightbox({ index: 1 })

    await user.keyboard("{Escape}")

    expect(onClose).toHaveBeenCalled()
  })

  it("does not let the arrow keys scroll the page behind the dialog", () => {
    renderLightbox({ index: 1 })

    for (const key of ["ArrowRight", "ArrowLeft", "ArrowUp", "ArrowDown"]) {
      const event = new KeyboardEvent("keydown", {
        key,
        bubbles: true,
        cancelable: true,
      })
      screen.getByTestId("media-lightbox").dispatchEvent(event)

      expect(event.defaultPrevented).toBe(true)
    }
  })
})

describe("MediaLightbox — responsive structure and scrim (LIGHT-02)", () => {
  it("puts the media beside the info panel on desktop and stacks them below", () => {
    renderLightbox({ index: 0 })

    const panel = screen.getByTestId("media-lightbox")
    expect(panel.className).toContain("flex-col")
    expect(panel.className).toContain("md:flex-row")
    expect(panel.className).toContain("sm:max-w-[1220px]")
    expect(panel.className).toContain("md:h-[820px]")
    expect(panel.className).toContain("rounded-2xl")
    expect(panel.className).toContain("bg-surface")
    expect(panel.className).toContain("shadow-popover")
    expect(panel.className).toContain("p-[30px]")

    const mediaArea = screen.getByTestId("lightbox-media-area")
    expect(mediaArea.className).toContain("h-[55vh]")
    expect(mediaArea.className).toContain("md:flex-1")
    expect(mediaArea.className).toContain("rounded-xl")
    expect(mediaArea.className).toContain("bg-[#0b080d]")

    const info = screen.getByTestId("lightbox-info")
    expect(info.className).toContain("md:w-[330px]")
    expect(info.className).toContain("rounded-xl")
    expect(info.className).toContain("bg-surface-warm")
    expect(info.className).toContain("p-[22px]")
  })

  it("keeps the post controls inside the media area until there is a gutter", () => {
    renderLightbox({ index: 1 })

    const prev = screen.getByTestId("lightbox-prev-post").className
    expect(prev).toContain("left-[42px]")
    expect(prev).toContain("top-[42px]")
    expect(prev).toContain("min-[1400px]:-left-14")
    expect(prev).toContain("min-[1400px]:top-1/2")

    const next = screen.getByTestId("lightbox-next-post").className
    expect(next).toContain("right-[402px]")
    expect(next).toContain("min-[1400px]:-right-14")
    // Between `md` and the 1400px gutter the info panel sits to the right, so the
    // next-post button has to skip it (30 + 330 + 30 + 12). The narrow tier must
    // be `max-md`, not `md`: Tailwind emits `md:` *after* `min-[1400px]:`, so with
    // `md:right-[402px]` both matched from 1400px up, the 402px rule won, and the
    // button landed exactly on the media `→` (both are 12px inside the media
    // area's right edge) and hid it. `max-md` and `min-[1400px]` cannot both
    // match, so emission order stops deciding the layout.
    expect(next).toContain("max-md:right-[42px]")
    expect(next).not.toContain("md:right-[402px]")
  })

  it("tints the scrim with the spec colour", () => {
    renderLightbox({ index: 0 })

    const overlay = document.querySelector('[data-slot="dialog-overlay"]')
    expect(overlay).not.toBeNull()
    expect(overlay?.className).toContain("bg-[#120d14]/82")
  })
})

describe("MediaLightbox — clamp and broken media (LIGHT-01)", () => {
  it("clamps long post text with a working Show more", async () => {
    const user = userEvent.setup()
    renderLightbox({
      index: 0,
      posts: [{ ...POSTS[0], text: LONG_TEXT }],
    })

    const text = within(screen.getByTestId("lightbox-info")).getByTestId(
      "post-text"
    )
    expect(text.className).toContain("line-clamp-5")
    expect(text.className).toContain("text-[13px]")

    await user.click(screen.getByTestId("post-text-toggle"))

    expect(text.className).not.toContain("line-clamp")
    expect(screen.getByTestId("post-text-toggle")).toHaveTextContent(
      "Show less"
    )
  })

  it("keeps the panel intact when the lightbox image is broken", () => {
    renderLightbox({ index: 0 })

    fireEvent.error(
      within(screen.getByTestId("lightbox-media-area")).getByTestId(
        "media-image"
      )
    )

    expect(screen.getByTestId("media-placeholder")).toBeInTheDocument()
    expect(screen.getByTestId("lightbox-author")).toHaveTextContent(
      "Ada Lovelace"
    )
    const counter = screen.getByTestId("lightbox-counter")
    expect(dots(counter)).toHaveLength(2)
    expect(counter.dataset.mediaIndex).toBe("0")
  })
})

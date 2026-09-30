import { fireEvent, render, screen, within } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import { PostMediaGrid } from "./post-media-grid"
import { pbsUrl } from "@/test/fixtures"

/**
 * COLL-04: every media URL of a post is rendered in one card — never truncated
 * to the first image — with the §3.3 adaptive layout for each count.
 */

function media(count: number): string[] {
  return Array.from({ length: count }, (_, index) => pbsUrl(`m${index}`))
}

function renderGrid(count: number) {
  const urls = media(count)
  render(
    <PostMediaGrid
      media={urls}
      seed="tweet-1"
      describeAlt={(index, total) => `Media ${index + 1} of ${total}`}
    />
  )
  return urls
}

describe("PostMediaGrid — adaptive layouts (PRD-2 §20)", () => {
  it("renders one natural-aspect tile for a single image", () => {
    const urls = renderGrid(1)
    const grid = screen.getByTestId("post-media-grid")

    expect(grid).toHaveAttribute("data-media-layout", "single")
    expect(grid).toHaveAttribute("data-media-count", "1")
    expect(screen.getAllByTestId("media-image")).toHaveLength(1)
    expect(screen.getByTestId("media-image")).toHaveAttribute("src", urls[0])
  })

  it("renders two images as a 50/50 split", () => {
    renderGrid(2)
    const grid = screen.getByTestId("post-media-grid")

    expect(grid).toHaveAttribute("data-media-layout", "duo")
    expect(grid.className).toContain("grid-cols-2")
    expect(screen.getAllByTestId("media-image")).toHaveLength(2)
  })

  it("renders three images as a wide tile over two tiles", () => {
    renderGrid(3)
    const grid = screen.getByTestId("post-media-grid")
    const images = screen.getAllByTestId("media-image")

    expect(grid).toHaveAttribute("data-media-layout", "trio")
    expect(images).toHaveLength(3)
    expect(images[0].className).toContain("col-span-2")
    expect(images[1].className).not.toContain("col-span-2")
    expect(images[2].className).not.toContain("col-span-2")
  })

  it("renders four images as a compact 2x2 grid", () => {
    renderGrid(4)

    expect(screen.getByTestId("post-media-grid")).toHaveAttribute(
      "data-media-layout",
      "grid"
    )
    expect(screen.getAllByTestId("media-image")).toHaveLength(4)
  })

  it("renders every media beyond four — 5 and 6 are never truncated", () => {
    for (const count of [5, 6, 9]) {
      const { unmount } = render(
        <PostMediaGrid
          media={media(count)}
          seed={`tweet-${count}`}
          describeAlt={(index, total) => `Media ${index + 1} of ${total}`}
        />
      )

      const images = screen.getAllByTestId("media-image")
      expect(images).toHaveLength(count)
      expect(images.map((image) => image.getAttribute("src"))).toEqual(
        media(count)
      )
      // No summary/overflow tile is used to hide media.
      expect(screen.getByTestId("post-media-grid")).toHaveAttribute(
        "data-media-count",
        String(count)
      )

      unmount()
    }
  })
})

describe("PostMediaGrid — rendering contract", () => {
  it("loads every tile lazily from the stored pbs.twimg.com URL", () => {
    renderGrid(4)

    for (const image of screen.getAllByTestId("media-image")) {
      expect(image).toHaveAttribute("loading", "lazy")
      expect(image).toHaveAttribute("decoding", "async")
      expect(image.getAttribute("src")).toMatch(/^https:\/\/pbs\.twimg\.com\//)
    }
  })

  it("gives each tile contextual alt text derived from the post", () => {
    renderGrid(2)

    const grid = screen.getByTestId("post-media-grid")
    expect(within(grid).getByAltText("Media 1 of 2")).toBeInTheDocument()
    expect(within(grid).getByAltText("Media 2 of 2")).toBeInTheDocument()
  })

  it("keeps a same-box placeholder when a tile's remote image is broken (COLL-11)", () => {
    renderGrid(2)
    const grid = screen.getByTestId("post-media-grid")

    fireEvent.error(screen.getAllByTestId("media-image")[1])

    const placeholder = within(grid).getByTestId("media-placeholder")
    expect(placeholder.className).toContain("aspect-[3/4]")
    expect(placeholder.className).toContain("rounded-md")
    expect(grid).toHaveAttribute("data-media-layout", "duo")
    expect(within(grid).getAllByTestId("media-image")).toHaveLength(1)
  })
})

/**
 * LIGHT-01 (PRD-2 §67): with an `onOpenMedia` handler every tile is a real
 * focusable button carrying the author-derived accessible name, so the media is
 * openable by keyboard and never only by clicking a bare image. Without the
 * handler the grid is unchanged (the suite above).
 */
describe("PostMediaGrid — lightbox triggers (LIGHT-01)", () => {
  function renderTriggers(count: number, onOpenMedia = vi.fn()) {
    render(
      <PostMediaGrid
        media={media(count)}
        seed="tweet-1"
        describeAlt={(index, total) => `Media ${index + 1} of ${total}`}
        onOpenMedia={onOpenMedia}
      />
    )
    return onOpenMedia
  }

  it("renders each tile as a named button, not a bare image", () => {
    renderTriggers(4)

    const triggers = screen.getAllByTestId("post-media-trigger")
    expect(triggers).toHaveLength(4)
    for (const trigger of triggers) {
      expect(trigger.tagName).toBe("BUTTON")
    }
    expect(
      screen.getByRole("button", { name: "Media 2 of 4" })
    ).toHaveAttribute("aria-haspopup", "dialog")
    expect(triggers[1]).toHaveAttribute("data-media-index", "1")
  })

  it("moves the name onto the trigger and makes the inner image decorative", () => {
    renderTriggers(2)

    // Exactly one accessible name per tile: the button's.
    expect(screen.getByRole("button", { name: "Media 1 of 2" })).toBeVisible()
    for (const image of screen.getAllByTestId("media-image")) {
      expect(image).toHaveAttribute("alt", "")
      expect(image).toHaveAttribute("aria-hidden", "true")
    }
  })

  it("reports the zero-based index of the clicked media and its trigger", async () => {
    const user = userEvent.setup()
    const onOpenMedia = renderTriggers(4)

    const trigger = screen.getByRole("button", { name: "Media 3 of 4" })
    await user.click(trigger)

    expect(onOpenMedia).toHaveBeenCalledWith(2, trigger)
  })

  it("opens from the keyboard with Enter and Space", async () => {
    const user = userEvent.setup()
    const onOpenMedia = renderTriggers(2)

    const first = screen.getByRole("button", { name: "Media 1 of 2" })
    first.focus()
    expect(first).toHaveFocus()

    await user.keyboard("{Enter}")
    expect(onOpenMedia).toHaveBeenCalledWith(0, first)

    await user.keyboard(" ")
    expect(onOpenMedia).toHaveBeenCalledWith(0, first)
    expect(onOpenMedia).toHaveBeenCalledTimes(2)
  })

  it("keeps the adaptive geometry on the trigger so the grid never reflows", () => {
    renderTriggers(3)

    const triggers = screen.getAllByTestId("post-media-trigger")
    expect(triggers[0].className).toContain("col-span-2")
    expect(triggers[1].className).not.toContain("col-span-2")
    expect(triggers[0].className).toContain("aspect-[16/10]")
    expect(triggers[1].className).toContain("rounded-md")
    expect(screen.getByTestId("post-media-grid")).toHaveAttribute(
      "data-media-layout",
      "trio"
    )
  })

  it("keeps a broken tile's placeholder inside the trigger", () => {
    renderTriggers(2)

    fireEvent.error(screen.getAllByTestId("media-image")[0])

    const trigger = screen.getAllByTestId("post-media-trigger")[0]
    expect(within(trigger).getByTestId("media-placeholder")).toBeInTheDocument()
    expect(
      within(trigger).getByTestId("media-placeholder").className
    ).toContain("size-full")
    expect(screen.getByTestId("post-media-grid")).toHaveAttribute(
      "data-media-layout",
      "duo"
    )
  })

  it("stays a static, non-interactive grid when no handler is provided", () => {
    renderGrid(2)

    expect(screen.queryByTestId("post-media-trigger")).not.toBeInTheDocument()
    expect(screen.queryByRole("button")).not.toBeInTheDocument()
    expect(screen.getByAltText("Media 1 of 2")).toBeInTheDocument()
  })
})

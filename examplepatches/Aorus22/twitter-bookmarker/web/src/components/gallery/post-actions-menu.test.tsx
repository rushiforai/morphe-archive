import { render, screen, waitFor } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import {
  DELETE_POST_LABEL,
  MOVE_POST_LABEL,
  PostActionsMenu,
  postActionsLabel,
  type PostActionsMenuProps,
} from "./post-actions-menu"
import { makePost } from "@/test/fixtures"

/**
 * The per-post overflow menu's contract: one real, named button per post, two
 * rows that report intent upward instead of touching the API themselves, and a
 * portal target the media lightbox can pin the menu inside so its focus trap
 * keeps holding on to every Tab.
 */

const POST = makePost({
  tweet_id: "1",
  author: "Ada Lovelace",
  username: "@ada",
})

function renderMenu(overrides: Partial<PostActionsMenuProps> = {}) {
  const onRequestDelete = vi.fn()
  const onRequestMove = vi.fn()

  const view = render(
    <PostActionsMenu
      post={POST}
      onRequestDelete={onRequestDelete}
      onRequestMove={onRequestMove}
      {...overrides}
    />
  )

  return { onRequestDelete, onRequestMove, view }
}

describe("PostActionsMenu — the trigger is a named control (A11Y)", () => {
  it("is a real button whose accessible name identifies this post's menu", () => {
    renderMenu()

    const trigger = screen.getByTestId("post-actions-trigger")
    // A plain `div` or an icon with no name would be invisible to a screen
    // reader and unreachable by keyboard, so both facts are pinned together.
    expect(trigger.tagName).toBe("BUTTON")
    expect(screen.getByRole("button", { name: postActionsLabel(POST) })).toBe(
      trigger
    )
  })

  it("opens from the keyboard with Enter", async () => {
    const user = userEvent.setup()
    renderMenu()

    await user.tab()
    expect(screen.getByTestId("post-actions-trigger")).toHaveFocus()

    await user.keyboard("{Enter}")

    expect(await screen.findByTestId("post-actions-menu")).toBeInTheDocument()
  })

  it("opens from the keyboard with Space", async () => {
    const user = userEvent.setup()
    renderMenu()

    await user.tab()
    await user.keyboard(" ")

    expect(await screen.findByTestId("post-actions-menu")).toBeInTheDocument()
  })
})

describe("PostActionsMenu — the two rows", () => {
  it("shows exactly the move row and the delete row, with the exported copy", async () => {
    const user = userEvent.setup()
    renderMenu()

    await user.click(screen.getByTestId("post-actions-trigger"))

    const rows = screen.getAllByRole("menuitem")
    expect(rows).toHaveLength(2)
    expect(
      screen.getByRole("menuitem", { name: MOVE_POST_LABEL })
    ).toBeInTheDocument()
    expect(
      screen.getByRole("menuitem", { name: DELETE_POST_LABEL })
    ).toBeInTheDocument()
  })

  it("reports move intent once, with the exact post, and never the delete handler", async () => {
    const user = userEvent.setup()
    const { onRequestMove, onRequestDelete } = renderMenu()

    await user.click(screen.getByTestId("post-actions-trigger"))
    await user.click(screen.getByRole("menuitem", { name: MOVE_POST_LABEL }))

    expect(onRequestMove).toHaveBeenCalledTimes(1)
    // Identity, not a structural copy: the page keys its dialogs off the row it
    // was handed, so a cloned object would open the wrong bookmark.
    expect(onRequestMove.mock.calls[0][0]).toBe(POST)
    expect(onRequestDelete).not.toHaveBeenCalled()
  })

  it("reports delete intent once, with the exact post, and never the move handler", async () => {
    const user = userEvent.setup()
    const { onRequestMove, onRequestDelete } = renderMenu()

    await user.click(screen.getByTestId("post-actions-trigger"))
    await user.click(screen.getByRole("menuitem", { name: DELETE_POST_LABEL }))

    expect(onRequestDelete).toHaveBeenCalledTimes(1)
    expect(onRequestDelete.mock.calls[0][0]).toBe(POST)
    expect(onRequestMove).not.toHaveBeenCalled()
  })
})

describe("PostActionsMenu — where the menu is mounted", () => {
  it("mounts inside the given container so the lightbox focus trap still holds it", async () => {
    const user = userEvent.setup()
    const portalTarget = document.createElement("div")
    document.body.appendChild(portalTarget)

    const { view } = renderMenu({ portalContainer: portalTarget })
    await user.click(screen.getByTestId("post-actions-trigger"))

    const menu = screen.getByTestId("post-actions-menu")
    // The lightbox asserts Tab can never leave its content element, so anything
    // opened from inside it has to be a descendant of that element — a menu on
    // `document.body` would be tabbable outside the trap.
    expect(portalTarget.contains(menu)).toBe(true)
    expect(view.container.contains(menu)).toBe(false)
    expect(menu.parentElement).not.toBe(document.body)

    portalTarget.remove()
  })

  it("falls back to document.body so a grid card's menu still portals away", async () => {
    const user = userEvent.setup()
    const { view } = renderMenu()

    await user.click(screen.getByTestId("post-actions-trigger"))

    const menu = screen.getByTestId("post-actions-menu")
    // Cards re-render and reorder as pages load; a menu mounted inside the card
    // would inherit its clipping and stacking. The default body portal is what
    // keeps the row menus above the masonry.
    expect(view.container.contains(menu)).toBe(false)
    expect(document.body.contains(menu)).toBe(true)
  })
})

describe("PostActionsMenu — dismissal and styling", () => {
  it("closes on Escape and hands focus back to the trigger", async () => {
    const user = userEvent.setup()
    renderMenu()
    const trigger = screen.getByTestId("post-actions-trigger")

    await user.click(trigger)
    await screen.findByTestId("post-actions-menu")

    await user.keyboard("{Escape}")

    await waitFor(() => {
      expect(screen.queryByTestId("post-actions-menu")).not.toBeInTheDocument()
    })
    // Focus must not be dropped on `body`, or the next Tab restarts at the top
    // of the page instead of continuing from this card.
    await waitFor(() => {
      expect(trigger).toHaveFocus()
    })
  })

  it("passes the className prop through to the trigger", () => {
    renderMenu({ className: "opacity-0 group-hover:opacity-100" })

    expect(screen.getByTestId("post-actions-trigger").className).toContain(
      "group-hover:opacity-100"
    )
  })
})

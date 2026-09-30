import { render, screen, waitFor } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import {
  DELETE_POST_TITLE,
  DeletePostDialog,
  deletePostDescription,
  type DeletePostDialogProps,
} from "./delete-post-dialog"
import { makePost } from "@/test/fixtures"

/**
 * DeletePostDialog's contract: the confirmation is only offered while a post is
 * selected, it names the exact bookmark and states how it can be recovered, its
 * confirm is the destructive variant, and a request already in flight disables
 * both buttons and swallows Escape so it cannot be double-fired or backed out of.
 */

const POST = makePost({
  tweet_id: "1",
  author: "Ada Lovelace",
  username: "@ada",
})

function renderDialog(overrides: Partial<DeletePostDialogProps> = {}) {
  const onOpenChange = vi.fn()
  const onConfirm = vi.fn()

  const view = render(
    <DeletePostDialog
      post={POST}
      open
      onOpenChange={onOpenChange}
      onConfirm={onConfirm}
      {...overrides}
    />
  )

  return { onOpenChange, onConfirm, view }
}

describe("DeletePostDialog — presence", () => {
  it("renders no dialog shell at all while the page holds no post", () => {
    const { view } = renderDialog({ post: null })

    // An empty shell would leave a titled, described dialog in the tree with
    // nothing to describe, so the null post has to short-circuit entirely.
    expect(view.container).toBeEmptyDOMElement()
    expect(screen.queryByTestId("confirm-dialog")).not.toBeInTheDocument()
  })
})

describe("DeletePostDialog — the copy names what is being deleted", () => {
  it("uses the exported title as the dialog's accessible name", () => {
    renderDialog()

    expect(screen.getByRole("dialog", { name: DELETE_POST_TITLE })).toBe(
      screen.getByTestId("confirm-dialog")
    )
  })

  it("describes the post by author and handle from the exported helper", () => {
    renderDialog()

    const dialog = screen.getByTestId("confirm-dialog")
    expect(dialog).toHaveAccessibleDescription(deletePostDescription(POST))
    // The author/username pair has to be in there literally: `deletePostDescription`
    // is the single source, and an accidental "Test Author" placeholder would
    // otherwise still satisfy an equality check against itself.
    expect(dialog).toHaveAccessibleDescription(/Ada Lovelace/)
    expect(dialog).toHaveAccessibleDescription(/\(@ada\)/)
  })

  it("promises the bookmark is kept and can be restored by hand", () => {
    renderDialog()

    // This sentence is the whole justification for offering a destructive
    // action: without it the dialog reads as permanent data loss.
    const dialog = screen.getByTestId("confirm-dialog")
    expect(dialog).toHaveAccessibleDescription(
      /kept in the database's deleted table/
    )
    expect(dialog).toHaveAccessibleDescription(/can be restored by hand/)
  })
})

describe("DeletePostDialog — the two buttons", () => {
  it("confirms once from the confirm button", async () => {
    const user = userEvent.setup()
    const { onConfirm, onOpenChange } = renderDialog()

    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    expect(onConfirm).toHaveBeenCalledTimes(1)
    expect(onOpenChange).not.toHaveBeenCalled()
  })

  it("cancels through onOpenChange(false) and never confirms", async () => {
    const user = userEvent.setup()
    const { onConfirm, onOpenChange } = renderDialog()

    await user.click(screen.getByTestId("confirm-dialog-cancel"))

    expect(onOpenChange).toHaveBeenCalledTimes(1)
    expect(onOpenChange).toHaveBeenCalledWith(false)
    expect(onConfirm).not.toHaveBeenCalled()
  })

  it("treats Escape as a cancel, not a confirmation", async () => {
    const user = userEvent.setup()
    const { onConfirm, onOpenChange } = renderDialog()

    await user.keyboard("{Escape}")

    await waitFor(() => {
      expect(onOpenChange).toHaveBeenCalledWith(false)
    })
    expect(onConfirm).not.toHaveBeenCalled()
  })

  it("paints the confirm as the shared Button's destructive variant", () => {
    renderDialog()

    // `data-variant` is the Button primitive's own contract; asserting it (over
    // a Tailwind class name) survives a palette or class-order reshuffle.
    expect(screen.getByTestId("confirm-dialog-confirm")).toHaveAttribute(
      "data-variant",
      "destructive"
    )
  })
})

describe("DeletePostDialog — busy locks the dialog shut", () => {
  it("disables both buttons and ignores a click while the request runs", async () => {
    const user = userEvent.setup()
    const { onConfirm } = renderDialog({ busy: true })

    const dialog = screen.getByTestId("confirm-dialog")
    expect(dialog).toHaveAttribute("aria-busy", "true")
    expect(screen.getByTestId("confirm-dialog-confirm")).toBeDisabled()
    expect(screen.getByTestId("confirm-dialog-cancel")).toBeDisabled()

    await user.click(screen.getByTestId("confirm-dialog-confirm"))

    // One delete request per bookmark: a second click must not queue another.
    expect(onConfirm).not.toHaveBeenCalled()
  })

  it("does not let Escape dismiss a half-finished request", async () => {
    const user = userEvent.setup()
    const { onOpenChange } = renderDialog({ busy: true })

    await user.keyboard("{Escape}")

    // Dismissing mid-flight would return the user to the gallery as if nothing
    // happened while the delete is still on its way to the backend.
    expect(onOpenChange).not.toHaveBeenCalled()
  })
})

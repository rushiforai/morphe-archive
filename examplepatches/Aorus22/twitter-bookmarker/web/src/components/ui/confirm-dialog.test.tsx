import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import { ConfirmDialog } from "./confirm-dialog"

/**
 * The shared confirmation primitive.
 *
 * The property worth its own suite is the `busy` guarantee: once the action has
 * been sent, the dialog must not offer *any* way out. A missing guard is easy to
 * add and impossible to notice by hand — an extra `×` in the corner looks like
 * every other dialog in the app — so every dismissal route is asserted, not just
 * the two footer buttons.
 */

function renderDialog(
  props: Partial<React.ComponentProps<typeof ConfirmDialog>> = {}
) {
  const onOpenChange = vi.fn()
  const onConfirm = vi.fn()

  render(
    <ConfirmDialog
      open
      onOpenChange={onOpenChange}
      title="Delete this bookmark?"
      description="It is kept in the deleted table and can be restored by hand."
      confirmLabel="Delete"
      destructive
      onConfirm={onConfirm}
      {...props}
    />
  )

  return { onOpenChange, onConfirm }
}

describe("ConfirmDialog", () => {
  it("names itself and describes the consequence (axe: Radix requires both)", () => {
    renderDialog()

    const dialog = screen.getByTestId("confirm-dialog")
    expect(dialog).toHaveAccessibleName("Delete this bookmark?")
    expect(dialog).toHaveAccessibleDescription(
      "It is kept in the deleted table and can be restored by hand."
    )
  })

  it("confirms once and cancels without confirming", async () => {
    const user = userEvent.setup()
    const { onConfirm, onOpenChange } = renderDialog()

    await user.click(screen.getByTestId("confirm-dialog-confirm"))
    expect(onConfirm).toHaveBeenCalledTimes(1)
    expect(onOpenChange).not.toHaveBeenCalled()

    await user.click(screen.getByTestId("confirm-dialog-cancel"))
    expect(onOpenChange).toHaveBeenCalledWith(false)
    expect(onConfirm).toHaveBeenCalledTimes(1)
  })

  it("tints the confirm button as destructive only when asked", () => {
    renderDialog()
    expect(screen.getByTestId("confirm-dialog-confirm")).toHaveAttribute(
      "data-variant",
      "destructive"
    )
  })

  it("offers every dismissal route while idle", async () => {
    const user = userEvent.setup()
    const { onOpenChange } = renderDialog()

    expect(document.querySelector('[data-slot="dialog-close"]')).not.toBeNull()

    await user.keyboard("{Escape}")
    expect(onOpenChange).toHaveBeenCalledWith(false)
  })

  it("closes the whole dialog once busy: no footer button, no close control, no Escape", async () => {
    const user = userEvent.setup()
    const { onOpenChange, onConfirm } = renderDialog({ busy: true })

    // Both footer buttons are present but inert, so the layout does not jump
    // while the request is in flight.
    const cancel = screen.getByTestId("confirm-dialog-cancel")
    const confirm = screen.getByTestId("confirm-dialog-confirm")
    expect(cancel).toBeDisabled()
    expect(confirm).toBeDisabled()

    await user.click(confirm)
    await user.click(cancel)
    expect(onConfirm).not.toHaveBeenCalled()
    expect(onOpenChange).not.toHaveBeenCalled()

    // The built-in `×` reports the same intent as Cancel, so it is withdrawn
    // rather than left as a second, unguarded way out. Its absence is the point:
    // a live `×` would let a half-finished delete be dismissed and retried.
    expect(document.querySelector('[data-slot="dialog-close"]')).toBeNull()

    await user.keyboard("{Escape}")
    expect(onOpenChange).not.toHaveBeenCalled()
  })

  it("marks itself busy for assistive technology", () => {
    renderDialog({ busy: true })
    expect(screen.getByTestId("confirm-dialog")).toHaveAttribute(
      "aria-busy",
      "true"
    )
  })
})

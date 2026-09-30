import * as React from "react"

import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  type PortalContainer,
} from "@/components/ui/dialog"

/**
 * A confirmation dialog for an action that changes data.
 *
 * Built on the shared `Dialog` rather than `window.confirm` for three reasons
 * that matter here: the copy can name what is about to happen and what the
 * consequence is, it can be styled like the rest of the app, and it participates
 * in the focus trap — a native confirm steals focus from the media lightbox in a
 * way no test can describe.
 *
 * `DialogTitle` and `DialogDescription` are always rendered: Radix requires both
 * for an accessible name and description, and the accessibility gate fails
 * without them. Callers therefore pass real copy, never an empty string.
 */
export interface ConfirmDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  title: string
  description: React.ReactNode
  /** Label of the button that performs the action. */
  confirmLabel: string
  cancelLabel?: string
  /** Tints the confirm button as destructive. */
  destructive?: boolean
  /** Disables both buttons while the action is in flight, so it cannot double-fire. */
  busy?: boolean
  onConfirm: () => void
  /**
   * Portal target. Pass the media lightbox's content element when this dialog is
   * opened from inside it, so the lightbox's focus trap still contains it.
   */
  portalContainer?: PortalContainer
}

export function ConfirmDialog({
  open,
  onOpenChange,
  title,
  description,
  confirmLabel,
  cancelLabel = "Cancel",
  destructive = false,
  busy = false,
  onConfirm,
  portalContainer,
}: ConfirmDialogProps) {
  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent
        portalContainer={portalContainer}
        data-testid="confirm-dialog"
        aria-busy={busy || undefined}
        // The built-in close control reports the same intent as Cancel, so it is
        // withdrawn while the action is in flight — otherwise it is a second,
        // unguarded way out of a dialog that must not be dismissed mid-request.
        // Escape is handled by Radix; the busy state must not let a half-finished
        // action be dismissed and retried.
        showCloseButton={!busy}
        onEscapeKeyDown={(event) => {
          if (busy) {
            event.preventDefault()
          }
        }}
        onPointerDownOutside={(event) => {
          if (busy) {
            event.preventDefault()
          }
        }}
      >
        <DialogHeader>
          <DialogTitle>{title}</DialogTitle>
          <DialogDescription>{description}</DialogDescription>
        </DialogHeader>
        <DialogFooter>
          <Button
            variant="outline"
            onClick={() => onOpenChange(false)}
            disabled={busy}
            data-testid="confirm-dialog-cancel"
          >
            {cancelLabel}
          </Button>
          <Button
            variant={destructive ? "destructive" : "default"}
            onClick={onConfirm}
            disabled={busy}
            data-testid="confirm-dialog-confirm"
          >
            {confirmLabel}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}

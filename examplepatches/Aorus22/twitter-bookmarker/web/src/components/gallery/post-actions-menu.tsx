/* eslint-disable react-refresh/only-export-components -- this file exports its accessible-name builder alongside the component: the name and the menu it names have to stay in one place or they drift. */
import * as React from "react"
import { cn } from "cn"
import { FolderInputIcon, MoreVerticalIcon, Trash2Icon } from "lucide-react"

import { Button } from "@/components/ui/button"
import type { PortalContainer } from "@/components/ui/dialog"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import type { GalleryPost } from "@/types"

/** The menu row that opens the folder picker. */
export const MOVE_POST_LABEL = "Move to folder"
/** The menu row that opens the confirmation dialog. */
export const DELETE_POST_LABEL = "Delete bookmark"

/**
 * The accessible name of one post's kebab button.
 *
 * Exported because the tests and the accessibility gate both need to find a
 * specific post's menu, and naming it here keeps the two from drifting.
 */
export function postActionsLabel(post: GalleryPost): string {
  return `More actions for ${post.username}`
}

export interface PostActionsMenuProps {
  post: GalleryPost
  /** Ask for confirmation; the page owns the dialog and the request. */
  onRequestDelete: (post: GalleryPost) => void
  /** Open the folder picker; the page owns the dialog and the request. */
  onRequestMove: (post: GalleryPost) => void
  /**
   * Portal target for the menu. Pass the media lightbox's content element when
   * the menu is opened from inside it: Radix mounts to `document.body` by
   * default, which would place the menu outside the lightbox's focus trap and
   * break the guarantee that Tab never escapes the dialog.
   */
  portalContainer?: PortalContainer
  /** Placement/styles for the trigger, so the card and the panel can differ. */
  className?: string
}

/**
 * The per-post overflow menu: move to another folder, or delete.
 *
 * The menu itself does not talk to the API. It reports intent upward so a single
 * set of dialogs lives on the page instead of one per card, and so the same menu
 * works identically on a grid card and inside the lightbox.
 *
 * The trigger is a real `<button>` that stays in the DOM and is reachable by
 * keyboard — the card only *hides* it with opacity until hover or focus, because
 * a control that cannot be reached without a pointer is not usable and the
 * accessibility gate fails on the missing focus ring.
 */
export function PostActionsMenu({
  post,
  onRequestDelete,
  onRequestMove,
  portalContainer,
  className,
}: PostActionsMenuProps) {
  // Set while an item is opening a dialog. Radix restores focus to the trigger
  // when the menu closes, which would fight the dialog for it a tick later; with
  // this flag the menu stands down and lets the dialog take focus itself.
  const openingDialogRef = React.useRef(false)

  const request = (open: (post: GalleryPost) => void) => {
    openingDialogRef.current = true
    open(post)
  }

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button
          variant="ghost"
          size="icon-sm"
          aria-label={postActionsLabel(post)}
          title={postActionsLabel(post)}
          data-testid="post-actions-trigger"
          className={cn("bg-surface/85 backdrop-blur-xs", className)}
        >
          <MoreVerticalIcon />
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent
        portalContainer={portalContainer}
        data-testid="post-actions-menu"
        onCloseAutoFocus={(event) => {
          if (openingDialogRef.current) {
            openingDialogRef.current = false
            event.preventDefault()
          }
        }}
      >
        <DropdownMenuItem
          onSelect={() => request(onRequestMove)}
          data-testid="post-action-move"
        >
          <FolderInputIcon />
          {MOVE_POST_LABEL}
        </DropdownMenuItem>
        <DropdownMenuSeparator />
        <DropdownMenuItem
          variant="destructive"
          onSelect={() => request(onRequestDelete)}
          data-testid="post-action-delete"
        >
          <Trash2Icon />
          {DELETE_POST_LABEL}
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}

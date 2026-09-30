/* eslint-disable react-refresh/only-export-components -- this file exports the dialog's copy alongside the component, so the component and its tests read the same sentence. */
import { ConfirmDialog } from "@/components/ui/confirm-dialog"
import type { PortalContainer } from "@/components/ui/dialog"
import type { GalleryPost } from "@/types"

/** Title of the delete confirmation. Exported so tests assert the real copy. */
export const DELETE_POST_TITLE = "Delete this bookmark?"
/** The confirm button's label. */
export const DELETE_POST_CONFIRM_LABEL = "Delete"

/**
 * The copy shown under the title, naming the post and stating the consequence.
 *
 * The second sentence is not decoration: it is the reason this dialog can offer a
 * destructive action at all. The backend moves the row into
 * `deleted_bookmarks` instead of destroying it, so telling the user *how* to get
 * it back is part of the feature, not a disclaimer.
 */
export function deletePostDescription(post: GalleryPost) {
  return `${post.author} (${post.username}) will be removed from this gallery and from the extension's saved list. The bookmark is kept in the database's deleted table, so it can be restored by hand later.`
}

export interface DeletePostDialogProps {
  post: GalleryPost | null
  open: boolean
  onOpenChange: (open: boolean) => void
  /** True while the request is in flight; both buttons are disabled. */
  busy?: boolean
  onConfirm: () => void
  portalContainer?: PortalContainer
}

/**
 * Confirmation for deleting one bookmark.
 *
 * A custom dialog rather than `window.confirm`: the copy can explain the
 * recoverability (a native confirm cannot be styled or described), and it stays
 * inside the media lightbox's focus trap when it is opened from there.
 */
export function DeletePostDialog({
  post,
  open,
  onOpenChange,
  busy = false,
  onConfirm,
  portalContainer,
}: DeletePostDialogProps) {
  // `post` is null only while the page is closing the dialog. Rendering nothing
  // rather than an empty shell keeps the title/description pair meaningful.
  if (post === null) {
    return null
  }

  return (
    <ConfirmDialog
      open={open}
      onOpenChange={onOpenChange}
      title={DELETE_POST_TITLE}
      description={deletePostDescription(post)}
      confirmLabel={DELETE_POST_CONFIRM_LABEL}
      destructive
      busy={busy}
      onConfirm={onConfirm}
      portalContainer={portalContainer}
    />
  )
}

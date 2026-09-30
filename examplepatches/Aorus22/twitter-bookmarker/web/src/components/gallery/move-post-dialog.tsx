import { FolderInputIcon } from "lucide-react"

import { Button } from "@/components/ui/button"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  type PortalContainer,
} from "@/components/ui/dialog"
import { useCollections } from "@/hooks/use-collections"
import { isApiError } from "@/lib/api"
import { formatCount } from "@/lib/collection-meta"
import type { GalleryPost } from "@/types"

/** Title of the folder picker. */
export const MOVE_POST_TITLE = "Move to another folder"
/** Shown when the archive holds no other folder to move into. */
export const MOVE_POST_EMPTY_MESSAGE =
  "This is the only folder in your archive. Create another one in the extension first."
/** Shown when the folder list could not be loaded. */
export const MOVE_POST_ERROR_MESSAGE = "Could not load your folders."

export interface MovePostDialogProps {
  post: GalleryPost | null
  /** The folder the post is in now, which is excluded from the list. */
  currentSlug: string
  open: boolean
  onOpenChange: (open: boolean) => void
  /** True while the move is in flight; every folder is disabled. */
  busy?: boolean
  onConfirm: (slug: string) => void
  portalContainer?: PortalContainer
}

/**
 * Pick a destination folder for one bookmark.
 *
 * The list is the archive's real folders, fetched when the dialog opens, minus
 * the one the post is already in. The web app never creates a folder — the
 * extension owns folder names — so this dialog can only choose among existing
 * ones, and the backend answers 404 for a slug that has disappeared meanwhile.
 *
 * The body is a separate component on purpose: Radix mounts the dialog content
 * only while it is open, so `useCollections` mounts with it and the folder list
 * is fetched on open rather than on every render of the page.
 */
export function MovePostDialog({
  post,
  currentSlug,
  open,
  onOpenChange,
  busy = false,
  onConfirm,
  portalContainer,
}: MovePostDialogProps) {
  if (post === null) {
    return null
  }

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent
        portalContainer={portalContainer}
        data-testid="move-post-dialog"
        className="sm:max-w-md"
        // The close control is the only way out of this dialog, so it stays
        // available — except while a move is in flight, when dismissing would
        // leave a request running against a screen that has already moved on.
        showCloseButton={!busy}
      >
        <DialogHeader>
          <DialogTitle>{MOVE_POST_TITLE}</DialogTitle>
          <DialogDescription>
            {post.author} ({post.username}) is currently in one folder. Pick
            another one for it.
          </DialogDescription>
        </DialogHeader>
        <MovePostDialogBody
          currentSlug={currentSlug}
          busy={busy}
          onConfirm={onConfirm}
        />
      </DialogContent>
    </Dialog>
  )
}

interface MovePostDialogBodyProps {
  currentSlug: string
  busy: boolean
  onConfirm: (slug: string) => void
}

function MovePostDialogBody({
  currentSlug,
  busy,
  onConfirm,
}: MovePostDialogBodyProps) {
  const { collections, status, error, errorMessage, refetch } = useCollections()

  if (status === "loading") {
    return (
      <p className="text-muted-foreground" data-testid="move-post-loading">
        Loading folders…
      </p>
    )
  }

  if (status === "error") {
    // The shared copy is written for a gallery view and names a *collection*,
    // which is the wrong noun while the user is picking a folder. The one
    // message worth keeping verbatim is the transport one ("could not
    // connect"): it is strictly more informative than "could not load your
    // folders", and it is recognisable as such rather than by matching strings.
    const failureMessage =
      isApiError(error) && error.isNetworkError
        ? errorMessage
        : MOVE_POST_ERROR_MESSAGE

    return (
      <div className="flex flex-col gap-2" data-testid="move-post-error">
        <p className="text-muted-foreground">{failureMessage}</p>
        <Button variant="outline" onClick={refetch} className="self-start">
          Retry
        </Button>
      </div>
    )
  }

  // The folder the post is already in is not a destination.
  const destinations = collections.filter(
    (collection) => collection.slug !== currentSlug
  )

  if (destinations.length === 0) {
    return (
      <p className="text-muted-foreground" data-testid="move-post-empty">
        {MOVE_POST_EMPTY_MESSAGE}
      </p>
    )
  }

  return (
    <ul
      className="flex max-h-72 flex-col gap-1 overflow-y-auto"
      data-testid="move-post-list"
    >
      {destinations.map((collection) => (
        <li key={collection.slug}>
          <Button
            variant="ghost"
            disabled={busy}
            onClick={() => onConfirm(collection.slug)}
            data-testid="move-post-option"
            data-slug={collection.slug}
            className="h-auto w-full justify-start gap-2 px-2 py-2 text-left"
          >
            <FolderInputIcon />
            <span className="flex min-w-0 flex-col items-start">
              <span className="truncate">{collection.name}</span>
              <span className="text-xs font-normal text-muted-foreground">
                {formatCount(collection.post_count, "post")}
              </span>
            </span>
          </Button>
        </li>
      ))}
    </ul>
  )
}

import { ClampedPostText } from "@/components/gallery/clamped-post-text"
import { PostActionsMenu } from "@/components/gallery/post-actions-menu"
import { PostMediaGrid } from "@/components/gallery/post-media-grid"
import { TextPostCard } from "@/components/gallery/text-post-card"
import type { PortalContainer } from "@/components/ui/dialog"
import { OPEN_ON_X_LABEL } from "@/lib/messages"
import { pickPlaceholderGradient } from "@/lib/placeholder"
import { displayHandle, formatPostMeta } from "@/lib/post-meta"
import type { GalleryPost } from "@/types"

/**
 * One post card (PRD-2 §19/§23/§24, design spec §3.3).
 *
 * `292` wide, `r18` (`rounded-lg`), `surface`, hairline `border`,
 * `shadow-post`, `10px` padding. The card unit is the tweet: a four-image tweet
 * is exactly one card whose media region renders all four images.
 *
 * Layout, top to bottom:
 *   1. media region (`272` wide, r14) — `PostMediaGrid`, or the gradient quote
 *      panel from `TextPostCard` when `media` is empty. With `onOpenMedia` each
 *      tile is a named, focusable lightbox trigger (Phase 8, LIGHT-01);
 *   2. avatar `28×28` r14 (deterministic gradient seeded from `username`; the
 *      stored post has no avatar URL, spec §5) + author Inter SemiBold 11 +
 *      `@username` Inter Regular 9 muted. The row is inset 4px inside the 10px padding, which
 *      puts the avatar at x=14 and the author at x=50 exactly as Figma measures;
 *   3. body text Inter Regular 11 ink, 264 wide, 12px below the header row,
 *      with the controlled clamp + `Show more` (COLL-08);
 *   4. meta `Mar 12, 2026 · Saved Apr 3` Inter Regular 9 muted;
 *   5. `Open on X ↗` Inter SemiBold 10 as a real `<a>` to the stored `url` with
 *      `target="_blank" rel="noopener noreferrer"` — the tweet URL is always
 *      reachable as text, never only through a clickable image (PRD-2 §67).
 *
 * For a text-only post the quote panel *is* the tweet text, so the body
 * paragraph is omitted rather than duplicated.
 */

/**
 * The curation actions a card can offer. Optional as a whole, so a card rendered
 * without them (a read-only context, or a test of the card's own layout) shows no
 * kebab at all rather than a dead button.
 */
export interface PostCardActions {
  onRequestDelete: (post: GalleryPost) => void
  onRequestMove: (post: GalleryPost) => void
  /**
   * Portal target for the menu. Only the media lightbox needs one: its content
   * element keeps the menu inside the dialog's focus trap.
   */
  portalContainer?: PortalContainer
}

export interface PostCardProps {
  post: GalleryPost
  /** Reference "today" for the year-aware date format; defaults to the clock. */
  now?: Date
  /**
   * Phase 8 (LIGHT-01/LIGHT-05): makes each media tile a keyboard-reachable
   * lightbox trigger and hands back the trigger element so focus can be
   * restored to it when the lightbox closes. Omit for a non-interactive card.
   */
  onOpenMedia?: (mediaIndex: number, trigger: HTMLButtonElement) => void
  /**
   * Curation: shows the per-post kebab menu. The card only *reports* the intent;
   * the page owns the dialogs and the requests, so one set of dialogs serves
   * every card instead of one per card.
   */
  actions?: PostCardActions
}

export function PostCard({ post, now, onOpenMedia, actions }: PostCardProps) {
  const isTextOnly = post.media.length === 0
  const meta = formatPostMeta(post, now === undefined ? {} : { now })
  const avatar = pickPlaceholderGradient(post.username)

  const handle = displayHandle(post.username)
  const describeAlt = (index: number, total: number) =>
    total === 1
      ? `Media from ${handle}`
      : `Media ${index + 1} of ${total} from ${handle}`

  return (
    <article
      data-testid="post-card"
      data-media-count={post.media.length}
      className="group relative flex w-full flex-col rounded-lg border border-border bg-surface p-[10px] shadow-post"
    >
      {actions === undefined ? null : (
        // Hidden until the card is hovered or something inside it takes focus.
        // `focus-within` is what keeps it reachable by keyboard: a control that
        // only appears on hover is unusable without a pointer, and the
        // accessibility gate fails a Tab stop that paints no ring. The button
        // stays in the DOM either way, so it is always in the tab order.
        <div className="absolute top-2 right-2 z-10 opacity-0 transition-opacity duration-150 group-hover:opacity-100 focus-within:opacity-100">
          <PostActionsMenu
            post={post}
            onRequestDelete={actions.onRequestDelete}
            onRequestMove={actions.onRequestMove}
            portalContainer={actions.portalContainer}
            className="shadow-card"
          />
        </div>
      )}

      {isTextOnly ? (
        <TextPostCard text={post.text} seed={post.tweet_id} />
      ) : (
        <PostMediaGrid
          media={post.media}
          seed={post.tweet_id}
          describeAlt={describeAlt}
          onOpenMedia={onOpenMedia}
        />
      )}

      <div className="mt-3 flex items-center gap-2 px-1">
        <span
          aria-hidden="true"
          data-testid="post-avatar"
          style={{ backgroundImage: avatar.value }}
          className="size-7 shrink-0 rounded-md"
        />
        <div className="min-w-0">
          <p className="truncate text-[11px] leading-[1.4] font-semibold text-ink">
            {post.author}
          </p>
          <p className="truncate text-[9px] leading-[1.4] text-muted">
            {handle}
          </p>
        </div>
      </div>

      {isTextOnly ? null : (
        <ClampedPostText text={post.text} className="mt-3 px-1" />
      )}

      <p
        data-testid="post-meta"
        className="mt-3 px-1 text-[9px] leading-[1.4] text-muted"
      >
        {meta}
      </p>

      <a
        data-testid="open-on-x"
        href={post.url}
        target="_blank"
        rel="noopener noreferrer"
        className="mt-1.5 w-fit rounded-sm px-1 text-[10px] leading-[1.4] font-semibold text-ink transition-colors outline-none hover:text-accent focus-visible:ring-3 focus-visible:ring-ring/50"
      >
        {OPEN_ON_X_LABEL}
      </a>
    </article>
  )
}

import {
  ChevronLeft,
  ChevronRight,
  ChevronsLeft,
  ChevronsRight,
} from "lucide-react"
import { useEffect, useMemo, useRef, type KeyboardEvent, type Ref } from "react"

import { LightboxInfoPanel } from "@/components/gallery/lightbox-info-panel"
import type { PostCardActions } from "@/components/gallery/post-card"
import { MediaImage } from "@/components/gallery/media-image"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogTitle,
} from "@/components/ui/dialog"
import {
  flattenMediaSlots,
  mediaDotWindow,
  postsWithMedia,
  slotAt,
} from "@/lib/lightbox"
import { displayHandle } from "@/lib/post-meta"
import {
  LIGHTBOX_KEYBOARD_HINT,
  LIGHTBOX_NEXT_LABEL,
  LIGHTBOX_NEXT_POST_LABEL,
  LIGHTBOX_PREVIOUS_LABEL,
  LIGHTBOX_PREVIOUS_POST_LABEL,
  LIGHTBOX_TITLE_PREFIX,
  formatLightboxCounter,
} from "@/lib/messages"
import { cn } from "@/lib/utils"
import type { GalleryPost } from "@/types"

/**
 * The media lightbox (LIGHT-01…LIGHT-06, PRD-2 §26/§27/§67, design spec §3.5).
 *
 * A **controlled, presentational** Radix Dialog: the caller (the
 * `useMediaLightbox` controller in `CollectionPage`) owns the flattened index,
 * and this component derives the active `(postIndex, mediaIndex)` slot and every
 * control's enabled state from `posts` + `index` with the same pure helpers the
 * controller uses. Deriving rather than storing means a late page append can
 * never make the rendered item disagree with the index.
 *
 * **Two navigation axes, two pairs of controls.** PRD-2 §27's subject is one
 * tweet ("next image / previous image di dalam tweet yang sama"), so the arrows
 * *inside* the media area move between that tweet's own media and stop at its
 * ends. Moving between tweets is a different job, and it gets its own pair,
 * rendered *outside* the panel in the page gutter where it cannot be mistaken for
 * the media arrows, with double-chevron glyphs so the two pairs stay
 * distinguishable at a glance and by icon alone. Below `1400px` the panel leaves
 * no gutter to sit in, so the same two buttons fall back to the media area's top
 * corners — still separate from the mid-height media arrows, still the same
 * controls and the same accessible names.
 *
 * The `n / total` counter of the original design is now **dots**, one per media
 * in the open tweet. The old number was the position in the *flattened* sequence
 * of loaded media, which read as "1 / 39" for a tweet whose only image happened
 * to be 39th in the collection — a number about the archive, not about the tweet.
 * Dots cannot be misread that way, and `mediaDotWindow` slides a window once a
 * thread carries more media than can be read as dots. The exact position is kept
 * for assistive tech as the region's accessible name.
 *
 * Desktop (design spec §3.5): a `1220×820` r24 `surface` panel with a 30px
 * inset, an `800×760` r20 near-black media area holding the contained active
 * image, and a `330×760` r20 `surface-warm` info panel beside it. Below `md` the
 * panel is `flex-col` — media on top at ~55vh, info stacked below. The panel
 * deliberately does **not** clip on `md` and up: that is what lets the post
 * controls sit in the gutter while still being children of the dialog content,
 * and so still inside its focus trap.
 *
 * Keyboard (PRD-2 §27): `Escape` and the focus trap come from Radix; `←`/`→`
 * drive the media arrows and `↑`/`↓` the post arrows, handled on the dialog
 * content (never a global listener) and `preventDefault`ed so the page behind
 * cannot scroll. Radix does not bind the arrow keys (verified: its `FocusScope`
 * intercepts only `Tab`), so they always reach this handler.
 *
 * Image `alt`: unlike the decorative card thumbnails, the lightbox image is the
 * dialog's primary content, so it carries a real author-derived name matching
 * the trigger that opened it; the metadata panel carries the tweet details.
 */

export interface MediaLightboxProps {
  /** The accumulated loaded gallery — the flattened navigation sequence. */
  posts: readonly GalleryPost[]
  /**
   * 0-based position in the flattened media sequence, or `null` when the
   * lightbox is closed. Text-only posts are skipped by the flattening.
   */
  index: number | null
  /** Backend collection `DisplayName` for the `Collection <name>` meta line. */
  collectionName: string
  /** Step one media back inside the open tweet (no-op at its first media). */
  onPrevMedia: () => void
  /** Step one media forward inside the open tweet (no-op at its last media). */
  onNextMedia: () => void
  /** Step to the previous tweet that has media (no-op at the first loaded). */
  onPrevPost: () => void
  /** Step to the next tweet that has media (no-op at the last loaded). */
  onNextPost: () => void
  /** Close the lightbox. */
  onClose: () => void
  /** Reference "today" for the year-aware date format; defaults to the clock. */
  now?: Date
  /**
   * Curation actions, forwarded to the info panel's kebab menu.
   *
   * The caller must also pass `contentRef` when these are set: the menu has to be
   * portalled into the dialog's content element, or it mounts on `document.body`
   * and escapes the focus trap this dialog guarantees.
   */
  actions?: PostCardActions
  /**
   * Ref to the dialog's content element.
   *
   * Exposed so the page can use it as the portal target for anything the lightbox
   * opens (the kebab menu, the delete and move dialogs). Without it those mount on
   * `document.body` and Tab would leave the dialog, which both the accessibility
   * gate and `collection-page-lightbox.test.tsx` assert never happens.
   */
  contentRef?: Ref<HTMLDivElement>
}

/** Author-derived `alt` for the active media (matches the tile trigger name). */
function describeMediaAlt(
  username: string,
  mediaIndex: number,
  mediaTotal: number
): string {
  const handle = displayHandle(username)
  return mediaTotal === 1
    ? `Media from ${handle}`
    : `Media ${mediaIndex + 1} of ${mediaTotal} from ${handle}`
}

/**
 * Shared shell of the four round controls. The positioning classes are kept out
 * of this constant on purpose: `top` and `left` differ per pair, and two
 * conflicting Tailwind `top-*` utilities in one class list would be resolved by
 * stylesheet order rather than by intent.
 */
const CONTROL_BASE =
  "absolute flex size-10 items-center justify-center rounded-full border border-border bg-surface text-ink shadow-card outline-none transition-colors hover:bg-surface-warm focus-visible:ring-3 focus-visible:ring-ring/50 disabled:cursor-not-allowed disabled:opacity-40"

const MEDIA_CONTROL_CLASS = cn(CONTROL_BASE, "top-1/2 -translate-y-1/2")

const POST_CONTROL_CLASS = cn(
  CONTROL_BASE,
  // Inside the media area's top corners until there is a gutter to move into.
  "top-[42px] min-[1400px]:top-1/2 min-[1400px]:-translate-y-1/2"
)

/**
 * Horizontal offsets for the post pair. The left button is always 12px inside the
 * media area's left edge, which is the panel padding (`30`) plus `12`. The right
 * one has to skip over the info panel when the two sit side by side: panel
 * padding `30` + info panel `330` + flex gap `30` + the same `12` inset = `402`.
 * Below `md` the panel is stacked, so the media area spans the full width and
 * `42` is right again. From `1400px` there is a real gutter and both move outside
 * the panel — `-14` is `-56px`, and the panel is `min(1220, 100vw - 32)` centered,
 * so the gutter is at least 90px at that width.
 *
 * The fallback deliberately stops at the media area rather than the panel's own
 * corners: the panel's top-right is where the `×` close control lives, and a
 * post button landing on top of it would be both an overlap and a focus-trap
 * collision.
 *
 * **The three tiers are expressed so that no two can match at the same time.**
 * Wiring them as `right-[42px] md:right-[402px] min-[1400px]:-right-14` looked
 * equivalent and was not: Tailwind emits `md:` *after* `min-[1400px]:` in the
 * stylesheet (checked in the built CSS — offset 41692 vs 40931), so from 1400px
 * up both rules matched, the later `md:` value won, and `402px` from the panel's
 * right edge is exactly the media area's `right-3` — the post button landed on
 * top of the media `→` and hid it. `max-md` and `min-[1400px]` cannot both match,
 * so the outcome no longer depends on emission order; the unprefixed value is
 * only the 768–1399 case and a safe fallback, and base utilities are always
 * emitted before variant ones.
 */
const POST_PREV_POSITION = "left-[42px] min-[1400px]:-left-14"

const POST_NEXT_POSITION =
  "right-[402px] max-md:right-[42px] min-[1400px]:-right-14"

export function MediaLightbox({
  posts,
  index,
  collectionName,
  onPrevMedia,
  onNextMedia,
  onPrevPost,
  onNextPost,
  onClose,
  now,
  actions,
  contentRef,
}: MediaLightboxProps) {
  const slots = useMemo(() => flattenMediaSlots(posts), [posts])
  const slot = index === null ? undefined : slotAt(slots, index)
  const post = slot === undefined ? undefined : posts[slot.postIndex]
  const hasActive = slot !== undefined && post !== undefined

  const mediaIndex = slot === undefined ? 0 : slot.mediaIndex
  const mediaTotal = post === undefined ? 0 : post.media.length
  const hasPrevMedia = hasActive && mediaIndex > 0
  const hasNextMedia = hasActive && mediaIndex < mediaTotal - 1

  // Which tweets own media, and where the open one sits among them. A tweet with
  // no media is never a destination, so post navigation cannot land on a tweet
  // with nothing to show.
  const owners = useMemo(() => postsWithMedia(slots), [slots])
  const ownerPosition = slot === undefined ? -1 : owners.indexOf(slot.postIndex)
  const hasPrevPost = hasActive && ownerPosition > 0
  const hasNextPost = hasActive && ownerPosition < owners.length - 1

  const dots = mediaDotWindow(mediaIndex, mediaTotal)
  const counterLabel = formatLightboxCounter(mediaIndex + 1, mediaTotal)

  const prevMediaRef = useRef<HTMLButtonElement | null>(null)
  const nextMediaRef = useRef<HTMLButtonElement | null>(null)
  const prevPostRef = useRef<HTMLButtonElement | null>(null)
  const nextPostRef = useRef<HTMLButtonElement | null>(null)

  // A browser blurs a control the instant it becomes `disabled`, and Radix's
  // focus trap ignores a blur whose `relatedTarget` is null — so arrow
  // navigation would die whenever it reached a boundary and disabled the button
  // that had focus (jsdom keeps reporting the disabled button as the active
  // element, which also makes `user-event` swallow the next key press). Pull
  // focus back onto an enabled control whenever the active media changes and
  // focus is no longer on something usable. A one-media tweet disables both
  // media arrows, so the chain continues into the post arrows before falling
  // back to the close control.
  useEffect(() => {
    if (!hasActive) {
      return
    }
    const focused = document.activeElement
    const focusLost =
      focused === null ||
      focused === document.body ||
      (focused instanceof HTMLButtonElement && focused.disabled)
    if (!focusLost) {
      return
    }

    const fallback =
      (hasNextMedia ? nextMediaRef.current : null) ??
      (hasPrevMedia ? prevMediaRef.current : null) ??
      (hasNextPost ? nextPostRef.current : null) ??
      (hasPrevPost ? prevPostRef.current : null) ??
      document.querySelector<HTMLElement>('[data-testid="lightbox-close"]')
    fallback?.focus()
  }, [hasActive, index, hasNextMedia, hasPrevMedia, hasNextPost, hasPrevPost])

  const handleKeyDown = (event: KeyboardEvent<HTMLDivElement>) => {
    if (event.key === "ArrowLeft") {
      event.preventDefault()
      onPrevMedia()
      return
    }
    if (event.key === "ArrowRight") {
      event.preventDefault()
      onNextMedia()
      return
    }
    if (event.key === "ArrowUp") {
      event.preventDefault()
      onPrevPost()
      return
    }
    if (event.key === "ArrowDown") {
      event.preventDefault()
      onNextPost()
    }
  }

  const mediaSrc =
    slot === undefined || post === undefined
      ? ""
      : (post.media[slot.mediaIndex] ?? "")

  return (
    <Dialog
      open={hasActive}
      onOpenChange={(next) => {
        if (!next) {
          onClose()
        }
      }}
    >
      <DialogContent
        ref={contentRef}
        data-testid="media-lightbox"
        showCloseButton={false}
        overlayClassName="bg-[#120d14]/82 supports-backdrop-filter:backdrop-blur-none"
        onKeyDown={handleKeyDown}
        className="flex max-h-[calc(100svh-2rem)] w-[calc(100vw-2rem)] flex-col gap-[30px] overflow-y-auto rounded-2xl bg-surface p-[30px] shadow-popover ring-0 sm:max-w-[1220px] md:h-[820px] md:flex-row md:overflow-visible"
      >
        <DialogTitle className="sr-only">
          {slot === undefined || post === undefined
            ? LIGHTBOX_TITLE_PREFIX
            : `${LIGHTBOX_TITLE_PREFIX} ${post.author} (${displayHandle(post.username)})`}
        </DialogTitle>
        <DialogDescription className="sr-only">
          {LIGHTBOX_KEYBOARD_HINT}
        </DialogDescription>

        <div
          data-testid="lightbox-media-area"
          className="relative flex h-[55vh] w-full items-center justify-center overflow-hidden rounded-xl bg-[#0b080d] md:h-auto md:min-h-0 md:flex-1"
        >
          {slot === undefined || post === undefined ? null : (
            <>
              <MediaImage
                key={`${post.tweet_id}:${slot.mediaIndex}`}
                src={mediaSrc}
                fallbackSeed={`${post.tweet_id}:${slot.mediaIndex}`}
                alt={describeMediaAlt(
                  post.username,
                  slot.mediaIndex,
                  post.media.length
                )}
                loading="eager"
                className="max-h-full max-w-full object-contain"
              />

              <button
                ref={prevMediaRef}
                type="button"
                data-testid="lightbox-prev"
                aria-label={LIGHTBOX_PREVIOUS_LABEL}
                disabled={!hasPrevMedia}
                onClick={onPrevMedia}
                className={cn(MEDIA_CONTROL_CLASS, "left-3")}
              >
                <ChevronLeft aria-hidden="true" className="size-5" />
              </button>

              <button
                ref={nextMediaRef}
                type="button"
                data-testid="lightbox-next"
                aria-label={LIGHTBOX_NEXT_LABEL}
                disabled={!hasNextMedia}
                onClick={onNextMedia}
                className={cn(MEDIA_CONTROL_CLASS, "right-3")}
              >
                <ChevronRight aria-hidden="true" className="size-5" />
              </button>

              {/* One dot per media *in this tweet*. `data-media-index` and
                  `data-media-total` expose the state the dots encode so the
                  browser acceptance run can assert that the indicator counts
                  this tweet and not the loaded archive. */}
              <div
                data-testid="lightbox-counter"
                data-media-index={mediaIndex}
                data-media-total={mediaTotal}
                role="status"
                aria-label={counterLabel}
                className="absolute bottom-3 left-1/2 flex -translate-x-1/2 items-center gap-1.5 rounded-full bg-surface/85 px-2.5 py-1.5"
              >
                <span className="sr-only">{counterLabel}</span>
                {Array.from(
                  { length: dots.count },
                  (_, offset) => dots.start + offset
                ).map((dot) => (
                  <span
                    key={dot}
                    aria-hidden="true"
                    className={cn(
                      "size-1.5 rounded-full transition-colors",
                      dot === mediaIndex ? "bg-ink" : "bg-ink/25"
                    )}
                  />
                ))}
              </div>
            </>
          )}
        </div>

        {/* The post pair. A sibling of the media area rather than a child of it,
            so it can escape the media area's `overflow-hidden` and reach the
            page gutter; a child of the dialog content, so Radix's focus trap
            still owns it. */}
        {slot === undefined || post === undefined ? null : (
          <>
            <button
              ref={prevPostRef}
              type="button"
              data-testid="lightbox-prev-post"
              aria-label={LIGHTBOX_PREVIOUS_POST_LABEL}
              disabled={!hasPrevPost}
              onClick={onPrevPost}
              className={cn(POST_CONTROL_CLASS, POST_PREV_POSITION)}
            >
              <ChevronsLeft aria-hidden="true" className="size-5" />
            </button>

            <button
              ref={nextPostRef}
              type="button"
              data-testid="lightbox-next-post"
              aria-label={LIGHTBOX_NEXT_POST_LABEL}
              disabled={!hasNextPost}
              onClick={onNextPost}
              className={cn(POST_CONTROL_CLASS, POST_NEXT_POSITION)}
            >
              <ChevronsRight aria-hidden="true" className="size-5" />
            </button>
          </>
        )}

        {slot === undefined || post === undefined ? null : (
          <LightboxInfoPanel
            post={post}
            collectionName={collectionName}
            onClose={onClose}
            now={now}
            actions={actions}
          />
        )}
      </DialogContent>
    </Dialog>
  )
}

import { MediaImage } from "@/components/gallery/media-image"
import {
  mediaGridClassName,
  mediaTileClassName,
  selectMediaLayout,
} from "@/lib/post-media"
import { cn } from "@/lib/utils"

/**
 * Adaptive multi-media region for one post (PRD-2 §20, design spec §3.3).
 *
 * The card unit is the tweet, so **every** URL in `media` is rendered — never
 * only the first image:
 *
 *   1 → one natural-aspect tile
 *   2 → 50/50 side by side
 *   3 → wide tile on top + 2 below
 *   4+ → 2 columns × N rows (4 → 2×2, 5/6 → 2×3, …)
 *
 * Tiles are 6px apart and r14. Each goes through `MediaImage`, so the stored
 * `https://pbs.twimg.com/...` URL is used verbatim (no proxy, no cache, no
 * rewriting), the image is `loading="lazy"` + `decoding="async"`, and a broken
 * URL degrades to a same-box neutral gradient placeholder (PRD-2 §25/§62).
 *
 * Phase 8 (LIGHT-01, PRD-2 §67): when `onOpenMedia` is provided each tile is a
 * **real focusable `<button>`** with an author-derived accessible name and a
 * visible focus ring, so the media is keyboard reachable and opens the lightbox
 * — a bare clickable `<div>`/`<img>` is never the only affordance. The image
 * inside that trigger is decorative (`alt=""`) because the button already
 * carries the name; without a handler the grid stays the static Phase 5
 * renderer whose tiles carry the `alt` themselves (design spec §6).
 */

export interface PostMediaGridProps {
  media: readonly string[]
  /** Stable key for the deterministic placeholder (usually the tweet id). */
  seed: string
  /** Contextual `alt`/accessible name for tile `index` of `total`. */
  describeAlt: (index: number, total: number) => string
  /**
   * Makes every tile a lightbox trigger. The trigger element is passed back so
   * the lightbox can restore focus to it on close (LIGHT-05) without depending
   * on `document.activeElement`, which a browser may not set for a pointer
   * click. Omit for a purely decorative grid (the standalone/card-only render),
   * where the images keep their `alt`.
   */
  onOpenMedia?: (mediaIndex: number, trigger: HTMLButtonElement) => void
  className?: string
}

export function PostMediaGrid({
  media,
  seed,
  describeAlt,
  onOpenMedia,
  className,
}: PostMediaGridProps) {
  const layout = selectMediaLayout(media.length)

  return (
    <div
      data-testid="post-media-grid"
      data-media-layout={layout.kind}
      data-media-count={media.length}
      className={cn(mediaGridClassName(layout), className)}
    >
      {media.map((src, index) => {
        const key = `${src}-${index}`
        const tileClassName = mediaTileClassName(layout, index)
        const label = describeAlt(index, media.length)

        if (onOpenMedia === undefined) {
          return (
            <MediaImage
              key={key}
              src={src}
              fallbackSeed={`${seed}:${index}`}
              alt={label}
              className={tileClassName}
            />
          )
        }

        return (
          <button
            key={key}
            type="button"
            data-testid="post-media-trigger"
            data-media-index={index}
            aria-label={label}
            aria-haspopup="dialog"
            onClick={(event) => {
              onOpenMedia(index, event.currentTarget)
            }}
            className={cn(
              tileClassName,
              "group relative block cursor-zoom-in overflow-hidden outline-none focus-visible:ring-3 focus-visible:ring-ring/50"
            )}
          >
            <MediaImage
              src={src}
              fallbackSeed={`${seed}:${index}`}
              alt=""
              className="size-full transition-transform duration-200 group-hover:scale-[1.02]"
            />
          </button>
        )
      })}
    </div>
  )
}

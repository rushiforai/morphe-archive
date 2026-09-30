import { CollectionCover } from "@/components/gallery/collection-cover"
import { formatCount, sumCounts } from "@/lib/collection-meta"
import { sliceCoverMedia } from "@/lib/cover"
import { cn } from "@/lib/utils"
import type { GalleryCollection } from "@/types"

/**
 * Homepage hero (design spec §3.2, frame `6:16`).
 *
 * `grad-hero`, r-2xl, `shadow-hero`, padding 36; eyebrow, Playfair Bold 46
 * headline, Inter 14 body copy and the `grad-cta` CTA. The CTA is a real
 * in-page anchor to the collections grid — not a dead link — so it works
 * without JS and is keyboard reachable.
 *
 * The hero art is **placeholder art**: it is assembled from the newest
 * `cover_media` across collections when media exists and degrades to
 * deterministic gradient tiles otherwise. Because it reuses
 * `CollectionCover`/`MediaImage`, a missing or broken image set can never break
 * the hero layout.
 */

export interface HeroArtProps {
  media: readonly string[]
  caption: string
  className?: string
}

export function HeroArt({ media, caption, className }: HeroArtProps) {
  return (
    <div
      data-testid="hero-art"
      className={cn(
        "relative h-[272px] w-full max-w-[560px] shrink-0 overflow-hidden rounded-2xl border border-border",
        className
      )}
    >
      <CollectionCover
        media={media}
        seed="gallery-hero-art"
        className="h-full w-full"
      />
      {/* `max-w` keeps the pill clear of the art's border when the summary wraps
          to a second line at narrow widths — without it the box ran right up to
          the edge, which read as an overflow rather than as a caption. */}
      <p className="absolute bottom-4 left-4 max-w-[calc(100%-2rem)] rounded-md bg-black/35 px-3 py-1.5 font-display text-[20px] leading-[1.3] text-white">
        {caption}
      </p>
    </div>
  )
}

export interface GalleryHeroProps {
  collections: readonly GalleryCollection[]
}

export function GalleryHero({ collections }: GalleryHeroProps) {
  const media = sliceCoverMedia(
    collections.flatMap((collection) => collection.cover_media)
  )
  const mediaTotal = sumCounts(collections, (c) => c.media_count)
  // The archive-wide bookmark (post) total. The per-collection rows each carry
  // their own count; this is the only place the whole archive is summed up, so
  // the caption answers "how much have I saved" without opening a single folder.
  const postTotal = sumCounts(collections, (c) => c.post_count)
  const caption =
    collections.length === 0
      ? "Your local archive"
      : [
          formatCount(collections.length, "collection"),
          formatCount(postTotal, "post"),
          formatCount(mediaTotal, "media", "media"),
        ].join(" · ")

  return (
    <section
      aria-labelledby="gallery-heading"
      data-testid="gallery-hero"
      className="rounded-2xl bg-grad-hero p-9 shadow-hero"
    >
      <div className="flex flex-col gap-8 lg:flex-row lg:items-center lg:justify-between">
        <div className="min-w-0">
          <p className="text-[10px] leading-[1.4] font-semibold tracking-[0.12em] text-accent uppercase">
            Your Twitter archive, reimagined
          </p>
          <h1
            id="gallery-heading"
            className="mt-3 max-w-[520px] font-display text-[46px] leading-[1.05] font-bold text-ink"
          >
            Save. Organize.
            <br />
            Relive inspiration.
          </h1>
          <p className="mt-4 max-w-[510px] text-sm leading-[1.45] text-muted">
            Every collection in your local archive, rendered as a gallery. No
            cloud, no algorithmic feed — just your saved things.
          </p>
          <a
            href="#collections-grid"
            className="mt-6 inline-flex h-[42px] w-[134px] items-center justify-center rounded-md border border-white/15 bg-grad-cta text-xs leading-[1.4] font-semibold text-white outline-none focus-visible:ring-3 focus-visible:ring-ring/50"
          >
            Explore gallery
          </a>
        </div>

        <HeroArt media={media} caption={caption} />
      </div>
    </section>
  )
}

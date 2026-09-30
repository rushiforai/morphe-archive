import { Bookmark } from "lucide-react"
import { Link } from "react-router-dom"

import { CollectionCover } from "@/components/gallery/collection-cover"
import {
  formatCollectionMeta,
  formatCount,
  normalizeCount,
} from "@/lib/collection-meta"
import type { GalleryCollection } from "@/types"

/**
 * One collection card (design spec §3.2, PRD-2 §16).
 *
 * `244×330`, `surface`, r20, hairline `border`, `shadow-card`; the collage is a
 * full-bleed top region so the tile corners are clipped by the card's r20.
 *
 * Content decisions, all recorded in the phase plan:
 *   - the meta row carries the PRD-required **last bookmarked date** as well as
 *     the post/media counts (`83 posts · 126 media · Last saved Sep 27`);
 *   - the mockup's one-line description is omitted (spec §7, no description
 *     field) and its slot shows the collection name — real data, not invented
 *     copy;
 *   - the mockup's `•••` overflow control is omitted because no card action
 *     exists (PRD-2 §5, spec §7).
 *
 * The bookmark total is additionally surfaced as a chip on the cover. The meta
 * row already spells it out, but it does so as 11px muted text at the bottom of
 * the card, and "how many are in this folder" is the single thing most people
 * scan a collection for — so the number gets its own glanceable element. The
 * chip is `aria-hidden` because the card link's accessible name already
 * contains the count via the meta row; announcing it twice would be noise.
 *
 * The whole card is a single react-router `<Link>`, so it is keyboard reachable
 * and announcing as one destination (the accessible name repeats name + meta).
 */
export interface CollectionCardProps {
  collection: GalleryCollection
  /** Reference "today" for the year-aware date format; defaults to the clock. */
  now?: Date
}

export function CollectionCard({ collection, now }: CollectionCardProps) {
  const { slug, name, cover_media } = collection
  const displayName = name.trim() === "" ? slug : name
  const meta = formatCollectionMeta(collection, now ? { now } : {})
  const postCount = normalizeCount(collection.post_count)
  const href = `/collections/${encodeURIComponent(slug)}`

  return (
    <li className="w-[244px] max-w-full" data-testid="collection-card">
      <Link
        to={href}
        aria-label={`${displayName}, ${meta}`}
        className="group flex h-[330px] w-full flex-col overflow-hidden rounded-xl border border-border bg-surface shadow-card transition-shadow outline-none hover:shadow-hero focus-visible:ring-3 focus-visible:ring-ring/50"
      >
        <div className="relative h-[181px] w-full shrink-0">
          <CollectionCover
            media={cover_media}
            seed={slug}
            className="h-full w-full"
          />

          {/* The folder's bookmark total, over the collage rather than in the
              text block, so it is readable at a glance. It reuses the hero's
              overlay treatment (`bg-black/45` + white) rather than a `surface`
              pill: the tiles underneath are saturated gradients, and a near-opaque
              cream chip on top of them read as a sticker pasted onto the art.
              `aria-hidden` because the link's accessible name already carries it
              (see the note above). */}
          <span
            aria-hidden="true"
            data-testid="collection-card-count"
            title={formatCount(postCount, "post")}
            className="absolute top-2.5 right-2.5 inline-flex items-center gap-1 rounded-full bg-black/45 px-2.5 py-1 text-[11px] leading-[1.2] font-semibold text-white backdrop-blur-sm"
          >
            <Bookmark className="size-3" fill="currentColor" />
            {postCount}
          </span>
        </div>

        <div className="flex min-h-0 flex-1 flex-col px-[18px] pt-[17px] pb-7">
          <h3 className="line-clamp-2 font-display text-[22px] leading-[1.2] font-bold text-ink">
            {displayName}
          </h3>
          <p className="mt-[7px] truncate text-[11px] leading-[1.45] text-muted">
            {displayName}
          </p>
          <p className="mt-auto truncate text-[11px] leading-[1.4] font-medium text-muted">
            {meta}
          </p>
        </div>
      </Link>
    </li>
  )
}

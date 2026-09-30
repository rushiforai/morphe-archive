import {
  CollectionCard,
  GalleryEmptyState,
  GalleryErrorState,
  GalleryHero,
  MasonrySkeleton,
} from "@/components/gallery"
import { useCollections } from "@/hooks"
import { formatCount } from "@/lib/collection-meta"

/**
 * Homepage route `/` (design spec §3.2, PRD-2 §16/§38/§59/§61).
 *
 * Hero → section header → exactly one grid state:
 *   loading  → `MasonrySkeleton` (never a blank page, PRD-2 §35)
 *   error    → `GalleryErrorState` with the PRD-2 §61 copy and a working Retry
 *   success  → cards, or `GalleryEmptyState` when there are no collections
 *
 * `Recently updated ▾` is a **static label**, not a menu: PRD-2 §38 fixes the
 * ordering to `last_saved_at DESC`, so there is nothing to choose. The footer
 * line closes the frame per spec §3.2.
 */
export function GalleryPage() {
  const { collections, status, errorMessage, refetch } = useCollections()

  return (
    <div className="flex flex-col gap-10 py-4">
      <GalleryHero collections={collections} />

      <section
        id="collections-grid"
        aria-labelledby="collections-heading"
        className="scroll-mt-24"
      >
        <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-2">
          <div className="flex items-baseline gap-3">
            <h2
              id="collections-heading"
              className="font-display text-[28px] leading-[1.2] font-bold text-ink"
            >
              My Collections
            </h2>
            {status === "success" ? (
              <span className="text-[11px] leading-[1.4] font-medium text-muted">
                {formatCount(collections.length, "collection")}
              </span>
            ) : null}
          </div>
          <span className="text-[11px] leading-[1.4] font-medium text-muted">
            Recently updated ▾
          </span>
        </div>

        <div className="mt-6">
          {status === "loading" ? <MasonrySkeleton /> : null}

          {status === "error" ? (
            <GalleryErrorState message={errorMessage} onRetry={refetch} />
          ) : null}

          {status === "success" && collections.length === 0 ? (
            <GalleryEmptyState />
          ) : null}

          {status === "success" && collections.length > 0 ? (
            // justify-center, not flex-start: the cards are a fixed 244px wide
            // inside the shell's rail, so a row of 4 in a 1312px rail leaves
            // ~282px of slack and a row of 3 leaves more still. Flushing them
            // left piled all of it against the right edge, which read as a
            // broken layout. Centring shares the slack between both sides.
            // The section header above stays justify-between on purpose: it is
            // a title row spanning the rail, not part of this grid.
            <ul className="flex flex-wrap justify-center gap-[18px]">
              {collections.map((collection) => (
                <CollectionCard key={collection.slug} collection={collection} />
              ))}
            </ul>
          ) : null}
        </div>
      </section>

      <p className="text-[11px] leading-[1.4] text-muted">
        Local-only · Powered by your local archive · No cloud, no algorithmic
        feed
      </p>
    </div>
  )
}

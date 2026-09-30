import { Skeleton } from "@/components/ui/skeleton"

/**
 * Skeleton cards for the collection grid (PRD-2 §35, design spec §3.6).
 *
 * The page must never be blank while the collections request is in flight, so
 * the loading state is a full grid of card-shaped skeletons rather than a
 * spinner. Phase 7 reuses `MasonrySkeleton` for the post masonry.
 */

export function CollectionCardSkeleton() {
  return (
    <li data-testid="collection-card-skeleton" className="w-[244px] max-w-full">
      <div className="flex h-[330px] w-full flex-col overflow-hidden rounded-xl border border-border bg-surface shadow-card">
        <Skeleton className="h-[181px] w-full rounded-none" />
        <div className="flex flex-1 flex-col gap-2 px-[18px] pt-[17px] pb-7">
          <Skeleton className="h-5 w-3/4" />
          <Skeleton className="h-3 w-1/2" />
          <Skeleton className="mt-auto h-3 w-2/3" />
        </div>
      </div>
    </li>
  )
}

export interface MasonrySkeletonProps {
  /** Number of placeholder cards; the default fills a 1312px row plus slack. */
  count?: number
  /** Accessible label; the collection page announces `Loading posts`. */
  label?: string
}

export function MasonrySkeleton({
  count = 8,
  label = "Loading collections",
}: MasonrySkeletonProps) {
  return (
    <div role="status" aria-label={label}>
      <span className="sr-only">{label}…</span>
      <ul aria-hidden="true" className="flex flex-wrap gap-[18px]">
        {Array.from({ length: count }, (_, index) => (
          <CollectionCardSkeleton key={index} />
        ))}
      </ul>
    </div>
  )
}

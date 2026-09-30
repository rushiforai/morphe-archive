import type { GalleryCollection } from "@/types"

/**
 * Client-side ordering guard for the homepage grid (PRD-2 §38).
 *
 * Ordering is the backend's job (`last_saved_at DESC`) and the client must not
 * re-sort. The one case the contract explicitly allows is keeping collections
 * with **no valid timestamp after** collections that have data, so this is a
 * stable partition that preserves the received order inside each group and
 * returns the original array untouched when there is nothing to fix.
 */
export function orderCollections(
  collections: readonly GalleryCollection[]
): GalleryCollection[] {
  const hasUndated = collections.some(
    (collection) => collection.last_saved_at === null
  )
  if (!hasUndated) {
    return collections as GalleryCollection[]
  }

  const dated: GalleryCollection[] = []
  const undated: GalleryCollection[] = []

  for (const collection of collections) {
    if (collection.last_saved_at === null) {
      undated.push(collection)
    } else {
      dated.push(collection)
    }
  }

  return [...dated, ...undated]
}

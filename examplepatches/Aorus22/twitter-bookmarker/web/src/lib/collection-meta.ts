import type { GalleryCollection } from "@/types"

import { formatLastSaved, type DateFormatOptions } from "./date"

/**
 * The homepage card meta row (PRD-2 §16, design spec §3.2):
 *
 *   `83 posts · 126 media · Last saved Sep 27`
 *
 * The mockup omits the date and shows a description instead; the date is
 * required by the PRD and the description has no dedicated field, so the date
 * wins.
 */

/**
 * A count as it is displayed: a whole, non-negative number. Non-finite and
 * negative values degrade to `0` instead of printing `NaN` or `-3`, so a
 * malformed summary can never leak into the copy.
 */
export function normalizeCount(count: number): number {
  return Number.isFinite(count) ? Math.max(0, Math.trunc(count)) : 0
}

/** `1 post` / `83 posts` — never `1 posts`. */
export function formatCount(
  count: number,
  singular: string,
  plural: string = `${singular}s`
): string {
  const value = normalizeCount(count)
  return `${value} ${value === 1 ? singular : plural}`
}

/**
 * Sum of one count field across collections, clamped the same way the copy is:
 * the homepage totals must agree with the per-collection rows they are the sum
 * of, even when one summary is malformed.
 */
export function sumCounts<T>(
  items: readonly T[],
  select: (item: T) => number
): number {
  return items.reduce((total, item) => total + normalizeCount(select(item)), 0)
}

/** The subset of a collection the meta row needs. */
export type CollectionMetaSource = Pick<
  GalleryCollection,
  "post_count" | "media_count" | "last_saved_at"
>

export function formatCollectionMeta(
  collection: CollectionMetaSource,
  options: DateFormatOptions = {}
): string {
  return [
    formatCount(collection.post_count, "post"),
    // "media" is invariant in the product copy (`126 media`, not `medias`).
    formatCount(collection.media_count, "media", "media"),
    formatLastSaved(collection.last_saved_at, options),
  ].join(" · ")
}

/** The subset of a collection the header counts line needs. */
export type CollectionCountsSource = Pick<
  GalleryCollection,
  "post_count" | "media_count"
>

/**
 * The collection-page header meta (design spec §3.3, frame `6:121`):
 *
 *   `186 posts · 220 media`
 *
 * The mockup separated the two counts with a `◫` glyph, which was dropped: it is
 * a text character standing in for a media icon, and at UI sizes it renders as a
 * bare rectangle with a hairline through it — indistinguishable from a missing
 * glyph. The middle dot is what the homepage hero (`3 collections · 12 posts ·
 * 16 media`) and the post-card date row (`Saved Sep 27`) already use, so the
 * header now separates its counts the same way the rest of the app does.
 *
 * The design's third (description) line is omitted by spec §7, so the header
 * shows only counts. Reuses {@link formatCount} so `1 post` never becomes
 * `1 posts`.
 */
export function formatCollectionCounts(
  collection: CollectionCountsSource
): string {
  return [
    formatCount(collection.post_count, "post"),
    formatCount(collection.media_count, "media", "media"),
  ].join(" · ")
}

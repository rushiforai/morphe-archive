import type { GallerySort } from "@/types"

/**
 * The four sort modes of PRD-2 §33, in menu order, default first.
 *
 * `saved_desc` (Newest Bookmarked) is the required default and is what the
 * collection page sends on its first-page request. Phase 6 reuses this list for
 * its `SortSelect`; Phase 5 renders it as the toolbar's controlled select.
 */
export interface SortOption {
  value: GallerySort
  label: string
}

export const DEFAULT_SORT: GallerySort = "saved_desc"

export const SORT_OPTIONS: readonly SortOption[] = [
  { value: "saved_desc", label: "Newest Bookmarked" },
  { value: "saved_asc", label: "Oldest Bookmarked" },
  { value: "tweet_desc", label: "Newest Posted" },
  { value: "tweet_asc", label: "Oldest Posted" },
]

/** The human label for a sort value (falls back to the raw value). */
export function sortLabel(value: GallerySort): string {
  return SORT_OPTIONS.find((option) => option.value === value)?.label ?? value
}

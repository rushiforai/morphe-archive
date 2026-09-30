import { SearchX } from "lucide-react"

import { GalleryStateCard } from "@/components/gallery/gallery-state-card"
import { Button } from "@/components/ui/button"
import { CLEAR_FILTERS_LABEL, NO_FILTER_MATCH_TITLE } from "@/lib/messages"

/**
 * Filter-no-match state (PRD-2 §60, COLL-10).
 *
 * Zero results **because of the active filters** — deliberately distinct from
 * `CollectionEmptyState`'s postless-collection copy — with a real
 * `Clear filters` action.
 *
 * Phase 5 renders this state and its action; Phase 6 makes `Clear filters`
 * reset the server-side query (and the URL). Phase 5 therefore attaches it to
 * an applied-filters value that stays default, so the node is present and
 * tested without pretending any filtering already happens.
 */
export interface CollectionFilterEmptyStateProps {
  onClearFilters: () => void
}

export function CollectionFilterEmptyState({
  onClearFilters,
}: CollectionFilterEmptyStateProps) {
  return (
    <GalleryStateCard
      testId="collection-filter-empty-state"
      title={NO_FILTER_MATCH_TITLE}
      icon={SearchX}
      seed="collection-filter-empty"
    >
      <Button
        type="button"
        variant="secondary"
        onClick={onClearFilters}
        data-testid="clear-filters"
        className="rounded-sm"
      >
        {CLEAR_FILTERS_LABEL}
      </Button>
    </GalleryStateCard>
  )
}

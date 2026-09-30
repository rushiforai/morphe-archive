import { FolderOpen } from "lucide-react"

import { GalleryStateCard } from "@/components/gallery/gallery-state-card"
import {
  EMPTY_COLLECTION_MESSAGE,
  EMPTY_COLLECTION_TITLE,
} from "@/lib/messages"

/**
 * Empty-collection state (PRD-2 §60, design spec §3.6).
 *
 * A collection that exists and is valid but has no posts: title
 * `This collection is empty`, supporting line from spec §3.6. This is **not**
 * the filter-no-match state — see `CollectionFilterEmptyState`.
 */
export function CollectionEmptyState() {
  return (
    <GalleryStateCard
      testId="collection-empty-state"
      title={EMPTY_COLLECTION_TITLE}
      message={EMPTY_COLLECTION_MESSAGE}
      icon={FolderOpen}
      seed="collection-empty"
    />
  )
}

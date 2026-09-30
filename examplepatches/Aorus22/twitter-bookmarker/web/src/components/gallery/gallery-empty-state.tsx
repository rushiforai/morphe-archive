import { Images } from "lucide-react"

import { NO_COLLECTIONS_MESSAGE, NO_COLLECTIONS_TITLE } from "@/lib/messages"
import { pickPlaceholderGradient } from "@/lib/placeholder"

/**
 * Empty gallery state (PRD-2 §59, design spec §3.6).
 *
 * Exact PRD copy wins over the mockup's `Empty gallery` wording: title
 * `No collections yet`, secondary line `Saved tweets will appear here after you
 * organize them with the extension.` No error illustration is required, so the
 * state art is a neutral gradient tile with a glyph.
 */
export function GalleryEmptyState() {
  return (
    <section
      aria-labelledby="gallery-empty-heading"
      data-testid="gallery-empty-state"
      className="w-full max-w-[292px] rounded-xl border border-border bg-surface p-5 shadow-card"
    >
      <div
        aria-hidden="true"
        className="flex h-[110px] w-full items-center justify-center rounded-2xl"
        style={{
          backgroundImage: pickPlaceholderGradient("empty-gallery").value,
        }}
      >
        <Images className="size-7 text-white/80" />
      </div>
      <h2
        id="gallery-empty-heading"
        className="mt-5 font-display text-[20px] leading-[1.3] font-bold text-ink"
      >
        {NO_COLLECTIONS_TITLE}
      </h2>
      <p className="mt-2 text-[11px] leading-[1.45] text-muted">
        {NO_COLLECTIONS_MESSAGE}
      </p>
    </section>
  )
}

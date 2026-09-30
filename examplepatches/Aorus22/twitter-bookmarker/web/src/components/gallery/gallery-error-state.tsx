import { TriangleAlert } from "lucide-react"

import { Button } from "@/components/ui/button"
import { RETRY_LABEL } from "@/lib/messages"
import { pickPlaceholderGradient } from "@/lib/placeholder"

/**
 * Error state with a working retry action (PRD-2 §61, design spec §3.6).
 *
 * The caller supplies the message so the same component serves the homepage
 * (the PRD §61 `Could not connect to Twitter Bookmarker backend` copy for a
 * transport failure) and, in Phase 5, a collection load failure. The message is
 * rendered verbatim as the state heading — no paraphrase, no invented copy.
 */
export interface GalleryErrorStateProps {
  /** Exact PRD copy for the failure, e.g. the §61 connection message. */
  message: string
  onRetry: () => void
}

export function GalleryErrorState({
  message,
  onRetry,
}: GalleryErrorStateProps) {
  return (
    <section
      role="alert"
      aria-labelledby="gallery-error-heading"
      data-testid="gallery-error-state"
      className="w-full max-w-[292px] rounded-xl border border-border bg-surface p-5 shadow-card"
    >
      <div
        aria-hidden="true"
        className="flex h-[110px] w-full items-center justify-center rounded-2xl"
        style={{
          backgroundImage: pickPlaceholderGradient("gallery-error").value,
        }}
      >
        <TriangleAlert className="size-7 text-white/80" />
      </div>
      <h2
        id="gallery-error-heading"
        className="mt-5 font-display text-[20px] leading-[1.3] font-bold text-ink"
      >
        {message}
      </h2>
      <Button
        type="button"
        variant="secondary"
        onClick={onRetry}
        className="mt-4 rounded-sm"
      >
        {RETRY_LABEL}
      </Button>
    </section>
  )
}

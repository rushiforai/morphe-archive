import { LOADING_MORE_POSTS_LABEL } from "@/lib/messages"
import { cn } from "@/lib/utils"

/**
 * Small bottom loader for an appended page (PRD-2 §35, SCROLL-02).
 *
 * The infinite-load affordance is a single compact row below the existing cards
 * — never a full-page skeleton, because the already-loaded posts must stay on
 * screen during the fetch. It is a polite live region (`role="status"` has an
 * implicit `aria-live="polite"`) whose visible spinner is decorative and whose
 * label is visually hidden, so a screen-reader user learns more content is
 * loading without the spinner itself being announced.
 */

export interface GalleryBottomLoaderProps {
  /** Visually-hidden live-region label; defaults to `Loading more posts`. */
  label?: string
  className?: string
}

export function GalleryBottomLoader({
  label = LOADING_MORE_POSTS_LABEL,
  className,
}: GalleryBottomLoaderProps) {
  return (
    <div
      role="status"
      data-testid="gallery-bottom-loader"
      className={cn("flex w-full items-center justify-center py-6", className)}
    >
      <span className="sr-only">{label}…</span>
      <span
        aria-hidden="true"
        className="size-6 animate-spin rounded-full border-2 border-border border-t-accent"
      />
    </div>
  )
}

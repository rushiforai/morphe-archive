import { ClampedPostText } from "@/components/gallery/clamped-post-text"
import { pickPlaceholderGradient } from "@/lib/placeholder"
import { cn } from "@/lib/utils"

/**
 * Text-only tweet treatment (PRD-2 §22, design spec §3.3).
 *
 * A post with `media: []` gets the design's typographic **quote panel** in the
 * media slot — a `272×~210` `r14` deterministic gradient with Playfair Regular
 * 22 text at `18/24` padding — instead of an artificial grey image
 * placeholder. The panel is not fake media: it carries no image semantics, and
 * a test asserts a text-only card renders no `<img>` at all.
 *
 * A 50% ink scrim sits between the gradient and the white text so all six
 * placeholder pairs (including the light `sand→sage` and `gold→blue`) clear
 * WCAG AA for 22px text. Long text clamps here and expands in place via
 * {@link ClampedPostText}.
 */

export interface TextPostCardProps {
  text: string
  /** Stable key for the deterministic gradient (usually the tweet id). */
  seed: string
  className?: string
}

export function TextPostCard({ text, seed, className }: TextPostCardProps) {
  const gradient = pickPlaceholderGradient(seed)

  return (
    <div
      data-testid="text-post-card"
      style={{ backgroundImage: gradient.value }}
      className={cn(
        "relative flex min-h-[210px] w-full flex-col overflow-hidden rounded-md p-[18px] px-6",
        className
      )}
    >
      <span aria-hidden="true" className="absolute inset-0 bg-black/50" />
      <ClampedPostText text={text} variant="quote" className="relative" />
    </div>
  )
}

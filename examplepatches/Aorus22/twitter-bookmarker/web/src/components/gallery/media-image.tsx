import { ImageOff } from "lucide-react"
import { useState } from "react"

import { pickPlaceholderGradient } from "@/lib/placeholder"
import { cn } from "@/lib/utils"

/**
 * The one image primitive for the gallery (design spec §6, PRD-2 §62/§25).
 *
 * Native lazy loading and async decoding, and — crucially — an `onError`
 * fallback that swaps the image for a same-size deterministic gradient
 * placeholder. A broken `pbs.twimg.com` URL therefore never collapses a card or
 * leaves a broken-image icon behind. Phase 5 reuses this for post media.
 *
 * Tiles are decorative by contract (`alt=""` + `aria-hidden`): the surrounding
 * card/link carries the accessible name.
 */
export interface MediaImageProps {
  src: string
  /** Stable key for the deterministic placeholder (usually `slug:index`). */
  fallbackSeed: string
  alt?: string
  className?: string
  /** `eager` only for above-the-fold imagery; everything else stays lazy. */
  loading?: "lazy" | "eager"
}

export function MediaImage({
  src,
  fallbackSeed,
  alt = "",
  className,
  loading = "lazy",
}: MediaImageProps) {
  const [failed, setFailed] = useState(false)
  const hasSource = src.trim() !== ""

  if (failed || !hasSource) {
    const placeholder = pickPlaceholderGradient(fallbackSeed)

    return (
      <span
        data-testid="media-placeholder"
        aria-hidden="true"
        className={cn("flex items-center justify-center", className)}
        style={{ backgroundImage: placeholder.value }}
      >
        <ImageOff className="size-5 text-white/70" />
      </span>
    )
  }

  return (
    <img
      data-testid="media-image"
      src={src}
      alt={alt}
      loading={loading}
      decoding="async"
      aria-hidden={alt === "" ? true : undefined}
      onError={() => {
        setFailed(true)
      }}
      className={cn("object-cover", className)}
    />
  )
}

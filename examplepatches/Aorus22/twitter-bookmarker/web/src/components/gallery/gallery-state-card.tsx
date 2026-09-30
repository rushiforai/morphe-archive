import type { LucideIcon } from "lucide-react"
import type { ReactNode } from "react"

import { pickPlaceholderGradient } from "@/lib/placeholder"
import { cn } from "@/lib/utils"

/**
 * The design spec §3.6 product-state card: `292×320`, `r20`, `surface`,
 * `border`, `padding 20`, with a `252×110` `r16` gradient "state art" tile and
 * a Playfair Bold 20 title over an Inter Regular 11 muted message.
 *
 * Shared by the collection page's empty and filter-no-match states so the two
 * stay visually identical while keeping their **distinct** copy and actions.
 */
export interface GalleryStateCardProps {
  /** Playfair Bold 20 title; PRD copy when the PRD prescribes one. */
  title: string
  /** Optional Inter 11 muted supporting line. */
  message?: string
  icon: LucideIcon
  /** Stable key for the deterministic gradient art. */
  seed: string
  /** Optional action row (a real control, never decorative). */
  children?: ReactNode
  testId: string
}

export function GalleryStateCard({
  title,
  message,
  icon: Icon,
  seed,
  children,
  testId,
}: GalleryStateCardProps) {
  return (
    <section
      data-testid={testId}
      className="w-full max-w-[292px] rounded-xl border border-border bg-surface p-5 shadow-card"
    >
      <div
        aria-hidden="true"
        className="flex h-[110px] w-full items-center justify-center rounded-2xl"
        style={{ backgroundImage: pickPlaceholderGradient(seed).value }}
      >
        <Icon className="size-7 text-white/80" />
      </div>
      <h2 className="mt-5 font-display text-[20px] leading-[1.3] font-bold text-ink">
        {title}
      </h2>
      {message === undefined ? null : (
        <p className={cn("mt-2 text-[11px] leading-[1.45] text-muted")}>
          {message}
        </p>
      )}
      {children === undefined || children === null ? null : (
        <div className="mt-4">{children}</div>
      )}
    </section>
  )
}

import type { ReactNode } from "react"

import { DateRangeFilter } from "@/components/gallery/date-range-filter"
import {
  QUICK_RANGE_PRESETS,
  activePresetFor,
  applyPresetToDates,
} from "@/lib/filter-presets"
import type { GalleryFilterDates } from "@/lib/gallery-query"
import {
  BOOKMARKED_DATE_FROM_LABEL,
  BOOKMARKED_DATE_LABEL,
  BOOKMARKED_DATE_TO_LABEL,
  FILTER_APPLY_LABEL,
  FILTER_RESET_LABEL,
  FILTER_SUBTITLE,
  FILTER_TITLE,
  QUICK_RANGES_LABEL,
  TWEET_DATE_FROM_LABEL,
  TWEET_DATE_LABEL,
  TWEET_DATE_TO_LABEL,
} from "@/lib/messages"
import { cn } from "@/lib/utils"

/**
 * The filter panel contents (design spec §3.4, frame `6:236`).
 *
 * Shared verbatim by the desktop Popover and the narrow-viewport Sheet so the
 * two surfaces cannot drift. It is presentational and **controlled**: the
 * surface owner holds the draft, seeds it when the surface opens and discards it
 * on close without `Apply`, so committed state can never be corrupted by a
 * half-edited panel.
 *
 * Measurements: `390` wide, `r20`, `surface`, padding `22`; title Playfair Bold
 * `24`; subtitle Inter `11` muted; section labels Inter SemiBold `11`; pills
 * `32` tall `r-pill` (inactive `surface-warm`+border Medium `11` muted, active
 * gradient + SemiBold `11` accent); `Reset` `78×40 r12`; `Apply` `92×40 r12`
 * gradient with white SemiBold `11`, right-aligned.
 */

export interface FilterPanelProps {
  dates: GalleryFilterDates
  onChange: (dates: GalleryFilterDates) => void
  onReset: () => void
  onApply: () => void
  /** Reference "today" for preset resolution; injectable for deterministic tests. */
  now?: Date
  /** Overrides the visible title (the Sheet supplies its own `DialogTitle`). */
  title?: ReactNode
  /** Overrides the visible subtitle (the Sheet supplies its own description). */
  subtitle?: ReactNode
  className?: string
}

const PILL_BASE =
  "h-8 rounded-pill px-3 text-[11px] leading-[1.4] outline-none transition-colors focus-visible:ring-3 focus-visible:ring-ring/50"

export function FilterPanel({
  dates,
  onChange,
  onReset,
  onApply,
  now,
  title,
  subtitle,
  className,
}: FilterPanelProps) {
  const activePreset = activePresetFor(dates, now)

  return (
    <div
      data-testid="filter-panel"
      className={cn(
        "flex w-[390px] max-w-full flex-col rounded-xl border border-border bg-surface p-[22px] shadow-popover",
        className
      )}
    >
      <header className="flex flex-col">
        {title ?? (
          <h2 className="font-display text-[24px] leading-[1.15] font-bold text-ink">
            {FILTER_TITLE}
          </h2>
        )}
        {subtitle ?? (
          <p className="mt-1 text-[11px] leading-[1.4] font-normal text-muted">
            {FILTER_SUBTITLE}
          </p>
        )}
      </header>

      <div className="mt-5 flex flex-col gap-4">
        <DateRangeFilter
          id="tweet"
          label={TWEET_DATE_LABEL}
          from={dates.tweetFrom}
          to={dates.tweetTo}
          fromLabel={TWEET_DATE_FROM_LABEL}
          toLabel={TWEET_DATE_TO_LABEL}
          onFromChange={(value) => {
            onChange({ ...dates, tweetFrom: value === "" ? undefined : value })
          }}
          onToChange={(value) => {
            onChange({ ...dates, tweetTo: value === "" ? undefined : value })
          }}
        />

        <DateRangeFilter
          id="saved"
          label={BOOKMARKED_DATE_LABEL}
          from={dates.savedFrom}
          to={dates.savedTo}
          fromLabel={BOOKMARKED_DATE_FROM_LABEL}
          toLabel={BOOKMARKED_DATE_TO_LABEL}
          onFromChange={(value) => {
            onChange({ ...dates, savedFrom: value === "" ? undefined : value })
          }}
          onToChange={(value) => {
            onChange({ ...dates, savedTo: value === "" ? undefined : value })
          }}
        />

        <section aria-labelledby="quick-ranges-label" className="flex flex-col">
          <h3
            id="quick-ranges-label"
            className="text-[11px] leading-[1.4] font-semibold text-ink"
          >
            {QUICK_RANGES_LABEL}
          </h3>
          <div className="mt-2 flex flex-wrap gap-2">
            {QUICK_RANGE_PRESETS.map((preset) => {
              const isActive = activePreset === preset.id
              return (
                <button
                  key={preset.id}
                  type="button"
                  data-testid={`quick-range-${preset.id}`}
                  aria-label={preset.label}
                  aria-pressed={isActive}
                  onClick={() => {
                    onChange(applyPresetToDates(dates, preset.id, now))
                  }}
                  className={cn(
                    PILL_BASE,
                    isActive
                      ? "bg-grad-brand font-semibold text-accent"
                      : "border border-border bg-surface-warm font-medium text-muted"
                  )}
                >
                  {preset.shortLabel}
                </button>
              )
            })}
          </div>
        </section>
      </div>

      <div className="mt-6 flex items-center justify-end gap-3">
        <button
          type="button"
          data-testid="filter-reset"
          onClick={onReset}
          className="h-10 w-[78px] shrink-0 rounded-sm border border-border bg-surface-warm text-[11px] leading-[1.4] font-medium text-ink transition-colors outline-none hover:bg-surface focus-visible:ring-3 focus-visible:ring-ring/50"
        >
          {FILTER_RESET_LABEL}
        </button>
        <button
          type="button"
          data-testid="filter-apply"
          onClick={onApply}
          className="h-10 w-[92px] shrink-0 rounded-sm bg-grad-brand text-[11px] leading-[1.4] font-semibold text-white transition-colors outline-none focus-visible:ring-3 focus-visible:ring-ring/50"
        >
          {FILTER_APPLY_LABEL}
        </button>
      </div>
    </div>
  )
}

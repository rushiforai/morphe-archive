import { formatLocalDateRange, isInvertedRange } from "@/lib/date-bounds"
import {
  DATE_RANGE_FROM_LABEL,
  DATE_RANGE_TO_LABEL,
  INVERTED_RANGE_MESSAGE,
} from "@/lib/messages"
import { cn } from "@/lib/utils"

/**
 * One manually-editable date range in the filter panel (PRD-2 §30, design spec
 * §3.4, DISC-02).
 *
 * The mockup draws a single display-only field showing a formatted range
 * (`Jan 1, 2026 → Sep 27, 2026`). The design's fields must also be manually
 * editable, so this renders a **native `<input type="date">` pair** (no new
 * dependency, keyboard- and screen-reader-native) inside the same
 * `346×42 r12 surface-warm`+border field and keeps the formatted range summary
 * directly beneath it. Each of the two inputs carries an explicit accessible
 * label, and an inverted range is flagged inline instead of silently sending a
 * query the backend would answer with nothing.
 */

export interface DateRangeFilterProps {
  /** Stable id prefix for the labels/inputs (`tweet`, `saved`). */
  id: string
  /** Section label, e.g. `Tweet date` (design spec §3.4). */
  label: string
  from?: string
  to?: string
  onFromChange: (value: string) => void
  onToChange: (value: string) => void
  /** Explicit accessible name for the `from` input. */
  fromLabel: string
  /** Explicit accessible name for the `to` input. */
  toLabel: string
  className?: string
}

const DATE_INPUT_CLASS =
  "h-9 min-w-0 flex-1 rounded-sm bg-transparent px-1 text-[11px] leading-[1.4] font-medium text-ink outline-none focus-visible:ring-3 focus-visible:ring-ring/50"

export function DateRangeFilter({
  id,
  label,
  from,
  to,
  onFromChange,
  onToChange,
  fromLabel,
  toLabel,
  className,
}: DateRangeFilterProps) {
  const inverted = isInvertedRange(from, to)
  const summary = formatLocalDateRange({ from, to })
  const labelId = `${id}-date-range-label`
  const summaryId = `${id}-date-range-summary`

  return (
    <section
      data-testid={`date-range-${id}`}
      aria-labelledby={labelId}
      className={cn("flex flex-col", className)}
    >
      <h3
        id={labelId}
        className="text-[11px] leading-[1.4] font-semibold text-ink"
      >
        {label}
      </h3>

      <div className="mt-2 flex h-[42px] w-full max-w-[346px] items-center gap-1 rounded-sm border border-border bg-surface-warm px-2">
        <label className="sr-only" htmlFor={`${id}-date-from`}>
          {DATE_RANGE_FROM_LABEL}
        </label>
        <input
          id={`${id}-date-from`}
          data-testid={`date-range-${id}-from`}
          type="date"
          value={from ?? ""}
          aria-label={fromLabel}
          aria-invalid={inverted}
          aria-describedby={summaryId}
          onChange={(event) => {
            onFromChange(event.target.value)
          }}
          className={DATE_INPUT_CLASS}
        />

        <span aria-hidden="true" className="shrink-0 text-[11px] text-muted">
          →
        </span>

        <label className="sr-only" htmlFor={`${id}-date-to`}>
          {DATE_RANGE_TO_LABEL}
        </label>
        <input
          id={`${id}-date-to`}
          data-testid={`date-range-${id}-to`}
          type="date"
          value={to ?? ""}
          aria-label={toLabel}
          aria-invalid={inverted}
          aria-describedby={summaryId}
          onChange={(event) => {
            onToChange(event.target.value)
          }}
          className={DATE_INPUT_CLASS}
        />
      </div>

      <p
        id={summaryId}
        data-testid={`date-range-${id}-summary`}
        className="mt-1.5 text-[11px] leading-[1.4] text-muted"
      >
        {summary}
      </p>

      {inverted ? (
        <p
          role="alert"
          data-testid={`date-range-${id}-error`}
          className="mt-1 text-[11px] leading-[1.4] font-medium text-accent"
        >
          {INVERTED_RANGE_MESSAGE}
        </p>
      ) : null}
    </section>
  )
}

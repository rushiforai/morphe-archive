/**
 * Date formatting helpers.
 *
 * Storage is UTC/RFC3339; the UI always renders in the browser's local
 * timezone (PRD-2 §32). Phases 5–8 reuse these helpers, so they live in
 * `src/lib/` from the start rather than inside the homepage components.
 */

/** Neutral string for a collection that has never been saved to (spec §5). */
export const NO_SAVES_YET = "No saves yet"

export interface DateFormatOptions {
  /** Reference "today", used only to decide whether to append the year. */
  now?: Date
  /** BCP-47 locale; defaults to the runtime locale. */
  locale?: string
}

const MONTH_DAY: Intl.DateTimeFormatOptions = {
  month: "short",
  day: "numeric",
}

function toLocalDate(value: string | Date | null | undefined): Date | null {
  if (value === null || value === undefined || value === "") {
    return null
  }

  const date = value instanceof Date ? value : new Date(value)
  return Number.isNaN(date.getTime()) ? null : date
}

/**
 * `Sep 27` — or `Sep 27, 2025` when the local year differs from `now`'s year,
 * so an old save is never ambiguous. Returns `""` for a missing/invalid value.
 */
export function formatLocalDate(
  value: string | Date | null | undefined,
  options: DateFormatOptions = {}
): string {
  const date = toLocalDate(value)
  if (date === null) {
    return ""
  }

  const now = options.now ?? new Date()
  const withYear = date.getFullYear() !== now.getFullYear()

  return new Intl.DateTimeFormat(
    options.locale,
    withYear ? { ...MONTH_DAY, year: "numeric" } : MONTH_DAY
  ).format(date)
}

/**
 * `Mar 12, 2026` — local date with the year always present.
 *
 * The post-card meta row (design spec §3.3) shows the tweet date with its year
 * (`Mar 12, 2026`) while the bookmark date stays compact (`Saved Apr 3`), so
 * this sibling of {@link formatLocalDate} forces the year instead of inferring
 * it. Returns `""` for a missing/invalid value.
 */
export function formatLocalFullDate(
  value: string | Date | null | undefined,
  options: DateFormatOptions = {}
): string {
  const date = toLocalDate(value)
  if (date === null) {
    return ""
  }

  return new Intl.DateTimeFormat(options.locale, {
    ...MONTH_DAY,
    year: "numeric",
  }).format(date)
}

/** `Sep 27, 2025, 2:31 PM` — local date + time, for Phases 5–8 metadata rows. */
export function formatLocalDateTime(
  value: string | Date | null | undefined,
  options: DateFormatOptions = {}
): string {
  const date = toLocalDate(value)
  if (date === null) {
    return ""
  }

  return new Intl.DateTimeFormat(options.locale, {
    ...MONTH_DAY,
    year: "numeric",
    hour: "numeric",
    minute: "2-digit",
  }).format(date)
}

/**
 * `Last saved Sep 27` for the homepage card meta row (PRD-2 §16, design spec
 * §3.2). A `null` or invalid `last_saved_at` renders `No saves yet` instead of
 * `Invalid Date`.
 */
export function formatLastSaved(
  value: string | Date | null | undefined,
  options: DateFormatOptions = {}
): string {
  const formatted = formatLocalDate(value, options)
  return formatted === "" ? NO_SAVES_YET : `Last saved ${formatted}`
}

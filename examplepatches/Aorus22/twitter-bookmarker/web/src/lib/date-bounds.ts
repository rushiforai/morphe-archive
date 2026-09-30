import { formatLocalFullDate } from "@/lib/date"
import { ANY_DATE_LABEL } from "@/lib/messages"

/**
 * Local calendar date ⇄ RFC3339 UTC boundary conversion (PRD-2 §32, DISC-05).
 *
 * Storage is UTC/RFC3339, but the user picks **local** calendar dates. The
 * backend makes no timezone assumption, so the frontend owns the conversion:
 *
 *   `from` `2026-09-27` → local `2026-09-27T00:00:00.000` → RFC3339 UTC instant
 *   `to`   `2026-09-27` → local `2026-09-27T23:59:59.999` → RFC3339 UTC instant
 *
 * The `to` boundary is the **last millisecond of the local day**, so the
 * backend's inclusive `<=` comparison covers the whole final day. This module
 * is pure and unit-tested, including a DST transition day, because getting it
 * wrong silently drops or duplicates a day of results.
 *
 * `new Date("YYYY-MM-DD")` is deliberately never used: it parses as UTC
 * midnight, which would render as the previous day in any negative-offset zone.
 * Every `Date` here is built from local components instead.
 */

/** Strict ISO calendar-date shape. */
export const LOCAL_DATE_PATTERN = /^\d{4}-\d{2}-\d{2}$/

export interface LocalDateRange {
  from?: string
  to?: string
}

export interface UtcDateBounds {
  /** RFC3339 UTC instant at local 00:00:00.000, or omitted when cleared. */
  from?: string
  /** RFC3339 UTC instant at local 23:59:59.999, or omitted when cleared. */
  to?: string
  /** True when `from` fell after `to`; no bounds are emitted in that case. */
  inverted: boolean
}

interface LocalDateParts {
  year: number
  month: number
  day: number
}

/**
 * Parse `YYYY-MM-DD` into local calendar components, rejecting both the wrong
 * shape and impossible dates (`2026-02-31` must not silently become March 3).
 */
export function parseLocalDateParts(value: unknown): LocalDateParts | null {
  if (typeof value !== "string") {
    return null
  }

  const trimmed = value.trim()
  if (!LOCAL_DATE_PATTERN.test(trimmed)) {
    return null
  }

  const [year, month, day] = trimmed.split("-").map(Number)
  const probe = new Date(year, month - 1, day)
  if (
    probe.getFullYear() !== year ||
    probe.getMonth() !== month - 1 ||
    probe.getDate() !== day
  ) {
    return null
  }

  return { year, month, day }
}

/** True when `value` is a real local calendar date in `YYYY-MM-DD` form. */
export function isLocalDate(value: unknown): value is string {
  return parseLocalDateParts(value) !== null
}

/** The local `Date` at 00:00:00.000 of `value`, or `null` when malformed. */
export function parseLocalDate(value: unknown): Date | null {
  const parts = parseLocalDateParts(value)
  if (parts === null) {
    return null
  }
  return new Date(parts.year, parts.month - 1, parts.day, 0, 0, 0, 0)
}

/** Local start-of-day → RFC3339 UTC, or `undefined` when the field is empty. */
export function toUtcFrom(value: string | undefined): string | undefined {
  const date = parseLocalDate(value)
  return date === null ? undefined : date.toISOString()
}

/** Local end-of-day (23:59:59.999) → RFC3339 UTC, or `undefined` when empty. */
export function toUtcTo(value: string | undefined): string | undefined {
  const parts = parseLocalDateParts(value)
  if (parts === null) {
    return undefined
  }
  return new Date(
    parts.year,
    parts.month - 1,
    parts.day,
    23,
    59,
    59,
    999
  ).toISOString()
}

/** True when both bounds are present and `from` falls after `to`. */
export function isInvertedRange(from?: string, to?: string): boolean {
  return isLocalDate(from) && isLocalDate(to) && from > to
}

/**
 * Convert one local range into RFC3339 UTC bounds.
 *
 * Malformed or cleared fields are omitted. An **inverted** range (`from` > `to`)
 * emits no bounds and reports `inverted: true`: the panel keeps the user's text
 * and flags it, but the request never carries a range the backend would answer
 * with an empty set for a clearly-erroneous input.
 */
export function localDateToUtcBounds(range: LocalDateRange): UtcDateBounds {
  const from = isLocalDate(range.from) ? range.from : undefined
  const to = isLocalDate(range.to) ? range.to : undefined

  if (isInvertedRange(from, to)) {
    return { inverted: true }
  }

  return {
    from: toUtcFrom(from),
    to: toUtcTo(to),
    inverted: false,
  }
}

/**
 * `Jan 1, 2026 → Sep 27, 2026` — the design spec §3.4 field summary.
 *
 * One-sided ranges read `From …` / `Until …`; an empty range reads `Any date`.
 */
export function formatLocalDateRange(
  range: LocalDateRange,
  options: { locale?: string } = {}
): string {
  const from = isLocalDate(range.from)
    ? formatLocalFullDate(parseLocalDate(range.from) as Date, options)
    : ""
  const to = isLocalDate(range.to)
    ? formatLocalFullDate(parseLocalDate(range.to) as Date, options)
    : ""

  if (from !== "" && to !== "") {
    return `${from} → ${to}`
  }
  if (from !== "") {
    return `From ${from}`
  }
  if (to !== "") {
    return `Until ${to}`
  }
  return ANY_DATE_LABEL
}

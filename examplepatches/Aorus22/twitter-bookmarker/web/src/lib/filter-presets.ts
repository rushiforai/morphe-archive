import { isLocalDate } from "@/lib/date-bounds"
import type { GalleryFilterDates } from "@/lib/gallery-query"

/**
 * Quick date presets (PRD-2 §31, design spec §3.4, DISC-03).
 *
 * Every preset targets the **Bookmarked date** range because the gallery
 * primarily represents when bookmarks were collected. A preset only *seeds*
 * the panel draft: both ranges stay ordinary editable fields afterwards, and
 * the active pill is derived by exact comparison rather than remembered, so a
 * preset is a starting point and never a lock.
 */

export type QuickRangeId =
  "today" | "last-7-days" | "last-30-days" | "this-year"

export interface QuickRangePreset {
  id: QuickRangeId
  /** PRD-2 §31 wording — the accessible name. */
  label: string
  /** Design spec §3.4 short display label. */
  shortLabel: string
}

export const QUICK_RANGE_PRESETS: readonly QuickRangePreset[] = [
  { id: "today", label: "Today", shortLabel: "Today" },
  { id: "last-7-days", label: "Last 7 Days", shortLabel: "7 days" },
  { id: "last-30-days", label: "Last 30 Days", shortLabel: "30 days" },
  { id: "this-year", label: "This Year", shortLabel: "This year" },
]

/** A local calendar date's `YYYY-MM-DD` value (never an ISO/UTC instant). */
export function toLocalDateValue(date: Date): string {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, "0")
  const day = String(date.getDate()).padStart(2, "0")
  return `${year}-${month}-${day}`
}

/** The calendar day `days` days away from `date`, DST-safe (components only). */
function addLocalDays(date: Date, days: number): Date {
  const next = new Date(date.getFullYear(), date.getMonth(), date.getDate())
  next.setDate(next.getDate() + days)
  return next
}

/**
 * Resolve a preset to inclusive local dates ending **today**:
 *
 *   Today         today .. today
 *   Last 7 Days   today-6 .. today
 *   Last 30 Days  today-29 .. today
 *   This Year     Jan 1 of the local year .. today
 *
 * The end-of-day UTC conversion (`toUtcTo`) covers the remaining hours of
 * today, so "ending today" includes everything saved today.
 */
export function resolvePresetRange(
  id: QuickRangeId,
  now: Date = new Date()
): { from: string; to: string } {
  const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
  const to = toLocalDateValue(today)

  if (id === "today") {
    return { from: to, to }
  }
  if (id === "last-7-days") {
    return { from: toLocalDateValue(addLocalDays(today, -6)), to }
  }
  if (id === "last-30-days") {
    return { from: toLocalDateValue(addLocalDays(today, -29)), to }
  }
  return { from: `${today.getFullYear()}-01-01`, to }
}

/** The preset whose exact range matches `dates`, or `null` for a custom range. */
export function activePresetFor(
  dates: GalleryFilterDates,
  now: Date = new Date()
): QuickRangeId | null {
  if (!isLocalDate(dates.savedFrom) || !isLocalDate(dates.savedTo)) {
    return null
  }

  for (const preset of QUICK_RANGE_PRESETS) {
    const range = resolvePresetRange(preset.id, now)
    if (range.from === dates.savedFrom && range.to === dates.savedTo) {
      return preset.id
    }
  }

  return null
}

/** Seed the Bookmarked-date range from a preset, leaving every other field. */
export function applyPresetToDates(
  dates: GalleryFilterDates,
  id: QuickRangeId,
  now: Date = new Date()
): GalleryFilterDates {
  if (activePresetFor(dates, now) === id) {
    // Clicking the active pill clears the bookmarked range (a documented
    // toggle); the tweet range is untouched.
    return { ...dates, savedFrom: undefined, savedTo: undefined }
  }

  const range = resolvePresetRange(id, now)
  return { ...dates, savedFrom: range.from, savedTo: range.to }
}

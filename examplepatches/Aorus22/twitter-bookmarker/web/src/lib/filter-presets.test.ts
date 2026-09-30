import { describe, expect, it } from "vitest"

import {
  QUICK_RANGE_PRESETS,
  activePresetFor,
  applyPresetToDates,
  resolvePresetRange,
  toLocalDateValue,
} from "./filter-presets"

/**
 * DISC-03 / PRD-2 §31 — quick presets target the Bookmarked date range, leave
 * the Tweet range alone, and stay manually overridable (the active pill is
 * derived by exact comparison, never remembered as a lock).
 */

/** A fixed local reference instant: Sep 27, 2026 (a Sunday). */
const NOW = new Date(2026, 8, 27, 15, 30, 0)

describe("filter-presets — definitions", () => {
  it("holds exactly the four PRD-2 §31 presets with the spec's short labels", () => {
    expect(QUICK_RANGE_PRESETS.map((preset) => preset.label)).toEqual([
      "Today",
      "Last 7 Days",
      "Last 30 Days",
      "This Year",
    ])
    expect(QUICK_RANGE_PRESETS.map((preset) => preset.shortLabel)).toEqual([
      "Today",
      "7 days",
      "30 days",
      "This year",
    ])
  })
})

describe("filter-presets — resolved ranges", () => {
  it("resolves each preset to inclusive local dates ending today", () => {
    expect(resolvePresetRange("today", NOW)).toEqual({
      from: "2026-09-27",
      to: "2026-09-27",
    })
    expect(resolvePresetRange("last-7-days", NOW)).toEqual({
      from: "2026-09-21",
      to: "2026-09-27",
    })
    expect(resolvePresetRange("last-30-days", NOW)).toEqual({
      from: "2026-08-29",
      to: "2026-09-27",
    })
    expect(resolvePresetRange("this-year", NOW)).toEqual({
      from: "2026-01-01",
      to: "2026-09-27",
    })
  })

  it("formats local date values zero-padded", () => {
    expect(toLocalDateValue(new Date(2026, 0, 5))).toBe("2026-01-05")
    expect(toLocalDateValue(new Date(2026, 11, 31))).toBe("2026-12-31")
  })

  it("derives the active preset by exact comparison, else null", () => {
    expect(
      activePresetFor({ savedFrom: "2026-09-27", savedTo: "2026-09-27" }, NOW)
    ).toBe("today")
    expect(
      activePresetFor({ savedFrom: "2026-09-21", savedTo: "2026-09-27" }, NOW)
    ).toBe("last-7-days")
    expect(
      activePresetFor({ savedFrom: "2026-09-26", savedTo: "2026-09-27" }, NOW)
    ).toBeNull()
    expect(activePresetFor({ savedFrom: "2026-09-27" }, NOW)).toBeNull()
    expect(activePresetFor({}, NOW)).toBeNull()
  })
})

describe("filter-presets — applied to the draft (DISC-03)", () => {
  it("seeds the Bookmarked range and leaves the Tweet range untouched", () => {
    const applied = applyPresetToDates(
      { tweetFrom: "2026-01-01", tweetTo: "2026-09-01" },
      "last-7-days",
      NOW
    )

    expect(applied.savedFrom).toBe("2026-09-21")
    expect(applied.savedTo).toBe("2026-09-27")
    expect(applied.tweetFrom).toBe("2026-01-01")
    expect(applied.tweetTo).toBe("2026-09-01")
  })

  it("stays manually overridable: editing a field clears the active preset", () => {
    const applied = applyPresetToDates({}, "last-30-days", NOW)
    expect(activePresetFor(applied, NOW)).toBe("last-30-days")

    const edited = { ...applied, savedFrom: "2026-09-01" }
    expect(activePresetFor(edited, NOW)).toBeNull()
    expect(edited.savedFrom).toBe("2026-09-01")
  })

  it("toggles an already-active preset off without touching the Tweet range", () => {
    const applied = applyPresetToDates(
      { tweetFrom: "2026-01-01" },
      "today",
      NOW
    )
    expect(applied.savedFrom).toBe("2026-09-27")

    const cleared = applyPresetToDates(applied, "today", NOW)
    expect(cleared.savedFrom).toBeUndefined()
    expect(cleared.savedTo).toBeUndefined()
    expect(cleared.tweetFrom).toBe("2026-01-01")
  })
})

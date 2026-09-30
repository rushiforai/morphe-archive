import { describe, expect, it } from "vitest"

import {
  formatLastSaved,
  formatLocalDate,
  formatLocalDateTime,
  formatLocalFullDate,
  NO_SAVES_YET,
} from "./date"

/**
 * All fixtures are built from local date components (noon, to stay clear of any
 * DST/offset edge), so these assertions hold in every timezone — the helpers
 * deliberately render in the browser's local zone (PRD-2 §32).
 */
const NOW = new Date(2026, 8, 28, 12, 0, 0)

describe("formatLastSaved", () => {
  it("renders the PRD-2 §16 meta string with the local month and day", () => {
    const savedAt = new Date(2026, 8, 27, 12, 0, 0).toISOString()

    expect(formatLastSaved(savedAt, { now: NOW, locale: "en-US" })).toBe(
      "Last saved Sep 27"
    )
  })

  it("adds the year when the save is not from the current year", () => {
    const savedAt = new Date(2025, 8, 27, 12, 0, 0).toISOString()

    expect(formatLastSaved(savedAt, { now: NOW, locale: "en-US" })).toBe(
      "Last saved Sep 27, 2025"
    )
  })

  it("renders the neutral string for a null timestamp (spec §5)", () => {
    expect(formatLastSaved(null, { now: NOW })).toBe(NO_SAVES_YET)
    expect(formatLastSaved(undefined, { now: NOW })).toBe(NO_SAVES_YET)
  })

  it("never renders Invalid Date for an unparseable timestamp", () => {
    expect(formatLastSaved("not-a-date", { now: NOW })).toBe(NO_SAVES_YET)
  })
})

describe("formatLocalDate", () => {
  it("returns an empty string for a missing value", () => {
    expect(formatLocalDate(null)).toBe("")
    expect(formatLocalDate("")).toBe("")
  })

  it("accepts a Date as well as an RFC3339 string", () => {
    const asString = formatLocalDate(
      new Date(2026, 8, 27, 12, 0, 0).toISOString(),
      { now: NOW, locale: "en-US" }
    )
    const asDate = formatLocalDate(new Date(2026, 8, 27, 12, 0, 0), {
      now: NOW,
      locale: "en-US",
    })

    expect(asString).toBe("Sep 27")
    expect(asDate).toBe("Sep 27")
  })
})

describe("formatLocalDateTime", () => {
  it("includes the local year, hour and minute for later phases", () => {
    const formatted = formatLocalDateTime(new Date(2026, 8, 27, 14, 31, 0), {
      locale: "en-US",
    })

    expect(formatted).toContain("Sep 27, 2026")
    expect(formatted).toContain("2:31")
  })

  it("returns an empty string for an invalid value", () => {
    expect(formatLocalDateTime("nope")).toBe("")
  })
})

describe("formatLocalFullDate", () => {
  it("always includes the year, even for the current year (design spec §3.3)", () => {
    expect(
      formatLocalFullDate(new Date(2026, 2, 12, 12, 0, 0), { locale: "en-US" })
    ).toBe("Mar 12, 2026")
  })

  it("returns an empty string for a missing or invalid value", () => {
    expect(formatLocalFullDate(null)).toBe("")
    expect(formatLocalFullDate("not-a-date")).toBe("")
  })
})

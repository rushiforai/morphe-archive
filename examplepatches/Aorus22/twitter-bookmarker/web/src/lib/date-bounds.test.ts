import { describe, expect, it, vi } from "vitest"

import {
  formatLocalDateRange,
  isInvertedRange,
  isLocalDate,
  localDateToUtcBounds,
  parseLocalDateParts,
  toUtcFrom,
  toUtcTo,
} from "./date-bounds"

/**
 * DISC-05 / PRD-2 §32 — exact local-date → RFC3339 UTC boundary conversion.
 *
 * These tests must pass in **any** machine zone: the zone-independent
 * expectations are constructed from the runtime's own local zone, and the DST
 * cases deliberately switch `process.env.TZ` (Node re-reads it at runtime) and
 * restore the original value afterwards.
 */

const RFC3339_UTC = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$/

/**
 * Runs `run` with `TZ` set to `timeZone`. Node re-reads `TZ` at runtime, so the
 * change takes effect for `new Date(...)` immediately; `vi.stubEnv` (rather than
 * a bare `process.env` write) keeps this file free of Node globals, which the
 * app tsconfig does not include.
 */
function withTimeZone<T>(timeZone: string, run: () => T): T {
  vi.stubEnv("TZ", timeZone)
  try {
    return run()
  } finally {
    vi.unstubAllEnvs()
  }
}

describe("date-bounds — parsing", () => {
  it("accepts real calendar dates and rejects malformed or impossible ones", () => {
    expect(isLocalDate("2026-02-28")).toBe(true)
    expect(isLocalDate("2024-02-29")).toBe(true)
    expect(parseLocalDateParts("2026-02-28")).toEqual({
      year: 2026,
      month: 2,
      day: 28,
    })

    expect(isLocalDate("2026-2-1")).toBe(false)
    expect(isLocalDate("2026-02-31")).toBe(false)
    expect(isLocalDate("2023-02-29")).toBe(false)
    expect(isLocalDate("not-a-date")).toBe(false)
    expect(isLocalDate("")).toBe(false)
    expect(isLocalDate(null)).toBe(false)
    expect(isLocalDate(undefined)).toBe(false)
  })
})

describe("date-bounds — inclusive boundaries (DISC-05)", () => {
  it("maps from to local 00:00:00.000 and to to local 23:59:59.999", () => {
    // Expectations are built in the runtime's local zone, so this passes in any
    // zone without assuming one.
    const expectedFrom = new Date(2026, 0, 1, 0, 0, 0, 0).toISOString()
    const expectedTo = new Date(2026, 0, 1, 23, 59, 59, 999).toISOString()

    expect(toUtcFrom("2026-01-01")).toBe(expectedFrom)
    expect(toUtcTo("2026-01-01")).toBe(expectedTo)
  })

  it("keeps a single-day range inclusive of the whole final day", () => {
    const bounds = localDateToUtcBounds({
      from: "2026-09-27",
      to: "2026-09-27",
    })

    expect(bounds.inverted).toBe(false)
    expect(bounds.from).toBe(toUtcFrom("2026-09-27"))
    expect(bounds.to).toBe(toUtcTo("2026-09-27"))

    // The end is the last millisecond of the local day, so the backend's
    // inclusive `<=` covers it (and it is never the next day's start).
    expect(bounds.to).toMatch(/T\d{2}:\d{2}:\d{2}\.999Z$/)
    expect(bounds.to).not.toBe(toUtcFrom("2026-09-28"))

    const span =
      Date.parse(bounds.to as string) - Date.parse(bounds.from as string)
    expect(span).toBeGreaterThanOrEqual(23 * 60 * 60 * 1000)
    expect(span).toBeLessThan(25 * 60 * 60 * 1000)
  })

  it("emits valid RFC3339 UTC instants that parse back to the same instant", () => {
    const bounds = localDateToUtcBounds({
      from: "2026-01-01",
      to: "2026-12-31",
    })

    expect(bounds.from).toMatch(RFC3339_UTC)
    expect(bounds.to).toMatch(RFC3339_UTC)
    expect(bounds.from?.endsWith("Z")).toBe(true)
    expect(bounds.to?.endsWith("Z")).toBe(true)
    expect(new Date(bounds.from as string).toISOString()).toBe(bounds.from)
    expect(new Date(bounds.to as string).toISOString()).toBe(bounds.to)
  })

  it("omits cleared fields instead of sending a date the user cleared", () => {
    expect(localDateToUtcBounds({})).toEqual({
      from: undefined,
      to: undefined,
      inverted: false,
    })
    expect(localDateToUtcBounds({ from: "2026-01-01" })).toEqual({
      from: toUtcFrom("2026-01-01"),
      to: undefined,
      inverted: false,
    })
    expect(localDateToUtcBounds({ to: "2026-01-01" })).toEqual({
      from: undefined,
      to: toUtcTo("2026-01-01"),
      inverted: false,
    })
    expect(toUtcFrom(undefined)).toBeUndefined()
    expect(toUtcTo(undefined)).toBeUndefined()
    expect(toUtcFrom("")).toBeUndefined()
    expect(toUtcTo("")).toBeUndefined()
  })

  it("ignores a malformed bound rather than emitting garbage", () => {
    expect(localDateToUtcBounds({ from: "2026-02-31" })).toEqual({
      from: undefined,
      to: undefined,
      inverted: false,
    })
    expect(
      localDateToUtcBounds({ from: "23/09/2026", to: "2026-09-27" })
    ).toEqual({
      from: undefined,
      to: toUtcTo("2026-09-27"),
      inverted: false,
    })
  })
})

describe("date-bounds — inverted ranges (DISC-05)", () => {
  it("flags from > to and emits no bounds at all", () => {
    expect(isInvertedRange("2026-09-27", "2026-01-01")).toBe(true)
    expect(isInvertedRange("2026-01-01", "2026-09-27")).toBe(false)
    expect(isInvertedRange("2026-01-01", undefined)).toBe(false)

    expect(
      localDateToUtcBounds({ from: "2026-09-27", to: "2026-01-01" })
    ).toEqual({ inverted: true })
  })

  it("treats the same day as a valid, non-inverted range", () => {
    expect(isInvertedRange("2026-09-27", "2026-09-27")).toBe(false)
    expect(
      localDateToUtcBounds({ from: "2026-09-27", to: "2026-09-27" }).inverted
    ).toBe(false)
  })
})

describe("date-bounds — DST transition days (DISC-05)", () => {
  it("covers the whole spring-forward local day (America/New_York 2026-03-08)", () => {
    withTimeZone("America/New_York", () => {
      // Local midnight is EST (−05:00); the local end of day is already EDT
      // (−04:00) because 02:00–03:00 does not exist.
      expect(toUtcFrom("2026-03-08")).toBe("2026-03-08T05:00:00.000Z")
      expect(toUtcTo("2026-03-08")).toBe("2026-03-09T03:59:59.999Z")

      const span =
        Date.parse(toUtcTo("2026-03-08") as string) -
        Date.parse(toUtcFrom("2026-03-08") as string)
      expect(span).toBe(82_799_999)
    })
  })

  it("covers the whole fall-back local day (America/New_York 2026-11-01)", () => {
    withTimeZone("America/New_York", () => {
      // Local midnight is EDT (−04:00); the local end of day is EST (−05:00)
      // because 01:00–02:00 happens twice.
      expect(toUtcFrom("2026-11-01")).toBe("2026-11-01T04:00:00.000Z")
      expect(toUtcTo("2026-11-01")).toBe("2026-11-02T04:59:59.999Z")

      const span =
        Date.parse(toUtcTo("2026-11-01") as string) -
        Date.parse(toUtcFrom("2026-11-01") as string)
      expect(span).toBe(89_999_999)
    })
  })

  it("still yields a valid first instant when local midnight does not exist (America/Santiago 2026-09-06)", () => {
    withTimeZone("America/Santiago", () => {
      // Chile jumps 00:00 → 01:00, so the day's first real instant is 01:00.
      expect(toUtcFrom("2026-09-06")).toBe("2026-09-06T04:00:00.000Z")
      expect(toUtcFrom("2026-09-06")).toMatch(RFC3339_UTC)
      expect(new Date(toUtcFrom("2026-09-06") as string).getDate()).toBe(6)
      expect(toUtcTo("2026-09-06")).toMatch(/\.999Z$/)
    })
  })
})

describe("date-bounds — formatted range summary (design spec §3.4)", () => {
  it("renders `Jan 1, 2026 → Sep 27, 2026` and its one-sided forms", () => {
    expect(
      formatLocalDateRange(
        { from: "2026-01-01", to: "2026-09-27" },
        { locale: "en-US" }
      )
    ).toBe("Jan 1, 2026 → Sep 27, 2026")
    expect(
      formatLocalDateRange({ from: "2026-01-01" }, { locale: "en-US" })
    ).toBe("From Jan 1, 2026")
    expect(
      formatLocalDateRange({ to: "2026-09-27" }, { locale: "en-US" })
    ).toBe("Until Sep 27, 2026")
    expect(formatLocalDateRange({})).toBe("Any date")
    expect(
      formatLocalDateRange({ from: "2026-02-31" }, { locale: "en-US" })
    ).toBe("Any date")
  })
})

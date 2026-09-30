import { fireEvent, render, screen } from "@testing-library/react"
import { describe, expect, it, vi } from "vitest"

import { DateRangeFilter } from "./date-range-filter"
import { formatLocalDateRange } from "@/lib/date-bounds"
import type { DateRangeFilterProps } from "./date-range-filter"

/**
 * DISC-02 / design spec §3.4 — one manually-editable range: two labelled native
 * date inputs inside the spec's `346×42 r12 surface-warm` field, plus the
 * formatted range summary.
 */

function renderFilter(overrides: Partial<DateRangeFilterProps> = {}) {
  const props: DateRangeFilterProps = {
    id: "tweet",
    label: "Tweet date",
    fromLabel: "Tweet date from",
    toLabel: "Tweet date to",
    onFromChange: vi.fn(),
    onToChange: vi.fn(),
    ...overrides,
  }

  render(<DateRangeFilter {...props} />)
  return props
}

describe("DateRangeFilter — field (design spec §3.4)", () => {
  it("renders the section label and two explicitly labelled date inputs", () => {
    renderFilter()

    expect(
      screen.getByRole("heading", { name: "Tweet date" })
    ).toBeInTheDocument()

    const from = screen.getByLabelText("Tweet date from")
    const to = screen.getByLabelText("Tweet date to")
    expect(from).toHaveAttribute("type", "date")
    expect(to).toHaveAttribute("type", "date")
  })

  it("dresses the field as the spec's 346×42 r12 surface-warm control", () => {
    renderFilter()

    const field = screen.getByLabelText("Tweet date from").parentElement
    expect(field?.className).toContain("max-w-[346px]")
    expect(field?.className).toContain("h-[42px]")
    expect(field?.className).toContain("rounded-sm")
    expect(field?.className).toContain("bg-surface-warm")
    expect(field?.className).toContain("border-border")
  })

  it("shows the formatted range summary `Jan 1, 2026 → Sep 27, 2026`", () => {
    renderFilter({ from: "2026-01-01", to: "2026-09-27" })

    expect(screen.getByTestId("date-range-tweet-summary")).toHaveTextContent(
      formatLocalDateRange(
        { from: "2026-01-01", to: "2026-09-27" },
        { locale: "en-US" }
      )
    )
    expect(screen.getByTestId("date-range-tweet-summary")).toHaveTextContent(
      "2026"
    )
  })

  it("reads `Any date` when both bounds are cleared", () => {
    renderFilter()

    expect(screen.getByTestId("date-range-tweet-summary")).toHaveTextContent(
      "Any date"
    )
  })

  it("reports each edit with the raw input value", () => {
    const props = renderFilter()

    fireEvent.change(screen.getByLabelText("Tweet date from"), {
      target: { value: "2026-01-01" },
    })
    fireEvent.change(screen.getByLabelText("Tweet date to"), {
      target: { value: "2026-09-27" },
    })

    expect(props.onFromChange).toHaveBeenCalledWith("2026-01-01")
    expect(props.onToChange).toHaveBeenCalledWith("2026-09-27")
  })
})

describe("DateRangeFilter — inverted range (DISC-05)", () => {
  it("flags from > to instead of silently sending an impossible range", () => {
    renderFilter({ from: "2026-09-27", to: "2026-01-01" })

    expect(screen.getByLabelText("Tweet date from")).toHaveAttribute(
      "aria-invalid",
      "true"
    )
    expect(screen.getByLabelText("Tweet date to")).toHaveAttribute(
      "aria-invalid",
      "true"
    )
    expect(screen.getByRole("alert")).toHaveTextContent(
      "From must be on or before To."
    )
  })

  it("does not flag a valid or one-sided range", () => {
    renderFilter({ from: "2026-01-01", to: "2026-09-27" })
    expect(screen.queryByRole("alert")).not.toBeInTheDocument()
    expect(screen.getByLabelText("Tweet date from")).toHaveAttribute(
      "aria-invalid",
      "false"
    )
  })
})

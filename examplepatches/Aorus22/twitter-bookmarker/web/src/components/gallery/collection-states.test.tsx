import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it, vi } from "vitest"

import { CollectionEmptyState } from "./collection-empty-state"
import { CollectionFilterEmptyState } from "./collection-filter-empty-state"

/**
 * COLL-10: the postless-collection state and the filter-no-match state are two
 * genuinely different states — different copy, only the filter one offering
 * `Clear filters` (PRD-2 §60).
 */

describe("CollectionEmptyState", () => {
  it("renders the exact postless-collection copy", () => {
    render(<CollectionEmptyState />)

    expect(screen.getByTestId("collection-empty-state")).toBeInTheDocument()
    expect(
      screen.getByRole("heading", { name: "This collection is empty" })
    ).toBeInTheDocument()
    expect(
      screen.getByText(
        "This folder is quiet. The next bookmark will bring it to life."
      )
    ).toBeInTheDocument()
  })

  it("does not render the filter-no-match copy or a Clear filters action", () => {
    render(<CollectionEmptyState />)

    expect(
      screen.queryByText("No posts match your filters")
    ).not.toBeInTheDocument()
    expect(
      screen.queryByRole("button", { name: "Clear filters" })
    ).not.toBeInTheDocument()
  })
})

describe("CollectionFilterEmptyState", () => {
  it("renders the filter-no-match copy with a Clear filters action", () => {
    render(<CollectionFilterEmptyState onClearFilters={() => {}} />)

    expect(
      screen.getByTestId("collection-filter-empty-state")
    ).toBeInTheDocument()
    expect(
      screen.getByRole("heading", { name: "No posts match your filters" })
    ).toBeInTheDocument()
    expect(
      screen.getByRole("button", { name: "Clear filters" })
    ).toBeInTheDocument()
  })

  it("invokes the clear-filters callback (Phase 6 resets the query)", async () => {
    const user = userEvent.setup()
    const onClearFilters = vi.fn()
    render(<CollectionFilterEmptyState onClearFilters={onClearFilters} />)

    await user.click(screen.getByRole("button", { name: "Clear filters" }))

    expect(onClearFilters).toHaveBeenCalledTimes(1)
  })

  it("does not render the postless-collection copy", () => {
    render(<CollectionFilterEmptyState onClearFilters={() => {}} />)

    expect(
      screen.queryByText("This collection is empty")
    ).not.toBeInTheDocument()
  })
})

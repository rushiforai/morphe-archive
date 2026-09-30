import {
  fireEvent,
  render,
  screen,
  waitFor,
  within,
} from "@testing-library/react"
import { afterEach, describe, expect, it, vi } from "vitest"

import { FilterControl } from "./filter-control"
import { DEFAULT_GALLERY_QUERY, type GalleryQuery } from "@/lib/gallery-query"

/**
 * DISC-02 / DISC-03 — the `Filter` control: Popover at/above `md`, Sheet below
 * it, the design spec §3.4 contents, staged edits committed only on `Apply`,
 * `Reset`, and quick presets that target the Bookmarked range and stay editable.
 */

/** Fixed local reference: Sep 27, 2026. */
const NOW = new Date(2026, 8, 27, 15, 30, 0)
const ORIGINAL_INNER_WIDTH = window.innerWidth

function setInnerWidth(width: number) {
  Object.defineProperty(window, "innerWidth", {
    value: width,
    writable: true,
    configurable: true,
  })
}

afterEach(() => {
  setInnerWidth(ORIGINAL_INNER_WIDTH)
})

function renderControl(
  query: GalleryQuery = DEFAULT_GALLERY_QUERY,
  active = false
) {
  const onApply = vi.fn()
  render(
    <FilterControl active={active} query={query} onApply={onApply} now={NOW} />
  )
  return { onApply }
}

async function openSurface(testId: "filter-popover" | "filter-sheet") {
  fireEvent.click(screen.getByTestId("collection-filter"))
  return screen.findByTestId(testId)
}

describe("FilterControl — surface by breakpoint (DISC-02, PRD-2 §30/§66)", () => {
  it("opens a Popover on desktop and not a Sheet", async () => {
    setInnerWidth(1024)
    renderControl()

    const popover = await openSurface("filter-popover")

    expect(popover).toBeInTheDocument()
    expect(screen.queryByTestId("filter-sheet")).not.toBeInTheDocument()
    expect(screen.getByTestId("filter-panel")).toBeInTheDocument()
  })

  it("opens a Sheet below the md breakpoint and not a Popover", async () => {
    setInnerWidth(400)
    renderControl()

    const sheet = await openSurface("filter-sheet")

    expect(sheet).toBeInTheDocument()
    expect(screen.queryByTestId("filter-popover")).not.toBeInTheDocument()
    expect(screen.getByTestId("filter-panel")).toBeInTheDocument()
  })
})

describe("FilterControl — design spec §3.4 contents (DISC-02)", () => {
  it("renders the title, subtitle, sections, four fields, pills and actions", async () => {
    setInnerWidth(1024)
    renderControl()
    await openSurface("filter-popover")

    const panel = screen.getByTestId("filter-panel")

    expect(
      within(panel).getByRole("heading", { name: "Filter your archive" })
    ).toBeInTheDocument()
    expect(
      within(panel).getByText("Mix posted and bookmarked dates together.")
    ).toBeInTheDocument()

    for (const label of ["Tweet date", "Bookmarked date", "Quick ranges"]) {
      expect(
        within(panel).getByRole("heading", { name: label })
      ).toBeInTheDocument()
    }

    for (const label of [
      "Tweet date from",
      "Tweet date to",
      "Bookmarked date from",
      "Bookmarked date to",
    ]) {
      expect(within(panel).getByLabelText(label)).toHaveAttribute(
        "type",
        "date"
      )
    }

    const presets: Array<[string, string]> = [
      ["quick-range-today", "Today"],
      ["quick-range-last-7-days", "Last 7 Days"],
      ["quick-range-last-30-days", "Last 30 Days"],
      ["quick-range-this-year", "This Year"],
    ]
    for (const [testId, name] of presets) {
      expect(within(panel).getByRole("button", { name })).toHaveAttribute(
        "data-testid",
        testId
      )
    }

    expect(within(panel).getByTestId("filter-reset")).toHaveTextContent("Reset")
    expect(within(panel).getByTestId("filter-apply")).toHaveTextContent("Apply")
  })

  it("matches the spec's 390-wide r20 panel and 78/92-wide actions", async () => {
    setInnerWidth(1024)
    renderControl()
    await openSurface("filter-popover")

    const panel = screen.getByTestId("filter-panel")
    expect(panel.className).toContain("w-[390px]")
    expect(panel.className).toContain("p-[22px]")
    expect(panel.className).toContain("rounded-xl")
    expect(panel.className).toContain("shadow-popover")

    const reset = screen.getByTestId("filter-reset")
    const apply = screen.getByTestId("filter-apply")
    expect(reset.className).toContain("w-[78px]")
    expect(reset.className).toContain("h-10")
    expect(apply.className).toContain("w-[92px]")
    expect(apply.className).toContain("h-10")
    expect(apply.className).toContain("bg-grad-brand")
  })

  it("shows the active dot on the trigger when a date filter is committed", () => {
    setInnerWidth(1024)
    renderControl({ ...DEFAULT_GALLERY_QUERY, savedFrom: "2026-09-20" }, true)

    expect(screen.getByTestId("collection-filter-dot")).toBeInTheDocument()
    expect(screen.getByTestId("collection-filter")).toHaveAttribute(
      "data-filter-active",
      "true"
    )
  })
})

describe("FilterControl — draft semantics (DISC-02)", () => {
  it("stages edits and commits them only on Apply", async () => {
    setInnerWidth(1024)
    const { onApply } = renderControl()
    await openSurface("filter-popover")

    fireEvent.change(screen.getByLabelText("Bookmarked date from"), {
      target: { value: "2026-09-20" },
    })
    fireEvent.change(screen.getByLabelText("Bookmarked date to"), {
      target: { value: "2026-09-27" },
    })

    expect(onApply).not.toHaveBeenCalled()

    fireEvent.click(screen.getByTestId("filter-apply"))

    expect(onApply).toHaveBeenCalledWith(
      expect.objectContaining({
        savedFrom: "2026-09-20",
        savedTo: "2026-09-27",
      })
    )
  })

  it("discards the draft when the surface is closed without Apply", async () => {
    setInnerWidth(1024)
    const { onApply } = renderControl()
    await openSurface("filter-popover")

    fireEvent.change(screen.getByLabelText("Tweet date from"), {
      target: { value: "2026-01-01" },
    })
    fireEvent.keyDown(document, { key: "Escape" })

    await waitFor(() => {
      expect(screen.queryByTestId("filter-panel")).not.toBeInTheDocument()
    })
    expect(onApply).not.toHaveBeenCalled()

    // Reopening re-seeds from committed state, so the abandoned edit is gone.
    fireEvent.click(screen.getByTestId("collection-filter"))
    await screen.findByTestId("filter-panel")
    expect(screen.getByLabelText("Tweet date from")).toHaveValue("")
  })

  it("clears both ranges on Reset without committing", async () => {
    setInnerWidth(1024)
    const { onApply } = renderControl({
      ...DEFAULT_GALLERY_QUERY,
      tweetFrom: "2026-01-01",
      savedTo: "2026-09-27",
    })
    await openSurface("filter-popover")

    fireEvent.click(screen.getByTestId("filter-reset"))

    expect(screen.getByLabelText("Tweet date from")).toHaveValue("")
    expect(screen.getByLabelText("Bookmarked date to")).toHaveValue("")
    expect(onApply).not.toHaveBeenCalled()
  })
})

describe("FilterControl — quick presets (DISC-03)", () => {
  it("seeds the Bookmarked range, leaves Tweet date, and stays editable", async () => {
    setInnerWidth(1024)
    const { onApply } = renderControl()
    await openSurface("filter-popover")

    fireEvent.click(screen.getByRole("button", { name: "Last 7 Days" }))

    expect(screen.getByLabelText("Bookmarked date from")).toHaveValue(
      "2026-09-21"
    )
    expect(screen.getByLabelText("Bookmarked date to")).toHaveValue(
      "2026-09-27"
    )
    expect(screen.getByLabelText("Tweet date from")).toHaveValue("")

    // A preset is a starting point, not a lock.
    fireEvent.change(screen.getByLabelText("Bookmarked date from"), {
      target: { value: "2026-09-01" },
    })
    expect(screen.getByLabelText("Bookmarked date from")).toHaveValue(
      "2026-09-01"
    )

    fireEvent.click(screen.getByTestId("filter-apply"))
    expect(onApply).toHaveBeenCalledWith(
      expect.objectContaining({
        savedFrom: "2026-09-01",
        savedTo: "2026-09-27",
      })
    )
  })

  it("marks the committed preset active and the others not", async () => {
    setInnerWidth(1024)
    renderControl({
      ...DEFAULT_GALLERY_QUERY,
      savedFrom: "2026-09-27",
      savedTo: "2026-09-27",
    })
    await openSurface("filter-popover")

    expect(screen.getByRole("button", { name: "Today" })).toHaveAttribute(
      "aria-pressed",
      "true"
    )
    expect(screen.getByRole("button", { name: "Last 7 Days" })).toHaveAttribute(
      "aria-pressed",
      "false"
    )
  })
})

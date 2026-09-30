import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { useState } from "react"
import { describe, expect, it, vi } from "vitest"

import { CollectionToolbar } from "./collection-toolbar"
import { SORT_OPTIONS } from "@/lib/collection-sort"
import type { GallerySort } from "@/types"

/**
 * COLL-01: the toolbar shell is present with the Figma-measured controls, is
 * wired to props/callbacks (the Phase 6 seam), and the mockup's omitted pill
 * rows stay omitted.
 */

/** Controlled host, mirroring how the page owns the draft toolbar state. */
function ControlledToolbar({
  onSearchChange,
  onSortChange,
  onFilterClick,
  filterActive = false,
}: {
  onSearchChange: (value: string) => void
  onSortChange: (value: GallerySort) => void
  onFilterClick: () => void
  filterActive?: boolean
}) {
  const [search, setSearch] = useState("")
  const [sort, setSort] = useState<GallerySort>("saved_desc")

  return (
    <CollectionToolbar
      search={search}
      onSearchChange={(value) => {
        setSearch(value)
        onSearchChange(value)
      }}
      filterActive={filterActive}
      onFilterClick={onFilterClick}
      sort={sort}
      onSortChange={(value) => {
        setSort(value)
        onSortChange(value)
      }}
    />
  )
}

function renderToolbar(
  overrides: Partial<Parameters<typeof CollectionToolbar>[0]> = {}
) {
  const props = {
    search: "",
    onSearchChange: vi.fn(),
    onFilterClick: vi.fn(),
    sort: "saved_desc" as const,
    onSortChange: vi.fn(),
    ...overrides,
  }

  render(<CollectionToolbar {...props} />)
  return props
}

describe("CollectionToolbar — controls (design spec §3.3)", () => {
  it("renders the 440/86/150-wide 40-tall controls", () => {
    renderToolbar()

    const search = screen.getByTestId("collection-search")
    expect(search).toHaveAttribute("placeholder", "⌕ Search this collection…")
    expect(search.className).toContain("h-10")
    expect(search.className).toContain("w-[440px]")
    expect(search.className).toContain("rounded-sm")

    const filter = screen.getByTestId("collection-filter")
    expect(filter).toHaveTextContent("Filter")
    expect(filter.className).toContain("h-10")
    expect(filter.className).toContain("w-[86px]")

    const sort = screen.getByTestId("collection-sort")
    expect(sort.className).toContain("h-10")
    expect(sort.className).toContain("w-[150px]")
    expect(sort.className).toContain("rounded-sm")
    // The trigger's *text* is the current value, so the control needs a name of
    // its own or a screen reader would hear only "Newest Bookmarked".
    expect(sort).toHaveAttribute("aria-label", "Sort")
    expect(sort).toHaveTextContent("Newest Bookmarked")
  })

  it("is a themed menu control, not a native select", () => {
    renderToolbar()

    const trigger = screen.getByTestId("collection-sort")
    expect(trigger).toHaveRole("button")
    expect(trigger).toHaveAttribute("aria-haspopup", "menu")
    expect(trigger).toHaveAttribute("aria-expanded", "false")
    // The native control is what this replaced: its box can be restyled, but the
    // popup it opens is drawn by the OS and ignores the palette entirely.
    expect(
      document.querySelector('select[data-testid="collection-sort"]')
    ).toBeNull()
  })

  it("offers exactly the four PRD-2 §33 sort modes, newest bookmarked first", async () => {
    const user = userEvent.setup()
    renderToolbar()

    await user.click(screen.getByTestId("collection-sort"))

    const options = screen
      .getAllByRole("menuitemradio")
      .map((option) => option.textContent)

    expect(options).toEqual(SORT_OPTIONS.map((option) => option.label))
    // The selected mode is shown on the trigger itself, and is what the trigger
    // painted on the very first frame (before this click).
    expect(screen.getByTestId("collection-sort")).toHaveTextContent(
      "Newest Bookmarked"
    )
  })

  it("emits the typed search text (Phase 6 owns the debounce)", async () => {
    const user = userEvent.setup()
    const onSearchChange = vi.fn()
    render(
      <ControlledToolbar
        onSearchChange={onSearchChange}
        onSortChange={vi.fn()}
        onFilterClick={vi.fn()}
      />
    )

    await user.type(screen.getByTestId("collection-search"), "wayland")

    expect(screen.getByTestId("collection-search")).toHaveValue("wayland")
    expect(onSearchChange.mock.calls.at(-1)?.[0]).toBe("wayland")
  })

  it("emits a sort change with the API value", async () => {
    const user = userEvent.setup()
    const onSortChange = vi.fn()
    render(
      <ControlledToolbar
        onSearchChange={vi.fn()}
        onSortChange={onSortChange}
        onFilterClick={vi.fn()}
      />
    )

    await user.click(screen.getByTestId("collection-sort"))
    await user.click(
      screen.getByRole("menuitemradio", { name: "Oldest Posted" })
    )

    expect(onSortChange).toHaveBeenCalledWith("tweet_asc")
    expect(screen.getByTestId("collection-sort")).toHaveTextContent(
      "Oldest Posted"
    )
  })

  it("invokes the filter callback and marks the active state", async () => {
    const user = userEvent.setup()
    const props = renderToolbar()

    await user.click(screen.getByTestId("collection-filter"))

    expect(props.onFilterClick).toHaveBeenCalledTimes(1)
    expect(
      screen.queryByTestId("collection-filter-dot")
    ).not.toBeInTheDocument()
  })

  it("shows an active dot when a filter is applied", () => {
    renderToolbar({ filterActive: true })

    expect(screen.getByTestId("collection-filter-dot")).toBeInTheDocument()
  })

  it("lets Phase 6 supply the real Filter trigger in the button's place", () => {
    const onFilterClick = vi.fn()
    renderToolbar({
      filterActive: true,
      onFilterClick,
      filterControl: (
        <button type="button" data-testid="collection-filter">
          Filter
        </button>
      ),
    })

    // The supplied trigger replaces the built-in button (which would still own
    // the dot); the toolbar's own callback is not wired to it.
    expect(screen.getAllByTestId("collection-filter")).toHaveLength(1)
    expect(
      screen.queryByTestId("collection-filter-dot")
    ).not.toBeInTheDocument()
    expect(onFilterClick).not.toHaveBeenCalled()
  })
})

describe("CollectionToolbar — omitted mockup elements (design spec §7)", () => {
  it("renders no media-type pills", () => {
    renderToolbar()

    for (const label of ["All", "Images", "Videos", "Links", "Text"]) {
      expect(
        screen.queryByRole("button", { name: label })
      ).not.toBeInTheDocument()
    }
    expect(screen.queryByTestId("media-type-pills")).not.toBeInTheDocument()
  })

  it("renders no topic pills", () => {
    renderToolbar()

    for (const label of ["Terminal", "Tools", "Self-hosting", "Linux Tips"]) {
      expect(
        screen.queryByRole("button", { name: label })
      ).not.toBeInTheDocument()
    }
    expect(screen.queryByTestId("topic-pills")).not.toBeInTheDocument()
  })
})

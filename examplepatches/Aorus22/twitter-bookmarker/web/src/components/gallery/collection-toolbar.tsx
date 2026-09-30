import { ChevronDownIcon, ListFilter } from "lucide-react"
import type { ReactNode } from "react"

import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuRadioGroup,
  DropdownMenuRadioItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { SORT_OPTIONS, sortLabel } from "@/lib/collection-sort"
import {
  COLLECTION_SEARCH_PLACEHOLDER,
  FILTER_LABEL,
  SORT_LABEL,
} from "@/lib/messages"
import { cn } from "@/lib/utils"
import type { GallerySort } from "@/types"

/**
 * Collection toolbar shell (COLL-01, design spec §3.3).
 *
 * Controls, all 40 tall, exactly as Figma measures them:
 *   - search `440×40` `r12` (`surface` + border),
 *   - `Filter` `86×40` `r12`,
 *   - sort `150×40` `r12`.
 *
 * **Phase 6 seam.** Phase 5 left this component presentational and owns no
 * behaviour: the page passes controlled values and change callbacks. Phase 6
 * supplies the real handlers (debounced search, `FilterControl`,
 * `useGalleryQuery` for the URL-synced sort) against this exact prop contract:
 *
 *   search: string            onSearchChange: (value: string) => void
 *   filterActive: boolean     onFilterClick?: () => void
 *   sort: GallerySort         onSortChange: (value: GallerySort) => void
 *   filterControl?: ReactNode
 *
 * `filterControl` is how Phase 6 swaps the built-in `Filter` button for the
 * popover/sheet **trigger** while keeping the button in the toolbar (and keeping
 * this component's default button, and its tests, intact).
 *
 * `filterActive` renders the active dot only; the popover's `aria-expanded` /
 * `aria-haspopup` semantics belong to the trigger Phase 6 supplies.
 *
 * The mockup's media-type pills and topic pills are deliberately omitted
 * (design spec §7) and a test asserts their absence.
 *
 * **The sort control is a menu of radio items, not a native `<select>`.** A
 * native one can be given the toolbar's box, but its *popup* is drawn by the OS
 * and cannot be themed at all: on the dark frame it opened as a white system
 * list, the one surface in the gallery that ignored the palette. The mockup
 * also draws `Sort: Newest ▾`, and `appearance-none` had thrown the chevron
 * away to get a flat box — this restores it.
 *
 * It is a menu rather than Radix's `Select` on purpose. `Select` calls
 * `hideOthers()` on its content and exposes no `modal` prop to turn that off,
 * so an open sort list marks the whole app `aria-hidden` while its focusables
 * stay reachable — axe reports that as serious `aria-hidden-focus`, and it is
 * the same defect `ui/dropdown-menu.tsx` exists to avoid. `menuitemradio` is
 * the ARIA pattern for choosing one of a small fixed set, so the semantics are
 * right too. `aria-label` carries the control's name ("Sort") because its
 * visible text is the current *value*.
 */

export interface CollectionToolbarProps {
  /** Current search text (Phase 6: the immediate pre-debounce echo). */
  search: string
  onSearchChange: (value: string) => void
  /** True when a date filter is applied. */
  filterActive?: boolean
  /** Invoked by the built-in button when no `filterControl` is supplied. */
  onFilterClick?: () => void
  /** Replaces the built-in Filter button (the Phase 6 popover/sheet trigger). */
  filterControl?: ReactNode
  /** Current sort mode. */
  sort: GallerySort
  onSortChange: (value: GallerySort) => void
  className?: string
}

export function CollectionToolbar({
  search,
  onSearchChange,
  filterActive = false,
  onFilterClick,
  filterControl,
  sort,
  onSortChange,
  className,
}: CollectionToolbarProps) {
  return (
    <div
      data-testid="collection-toolbar"
      className={cn("flex flex-wrap items-center gap-3", className)}
    >
      <input
        type="search"
        data-testid="collection-search"
        value={search}
        onChange={(event) => {
          onSearchChange(event.target.value)
        }}
        placeholder={COLLECTION_SEARCH_PLACEHOLDER}
        aria-label={COLLECTION_SEARCH_PLACEHOLDER}
        className="h-10 w-full max-w-[440px] shrink-0 rounded-sm border border-border bg-surface px-3 text-[12px] leading-[1.4] font-medium text-ink outline-none placeholder:text-muted focus-visible:border-ring focus-visible:ring-3 focus-visible:ring-ring/50 sm:w-[440px]"
      />

      {filterControl ?? (
        <button
          type="button"
          data-testid="collection-filter"
          data-filter-active={filterActive}
          onClick={onFilterClick}
          className="flex h-10 w-[86px] shrink-0 items-center justify-center gap-1.5 rounded-sm border border-border bg-surface text-[11px] leading-[1.4] font-medium text-ink transition-colors outline-none hover:bg-surface-warm focus-visible:ring-3 focus-visible:ring-ring/50"
        >
          <ListFilter className="size-3.5" aria-hidden="true" />
          {FILTER_LABEL}
          {filterActive ? (
            <span
              aria-hidden="true"
              data-testid="collection-filter-dot"
              className="size-1.5 rounded-full bg-accent"
            />
          ) : null}
        </button>
      )}

      <DropdownMenu>
        <DropdownMenuTrigger asChild>
          <button
            type="button"
            data-testid="collection-sort"
            aria-label={SORT_LABEL}
            className="flex h-10 w-[150px] shrink-0 items-center justify-between gap-1.5 rounded-sm border border-border bg-surface px-2 text-[11px] leading-[1.4] font-medium text-ink transition-colors outline-none hover:bg-surface-warm focus-visible:ring-3 focus-visible:ring-ring/50"
          >
            <span className="line-clamp-1">{sortLabel(sort)}</span>
            <ChevronDownIcon
              className="size-3.5 shrink-0 text-muted"
              aria-hidden="true"
            />
          </button>
        </DropdownMenuTrigger>
        <DropdownMenuContent
          align="start"
          sideOffset={4}
          className="min-w-[150px] text-[11px]"
        >
          <DropdownMenuRadioGroup
            value={sort}
            onValueChange={(value) => {
              onSortChange(value as GallerySort)
            }}
          >
            {SORT_OPTIONS.map((option) => (
              <DropdownMenuRadioItem
                key={option.value}
                value={option.value}
                data-testid="collection-sort-option"
                data-value={option.value}
                className="text-[11px] leading-[1.4]"
              >
                {option.label}
              </DropdownMenuRadioItem>
            ))}
          </DropdownMenuRadioGroup>
        </DropdownMenuContent>
      </DropdownMenu>
    </div>
  )
}

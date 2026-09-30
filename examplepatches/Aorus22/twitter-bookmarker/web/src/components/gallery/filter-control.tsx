import { ListFilter } from "lucide-react"
import { useCallback, useState } from "react"

import { FilterPanel } from "@/components/gallery/filter-panel"
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover"
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet"
import { useIsDesktop } from "@/hooks/use-media-query"
import {
  datesFromQuery,
  type GalleryFilterDates,
  type GalleryQuery,
} from "@/lib/gallery-query"
import { FILTER_LABEL, FILTER_SUBTITLE, FILTER_TITLE } from "@/lib/messages"

/**
 * The `Filter` control (PRD-2 §30/§66, DISC-02).
 *
 * At or above `md` the design's popover opens anchored under the Filter button;
 * below it the same panel is rendered in a Sheet/Drawer. Both surfaces share
 * {@link FilterPanel}, and the draft is seeded from the committed query each
 * time a surface opens, so closing without `Apply` cannot corrupt committed
 * state.
 *
 * The trigger keeps the Phase 5 toolbar button's exact markup and
 * `data-testid="collection-filter"` so the toolbar's own tests and the page's
 * control queries keep working.
 */

export interface FilterControlProps {
  /** True when a date filter is committed (drives the active dot). */
  active: boolean
  /** The committed query the draft is seeded from. */
  query: GalleryQuery
  /** Commit the draft (a push to history). */
  onApply: (dates: GalleryFilterDates) => void
  /** Reference "today" for preset resolution; injectable for tests. */
  now?: Date
}

const TRIGGER_CLASS =
  "flex h-10 w-[86px] shrink-0 items-center justify-center gap-1.5 rounded-sm border border-border bg-surface text-[11px] leading-[1.4] font-medium text-ink outline-none transition-colors hover:bg-surface-warm focus-visible:ring-3 focus-visible:ring-ring/50"

export function FilterControl({
  active,
  query,
  onApply,
  now,
}: FilterControlProps) {
  const isDesktop = useIsDesktop()
  const [open, setOpen] = useState(false)
  const [draft, setDraft] = useState<GalleryFilterDates>(() =>
    datesFromQuery(query)
  )

  const handleOpenChange = useCallback(
    (next: boolean) => {
      if (next) {
        // Re-seed from committed state on every open: a previous draft that was
        // abandoned by closing without Apply is discarded here.
        setDraft(datesFromQuery(query))
      }
      setOpen(next)
    },
    [query]
  )

  const handleApply = useCallback(() => {
    onApply(draft)
    setOpen(false)
  }, [draft, onApply])

  const handleReset = useCallback(() => {
    setDraft({})
  }, [])

  const trigger = (
    <button
      type="button"
      data-testid="collection-filter"
      data-filter-active={active}
      aria-haspopup="dialog"
      className={TRIGGER_CLASS}
    >
      <ListFilter className="size-3.5" aria-hidden="true" />
      {FILTER_LABEL}
      {active ? (
        <span
          aria-hidden="true"
          data-testid="collection-filter-dot"
          className="size-1.5 rounded-full bg-accent"
        />
      ) : null}
    </button>
  )

  const panel = (
    <FilterPanel
      dates={draft}
      onChange={setDraft}
      onReset={handleReset}
      onApply={handleApply}
      now={now}
    />
  )

  if (!isDesktop) {
    return (
      <Sheet open={open} onOpenChange={handleOpenChange}>
        <SheetTrigger asChild>{trigger}</SheetTrigger>
        <SheetContent
          side="right"
          data-testid="filter-sheet"
          className="w-full max-w-[390px] gap-0 bg-surface p-0"
        >
          <SheetTitle className="sr-only">{FILTER_TITLE}</SheetTitle>
          <SheetDescription className="sr-only">
            {FILTER_SUBTITLE}
          </SheetDescription>
          <div className="overflow-y-auto">{panel}</div>
        </SheetContent>
      </Sheet>
    )
  }

  return (
    <Popover open={open} onOpenChange={handleOpenChange}>
      <PopoverTrigger asChild>{trigger}</PopoverTrigger>
      <PopoverContent
        data-testid="filter-popover"
        align="start"
        sideOffset={8}
        // Radix Popover.Content is `role="dialog"`; without a name axe reports
        // `aria-dialog-name` (serious, HARD-04). The panel renders the visible
        // title, but it is not linked, so name the dialog explicitly from the
        // one source of truth for the copy.
        aria-label={FILTER_TITLE}
        className="w-auto border-0 bg-transparent p-0 shadow-none ring-0"
      >
        {panel}
      </PopoverContent>
    </Popover>
  )
}

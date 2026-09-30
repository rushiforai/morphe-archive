import {
  Children,
  isValidElement,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from "react"

import { useMasonryColumns } from "@/hooks/use-masonry-columns"
import {
  MASONRY_COLUMN_GAP,
  MASONRY_ROW_GAP,
  distributeMasonryKeys,
  masonryContainerWidth,
} from "@/lib/masonry"
import { cn } from "@/lib/utils"

/**
 * Pinterest-style post masonry (PRD-2 §21, design spec §3.3).
 *
 * **Layout is ours, not the browser's.** Each card keeps its natural height
 * (PRD-2 §675) — this is masonry, not a grid with equalised rows — but the
 * columns are packed by {@link distributeMasonryKeys} and rendered as `count`
 * flex columns, instead of by CSS `column-count`.
 *
 * That is a deliberate fix, not a style preference. CSS multi-column balances
 * the entire list against the container's content height, so every appended
 * page re-distributed the whole grid: measured in headless Chrome, appending
 * page 2 to a 70-post collection **moved 22 of the 30 rendered cards**, by up
 * to 3106px vertically and two columns horizontally. That is the "the cards
 * move on their own while I scroll" bug. Packing keys ourselves makes the
 * layout **append-only**: a key that already has a column keeps it for the life
 * of the view, so a new page can only add cards at the bottom of a column,
 * never displace one above them.
 *
 * The cost is that the DOM is column-major rather than a single logical list.
 * Within a column the logical (sorted) order is preserved, a column-major order
 * is the order a sighted user scans the layout in, and the logical position is
 * still exposed as `data-index` on each row because the DOM no longer encodes
 * it.
 *
 * Packing runs in a layout effect, which keeps two things true at once:
 *   * it is **pre-paint**, so an appended page lands in its final column in the
 *     same frame it first appears — a provisional layout corrected by an effect
 *     would show the new cards jumping between columns;
 *   * React's rule against touching refs during render is respected, and the
 *     packing memory still survives renders without causing one.
 *
 * The list is capped at `n*292 + (n-1)*32` so a column is exactly the design's
 * 292-wide card instead of flexing wider on a large viewport. That cap lives on
 * the inner grid; the observed wrapper around it stays uncapped so the column
 * count can grow as well as shrink.
 *
 * `columns` exists so a test can pin the count; production always measures the
 * container via {@link useMasonryColumns}.
 */

export interface GalleryMasonryProps {
  children: ReactNode
  /** Force a column count (tests / Phase 7); defaults to the measured count. */
  columns?: number
  className?: string
}

interface MasonryItem {
  key: string
  node: ReactNode
}

/**
 * The packing memory, held in a ref because it must survive renders **without
 * causing one**. Written and read only from layout effects.
 */
interface MasonryMemory {
  columnCount: number
  keys: string[]
  assigned: Map<string, number>
  /** Measured height per column as of the last commit. */
  heights: number[]
  /** How many items those heights covered, for the mean-height estimate. */
  measuredCount: number
}

/**
 * Joins the item keys into the single string the packing effect depends on.
 * Card keys are tweet ids (digits); a NUL can never appear in one, so a key can
 * never be mistaken for a separator.
 */
const KEY_SEPARATOR = "\u0000"

/** Flatten the children into keyed items, preserving declaration order. */
function collectItems(children: ReactNode): MasonryItem[] {
  const items: MasonryItem[] = []

  Children.forEach(children, (child) => {
    if (child === null || child === undefined || typeof child === "boolean") {
      return
    }

    const key =
      isValidElement(child) && child.key !== null
        ? child.key
        : `masonry-item-${items.length}`

    items.push({ key, node: child })
  })

  return items
}

export function GalleryMasonry({
  children,
  columns,
  className,
}: GalleryMasonryProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const measured = useMasonryColumns(containerRef)
  const count = columns ?? measured

  const items = useMemo(() => collectItems(children), [children])
  const signature = useMemo(
    () => items.map((item) => item.key).join(KEY_SEPARATOR),
    [items]
  )
  // Derived from the signature rather than from `items`, so the key array keeps
  // a stable identity across the parent's re-renders. Depending on `items`
  // itself would re-run the packing effect on every parent render and loop.
  const keys = useMemo(
    () => (signature === "" ? [] : signature.split(KEY_SEPARATOR)),
    [signature]
  )

  const [buckets, setBuckets] = useState<readonly number[][]>([])

  const columnRefs = useRef<(HTMLUListElement | null)[]>([])
  const memoryRef = useRef<MasonryMemory>({
    columnCount: 0,
    keys: [],
    assigned: new Map<string, number>(),
    heights: [],
    measuredCount: 0,
  })

  // Pack into columns, before paint.
  useLayoutEffect(() => {
    const memory = memoryRef.current

    // A page append is a pure prefix extension of what is already packed.
    // Anything else — a new collection, a filter, a re-sort, a column-count
    // change — is a new generation and legitimately re-packs from scratch.
    const continues =
      memory.columnCount === count &&
      memory.keys.length <= keys.length &&
      memory.keys.every((key, index) => key === keys[index])

    if (!continues) {
      memory.assigned = new Map<string, number>()
      memory.heights = []
      memory.measuredCount = 0
    }

    const measuredTotal = memory.heights.reduce(
      (sum, height) =>
        sum + (Number.isFinite(height) && height > 0 ? height : 0),
      0
    )
    const estimatedHeight =
      memory.measuredCount > 0 ? measuredTotal / memory.measuredCount : 0

    setBuckets(
      distributeMasonryKeys(
        keys,
        memory.assigned,
        count,
        memory.heights,
        estimatedHeight
      )
    )

    memory.columnCount = count
    memory.keys = keys
  }, [keys, count])

  // Record what the columns actually measure at, after every commit.
  //
  // Heights are read back from the DOM rather than estimated from the data: a
  // card's real height depends on its media layout, its text clamp and the
  // measured column width. Writing them through a ref cannot re-render and so
  // cannot move a card on its own — they only decide where the *next* page's
  // cards go, which is what keeps a late-growing image out of the layout path.
  useLayoutEffect(() => {
    const nodes = columnRefs.current.slice(0, count)
    memoryRef.current.heights = nodes.map((node) => node?.offsetHeight ?? 0)
    memoryRef.current.measuredCount = nodes.reduce(
      (sum, node) => sum + (node?.children.length ?? 0),
      0
    )
  })

  return (
    <div ref={containerRef} className="w-full">
      <div
        data-testid="gallery-masonry"
        data-columns={count}
        style={{
          columnGap: `${MASONRY_COLUMN_GAP}px`,
          maxWidth: `${masonryContainerWidth(count)}px`,
        }}
        className={cn("flex w-full items-start", className)}
      >
        {Array.from({ length: count }, (_, column) => (
          <ul
            key={column}
            ref={(node) => {
              columnRefs.current[column] = node
            }}
            className="flex min-w-0 flex-1 list-none flex-col"
            style={{ gap: `${MASONRY_ROW_GAP}px` }}
          >
            {(buckets[column] ?? []).map((index) => {
              const item = items[index]
              if (item === undefined) {
                return null
              }

              return (
                <li key={item.key} data-index={index} className="w-full">
                  {item.node}
                </li>
              )
            })}
          </ul>
        ))}
      </div>
    </div>
  )
}

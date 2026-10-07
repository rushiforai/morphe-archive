# Coordinate-Aware Route My List Ordering

## Goal

Replace Route My List's aisle-code ordering with a store-specific route that starts and ends at a Walmart map entrance and minimizes straight-line map distance between resolved list-item pins.

## Constraints

- Work on all supported stores without bundled floorplans, hand-traced walkways, or store-specific configuration.
- Use only map data Walmart already delivers to its Android app.
- Do not attempt shelf-aware or obstacle-aware pathfinding.
- Keep the existing native Route My List map, cards, check-off behavior, and line rendering.
- Preserve natural aisle-code ordering when required map geometry is unavailable.

## Data Sources

The native in-store map exposes the required geometry after it loads:

- `SelectedMapArea.pins[].pinRect.center` supplies an `(x, y)` center for every rendered list-item pin, keyed by its zone, aisle, and section.
- `MapDataReadyPayload.pointsOfInterest` supplies named point-of-interest rectangles. Their center is computed from `minX`, `maxX`, `minY`, and `maxY`.
- Entrance candidates are point-of-interest records whose name or internal name identifies an entrance. Exit-only POIs are excluded unless no entrance marker is present.

No network request is introduced and no geometry is persisted beyond the open Route My List session.

## Ordering

1. Open the native Route My List map with the complete resolved-item set, as today.
2. Wait briefly for both map metadata and rendered pin rectangles.
3. Match rendered coordinates back to route items using zone, aisle, and section; duplicate location keys retain their original relative order.
4. For each candidate entrance, solve a closed route: `entrance -> every mapped list item -> same entrance`.
5. Use Euclidean distance in Walmart's map coordinate space as the route cost.
6. For short lists, evaluate an exact route order. For longer lists, seed with nearest-neighbor ordering and improve it through deterministic local swaps/reversals.
7. Choose the entrance and order with the lowest total cost, replace the active pin order, and rerender the existing mounted map and carousel in place.

The entrance is deliberately both the start and end of the optimization, matching the requested main-entry shopping trip model. This is a routing heuristic, not walking directions; connectors can cross shelves where Walmart has not provided pedestrian topology.

## Fallbacks and Stability

- If no entrance candidate, pin coordinate, or sufficient unique item coordinate is available, preserve the current natural alphanumeric aisle sort.
- Items with no coordinate remain after ordered items, in their current natural-aisle order.
- Do not reopen the fragment or WebView to apply an order.
- Ignore late, stale, or incomplete map callbacks so the route is reordered at most once per route session.
- If future Walmart releases rename private fields, route opening remains functional with the aisle-order fallback.

## Verification

- Unit-test route ordering with synthetic entrance and pin coordinates, including a layout where alphanumeric aisle sorting would zig-zag.
- Test closed-loop entrance selection, duplicate coordinates, partial pin resolution, and geometry-unavailable fallback.
- Build the patch bundle and verify its generated patch list.
- Deploy to the connected phone and confirm an affected list reorders after the map's initial pin render without reopening the map.

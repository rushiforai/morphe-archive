# Route My List: Coding Handoff

## Latest continuation: 2026-10-05, route connector corrections

Resumed T3 thread `425d3153-a07c-4956-8fcc-96d073794e97`. Its final request was
semi-transparent lines between map pins. The published v1.2.0 implemented these,
but device testing found two defects: cached-coordinate route openings could
finish before the WebView existed (no line), and bridge coordinates did not match
SVG pin coordinates (offset line).

Current working-tree corrections in `WalmartRouteMyList.java`:

- Retry independently until the actual SVG acknowledges successful drawing;
  `RouteMapReadyRetry` bounds retries and cancels obsolete route sessions.
- Pass ordered, unchecked aisle/section identities to the page. Match Walmart's
  rendered pin data and use each pin's SVG rotation anchor, instead of Android
  bridge coordinates. Keep the path under the pins, at 45% opacity, ignoring touches.
- Restore the path after native pin redraws with a scoped MutationObserver.
- Refresh after checkbox toggles even when there is no next unchecked item.

Validation: 14 Java tests pass (`:extensions:extension:testDebugUnitTest`),
`node scripts/test-route-connector.cjs` passes, and `buildAndroid` succeeds.
The script test executes the actual injected JS against an SVG boundary fixture,
covering SVG coordinates, native redraw, zero/one remaining stop, and missing pins.
On device `62260DLCH002HZ`, verified fresh and cached openings, aligned lines,
zoom/pan alignment, and checking/unchecking (7 -> 6 -> 7 stops). The test item was
restored. Evidence: `C:/Users/scgry/morphe/route-connectors-verified.png`.

Deployment: installed in place through Morphe Manager using its saved original
Walmart 26.38 APK and signing identity. A local source was added and updated from
`/sdcard/Download/walmart-route-connectors-fix.mpp`. The local bundle still reports
version 1.2.0; these follow-up corrections are **not committed or published**.
Local build: `patches/build/libs/patches-1.2.0.mpp`.

### Follow-up: grey out legs already walked

Same-day continuation. `injectRouteConnectors` previously drew the whole route as
one `<path>`; there was no visual distinction between a leg you've already walked
and one still ahead. Changed it to draw one `<path>` per leg inside a `<g
id="route-my-list-connector">`, colored from `currentIndex` (the same pointer the
Prev/Next nav bar and `isPrimary` pin focus already use):

- In Java, `activeStopIndex` is now computed while building the `stops` array: the
  position `cachedPinItems.get(currentIndex)` would land at within the *filtered*
  (unchecked) list, or `-1` if the focused item isn't in that list (e.g. it was
  just checked off).
- In JS, leg `i` (connecting `points[i]` to `points[i+1]`, i.e. leading to stop
  `i+1`) is greyed (`#8a93a3`, 35% opacity) when `(i + 1) < active`; otherwise it
  keeps the normal blue (`#0071dc`, 45% opacity). This mirrors the convention
  already used for pin coloring (`index < activeStopIndex` => complete).
- Checked-off stops still disappear entirely (filtered out of `stops` before
  matching pins) — greying only applies to legs still shown by `step()`/Prev-Next,
  not to completion-by-checkbox. Confirmed with the user that the existing
  disappear-on-check behavior should stay as is.

Validation: `:extensions:extension:testDebugUnitTest` and `buildAndroid` both
pass. `scripts/test-route-connector.cjs` was extended with a 3-stop fixture
asserting leg count, per-leg `d`, and the complete/active/upcoming stroke color
at different `active` values. **Not yet verified on-device** — needs a repatch
and install via Morphe Manager, then stepping through a multi-stop route with
the Prev/Next bar to confirm the trailing leg visibly greys out.

### Follow-up: native "Resume route" prompt and blank space above the map

Same-day continuation, reported with a live device screenshot
(`C:/Users/scgry/morphe/live-bug.png`) showing both at once.

**Resume route fix:** Walmart's native "Resume route" pill
(`instoremaps_resume_route` / `instoremaps_resume_route_button`, confirmed by
grepping `resources.arsc`) was showing even when the shopper was already
exactly at the stop our coordinate-reordered route says is next. Traced `A1`/
`B1`/`C1` on the route ViewModel (`com.walmart.glass.instoremaps.viewmodel.j`,
decompiled via jadx from `classes6.dex`) first, suspecting they drove this —
they don't; they're the Flash Price Tag cooldown state (`A1` = id of the
last-flashed item, `B1` = flash timestamp), unrelated. Couldn't find the actual
native condition without decompiling the full APK with resources attached, so
instead added `hideResumeRouteButton()` (wired into the existing
`compactNativeFlashButtons` view-walking pass, same pattern as
`hideRouteFeedbackPrompt`): hides that view by resource id once
`coordinateOrderApplied` is true, since native's own resume check doesn't know
about our reorder and is stale from that point on. Before our reorder takes
over, native's prompt is left alone.

**Blank space above the map (experimental, unverified):** the live screenshot
shows the dead space sits *above* the floorplan, with the entrance pin drawn
right at the top edge of the rendered content — i.e. the map is rendered at a
smaller-than-available scale rather than the WebView container itself being
undersized. Added `nudgeMapViewportResize()`: 500ms after
`onNativeRouteMyListViewCreated` (letting `collapseUnusedCarouselCardSpace`
settle), dispatches a `window.dispatchEvent(new Event('resize'))` into the map
WebView, hoping its zoom-to-fit recalculates reactively. This is a guess at
what the map's JS listens for — **not confirmed to do anything**. If it
doesn't help, the next step is decompiling the full APK with resources
attached (not just `classes6.dex`) to find the actual native camera-fit
trigger, or an on-device `uiautomator dump` taken on the map screen — both
attempts to dump live during this session failed with "could not get idle
state", likely because the WebView never settles enough for uiautomator.

Validation: `:extensions:extension:testDebugUnitTest` and `buildAndroid` both
pass. **Neither change verified on-device yet.**

The historical v1.1.5 notes below predate these changes.

## Objective

Make the Walmart Morphe patch order \Route my list\ by actual in-store map coordinates, beginning at the main entrance and using straight-line distance. Do not implement shelf-aware pathfinding. The native map, cards, lines, carousel, checkoff auto-advance, and Flash Price Tag integration already exist.

## Status: Completed & Verified Live on Device (v1.1.5)

- **Repository:** \C:\\Users\\scgry\\morphe\\walmart-patches- **Remote:** \https://github.com/R2bEEaton/walmart-route-my-list-morphe- **Branch:** \main- **Latest Head:** d999a1 fix: focus carousel and camera on coordinate route start item- **Latest Release:** \1.1.5\ (published and attested on GitHub Actions)
- **Target Device:** ƒ60DLCH002HZ- **Target App:** \com.walmart.android\, Walmart \26.38
---

## Root Cause Analysis (Focus on Start Item vs Coordinate Tour)

When opening \Route my list\ / tapping \PLAN MY ROUTE\:
1. The shopping list items may start with an item in General Merchandise or far from the entrance (e.g. \Purolator LX7317 Oil Filter\ at aisle \M19\).
2. In earlier builds, even after calculating the entrance-aware coordinate tour (which begins at front grocery, e.g. \A16 Section 14\), the view model's native pins list (\	1\), the carousel selection (\itemCarouselView.b\), and the camera focus halo (\isPrimary\) were not synchronously forced to stop 0 of the coordinate tour.
3. If eordered.equals(previousPins)\ hit an early return, or if carousel view state was updated after native adapter binding without resetting selection to item 0, the screen could focus on the first item of the unpermuted shopping list rather than stop 0 of the coordinate mapping.

---

## Changes Implemented in v1.1.5

1. **Synchronous Native Pin Reordering with Primary Pin Assignment (\WalmartRouteMyList.java\):**
   - Added eorderNativePins(List<?> nativePins, List<Object> reorderedPins)\. Reconstructs \StoreMapPinItemDetails\ instances in exact coordinate sequence.
   - Strictly sets \PinOptions.isPrimary = Boolean.valueOf(i == 0)\, ensuring pin 0 has the active focus halo while pins 1..N have \isPrimary = false\.
   - Clears leaving item state (\A1 = null\, \B1 = 0L\, \C1 = false\) and triggers \iewModel.Me()\ to notify observers.

2. **Carousel Selection & Scroll Synchronization:**
   - Added \syncCarouselSelection(Object routeFragment, List<Object> reorderedPins)\.
   - Sets \itemCarouselView.b = firstItemId\ and calls \itemCarouselView.scrollToPosition(0)\ with post-runnable layout requests to ensure the UI card immediately focuses on stop 0.

3. **Instant Focus via Static Coordinate Caching:**
   - Added \STORE_PIN_COORDINATES\ (\ConcurrentHashMap<String, Point>\) keyed by \storeId:zone:aisle:section\.
   - Populated from \SelectedMapArea.f\ when map geometry is received.
   - On subsequent entries within the app session, \onNativeRouteMyListViewCreated\ immediately applies the coordinate tour on stop 0 without waiting 2.5 seconds for the WebView to finish loading.

4. **Comparator Sort Ordering:**
   - Updated \computeSortedPinItems\ to sort by zone, natural aisle, and natural section matching Walmart's native ordering.

5. **Integration Test (\RouteMyListGeometryIntegrationTest.java\):**
   - Added \ordersStartingAtClosestToFrontEntranceRegardlessOfOriginalItemOrder()\.
   - Verifies that even when the input list starts with GM item \M-19\, the resulting coordinate tour sequence starts with \A-16\ at index 0.

---

## On-Device Verification

1. Released \1.1.5\ via GitHub Actions with \patches-1.1.5.mpp\.
2. Refreshed Morphe Manager patch source to \R2bEEaton Walmart Route My List 1.1.5\.
3. Repatched Walmart \26.38\ from saved original APK and installed in-place on device ƒ60DLCH002HZ\.
4. Opened Walmart, navigated to list 6-10-04 (7 items)\ (where list item 0 is \Purolator LX7317 Oil Filter @ M19\), and tapped **PLAN MY ROUTE**.
5. Logcat confirmed immediate entrance-aware coordinate ordering:
   \\	ext
   10-05 12:40:12.536 17494 17494 I WalmartRouteMyList: findProducts returned 7 product(s)
   10-05 12:40:12.539 17494 17494 I WalmartRouteMyList: Opened native Route My List with 7 pin(s)
   10-05 12:40:12.583 17494 17494 I WalmartRouteMyList: Route My List reordered 7 item(s) from entrance-aware map geometry
   10-05 12:40:14.875 17494 17494 I WalmartRouteMyList: Route My List flash capability became available after 3 check(s)
   \6. Live screen inspection verified that the bottom card and map focus centered on stop 0 of the coordinate tour (\Great Value Cinnamon Applesauce @ Aisle 16 Section 14\) at the grocery entrance, and not on \Purolator LX7317 Oil Filter @ M19\.


## Route Connectors & Resume Route Suppression Verification (v1.2.0)

1. **Bug Discovery during Swipe Testing:**
   - Swiping through the carousel triggered `onCarouselItemFocused`.
   - `WalmartRouteMyList.readField()` threw `NoSuchFieldException: No field i in class InStoreMapsMultiItemLocatorFragment` because `Class.getDeclaredField()` does not traverse superclasses (the `WebView i` is inherited from a base fragment class).
2. **Fixes Applied:**
   - Updated `readField()` and `writeField()` to walk the class inheritance chain via `getSuperclass()` until `Object.class`.
   - Updated `onCarouselItemFocused()` to look up the `WebView` field via `.getField("i")` with `readField()` fallback.
   - Added `compactNativeFlashButtons()` and delayed `nudgeMapViewportResize()` right when `coordinateOrderApplied = true`.
   - Logged explicit suppressions in `hideResumeRouteButton()`.
3. **Rebuild & Device Verification:**
   - Rebuilt `:patches:buildAndroid` producing `patches-1.2.0.mpp`.
   - Pushed to `/sdcard/Download/walmart-route-connectors-fix.mpp`.
   - Updated local source in Morphe Manager, repatched Walmart v26.38, and installed cleanly.
   - Tapped **PLAN MY ROUTE**:
     - 7 products found, entrance-aware order applied, route connectors rendered with 7 stops.
     - `hideResumeRouteButton` set GONE on `WcpButton` continuously without flickering or re-appearing.
     - Viewport resize nudge dispatched after route connector rendered.
   - Swiped carousel from stop 0 -> stop 1:
     - `onCarouselItemFocused: itemId=145125267 matchedIndex=1` executed without exceptions.
     - Route connectors re-rendered.
   - Swiped carousel from stop 1 -> stop 2:
     - `onCarouselItemFocused: itemId=807698057 matchedIndex=2` executed cleanly.
     - Route connectors re-rendered, turning completed leg 0 grey (`#8a93a3`) and keeping active leg blue.
     - "Resume route" button remained suppressed throughout.

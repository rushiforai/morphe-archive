# Route My List navigation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add native blue-dot-to-next-stop navigation, safe faint connectors for remaining stops, and automatic carousel progression after check-off.

**Architecture:** Keep Walmart's `InStoreMapsMultiItemLocatorFragment` and its view model authoritative. Add a small route-state bridge that observes native carousel/check state, a Compass adapter that selects the next stop only when Walmart reports live routing, and a coordinate-based connector adapter that uses the WebView bridge rather than a screen overlay. The connector layer fails closed when its protocol or coordinates are unavailable.

**Tech Stack:** Kotlin Morphe bytecode patches; Java Android extension; Walmart Android 26.38 internal map/Compass bridge; ADB device validation.

**Spec:** `docs/superpowers/specs/2026-10-04-route-my-list-navigation-design.md`

## Global Constraints

- Do not calculate paths around shelving, infer a floor plan, or replace Walmart's location/navigation service.
- Use Walmart's native Compass blue-dot route only when it reports availability.
- Draw remaining-stop connectors only through the native map-coordinate/custom-route layer; never use DOM injection or a fixed Android screen overlay.
- Missing, renamed, failed, or multi-floor route data must fail closed: preserve native pins and map behavior.
- Preserve the existing flash control, item card photos/sections, feedback-prompt removal, and native map lifecycle.
- The repository has no executable unit-test harness for the reflection extension; the user previously authorized build/package/device validation in place of TDD for this patch.

## Review Focus

- Compass unavailable: the next item remains selected and the map stays usable with connector fallback or pins only.
- Native custom-route error / unrecognized bridge payload: remove only the custom connector, never the pin map or live route.
- Checked item in the middle of the route: advance to the next later unchecked item, not a checked neighbor.
- Last remaining item checked: do not wrap to a completed card or recreate the map.
- Floor change or map reload: discard stale connector coordinates before rendering new ones.

---

## File structure

- Modify `patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt` to hook the map bridge and native carousel state at stable lifecycle points.
- Modify `extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java` to coordinate route state, Compass selection, bridge payload parsing, connector rendering, and carousel progression.
- Create `docs/superpowers/notes/2026-10-04-route-map-bridge-protocol.md` to record the verified Walmart 26.38 coordinate and custom-route payloads used by the patch.

### Task 1: Verify and expose the native map-route bridge

**Files:**
- Modify: `patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt`
- Modify: `extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java`
- Create: `docs/superpowers/notes/2026-10-04-route-map-bridge-protocol.md`

**Interfaces:**
- Consumes: active `InStoreMapsMultiItemLocatorFragment`, its mounted `WebView`, and raw `DeviceBridge.postMessage(String)` payloads.
- Produces: `onRouteMapBridgeMessage(String payload)`, `RouteMapProtocol` capability data, and `clearConnectorRoute()` / `renderConnectorRoute(List<RoutePoint>)` operations.

- [ ] **Step 1: Add diagnostic-only bridge interception**

Hook `com.walmart.glass.instoremaps.j.postMessage(String)` and forward its string argument to `WalmartRouteMyList.onRouteMapBridgeMessage(String)`. Log only `PINS_XY_RENDERED`, `CUSTOM_ROUTE_ERROR`, map-ready, and floor-change payloads under the existing `WalmartRouteMyList` tag.

- [ ] **Step 2: Build, package, install, and capture real bridge payloads**

Run: `./gradlew.bat :patches:build`, then the existing Morphe `patch --install 62260DLCH002HZ` command; open Route My List and capture `adb logcat -s WalmartRouteMyList` while the map renders and pans.

Expected: a documented payload containing each pin's stable identifier, map-local coordinates, and the precise custom-route request/clear message or an explicit proof that this build does not expose one.

- [ ] **Step 3: Record the verified protocol**

Write the exact field names, coordinate space, command type, and error payload in `docs/superpowers/notes/2026-10-04-route-map-bridge-protocol.md`. Do not guess names from decompiled types.

- [ ] **Step 4: Implement the capability-gated `RouteMapProtocol` adapter**

In `WalmartRouteMyList.java`, implement private static methods `RouteMapProtocol parseRouteMapProtocol(String payload)`, `void renderConnectorRoute(List<RoutePoint> points)`, and `void clearConnectorRoute()`. Use the exact verified `sendMessage(...)` protocol and make every malformed/unknown payload call `clearConnectorRoute()` and return.

- [ ] **Step 5: Verify bridge failure behavior**

With an intentionally absent/unsupported custom-route capability, open Route My List and confirm the normal native pins remain, no connector is drawn, and no crash appears in logcat.

- [ ] **Step 6: Commit**

```powershell
git add patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java docs/superpowers/notes/2026-10-04-route-map-bridge-protocol.md
git commit -m "Trace Route My List map bridge"
```

### Task 2: Render remaining-stop connector fallback

**Files:**
- Modify: `extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java`

**Interfaces:**
- Consumes: `RouteMapProtocol`, ordered native `StoreMapPinItemDetails`, current checked state, and map-local pin coordinates.
- Produces: `refreshRouteVisuals(Object routeFragment)` and a faint blue connector for ordered unchecked points on one floor.

- [ ] **Step 1: Implement connector point selection**

Add `private static List<RoutePoint> remainingUncheckedRoutePoints(Object routeFragment)`. It must preserve the native route order, omit checked items, start at the current selected item, and reject coordinates from a different floor.

- [ ] **Step 2: Implement refresh and clear semantics**

Add `private static void refreshRouteVisuals(Object routeFragment)`. It calls `renderConnectorRoute` only with at least two same-floor points and otherwise calls `clearConnectorRoute`. Re-run it after pin render, map-ready, selection change, floor change, and native custom-route error.

- [ ] **Step 3: Verify connector rendering on device**

Open a multi-item route whose remaining pins resolve on one floor. Verify the faint blue line joins stops in carousel order, stays aligned through pan/zoom, and disappears rather than drifting after a floor change or custom-route error.

- [ ] **Step 4: Commit**

```powershell
git add extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java
git commit -m "Render Route My List connector fallback"
```

### Task 3: Select the native Compass route to the current stop

**Files:**
- Modify: `patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt`
- Modify: `extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java`

**Interfaces:**
- Consumes: selected native carousel item and Walmart Compass availability (`blueDotState` plus `routeLineState`).
- Produces: `private static void refreshCompassDestination(Object routeFragment, String itemId)`.

- [ ] **Step 1: Identify the existing Compass selection path**

Trace the native `NavigateClicked(itemId)` event and the map selection callback in the 26.38 build. Hook or invoke that verified path; do not synthesize GPS data, route geometry, or analytics events.

- [ ] **Step 2: Implement `refreshCompassDestination`**

When Compass availability is true, select the current carousel item's native pin through the verified path. When false, perform no Compass action and leave `refreshRouteVisuals` to draw the fallback connector/pins.

- [ ] **Step 3: Verify native live-navigation behavior**

In a Compass-capable store session, select different carousel items and verify Walmart's blue-dot line targets the selected stop. Outside that state, verify no extra navigation control or error is shown.

- [ ] **Step 4: Commit**

```powershell
git add patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java
git commit -m "Route Compass to current list stop"
```

### Task 4: Advance after native check-off

**Files:**
- Modify: `patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt`
- Modify: `extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java`

**Interfaces:**
- Consumes: the native `CheckboxToggled(itemId)` event and post-update carousel state.
- Produces: `private static void advanceToNextUnchecked(Object routeFragment, String completedItemId)`.

- [ ] **Step 1: Add a post-checkbox hook**

Hook after `InStoreMapsMultiItemLocatorFragment` receives the native checkbox update (not before the mutation). Forward the completed item ID and fragment to `WalmartRouteMyList.onNativeRouteItemChecked(Object, String)`.

- [ ] **Step 2: Implement `advanceToNextUnchecked`**

Read the refreshed native carousel list. Starting immediately after `completedItemId`, choose the first unchecked item; wrap once to the first unchecked item. If none are unchecked, leave the native completed state unchanged. Set focus through the carousel's verified native focus/selection API, then call `refreshCompassDestination` and `refreshRouteVisuals`.

- [ ] **Step 3: Verify progression cases on device**

Check an item in the middle, the last active item, and the final remaining item. Confirm no map reload, correct next unchecked card, checked pin removal from connectors, and stable completion behavior.

- [ ] **Step 4: Run full build and package verification**

Run: `./gradlew.bat :patches:build` and the Morphe patch/install command against Walmart 26.38.

Expected: build succeeds, patch reports `Applied: Route My List`, and Android reports the updated package timestamp.

- [ ] **Step 5: Commit**

```powershell
git add patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java
git commit -m "Advance Route My List after check-off"
```

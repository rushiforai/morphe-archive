# Coordinate-Aware Route My List Ordering Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Order Route My List stops from store-specific map coordinates and entrance locations instead of aisle labels.

**Architecture:** Add a pure Java route optimizer for entrance-anchored Euclidean closed tours. The reflection-based map integration waits for Walmart's native `MapDataReadyPayload` and `SelectedMapArea` callbacks, converts their POI and pin rectangles into optimizer inputs, then rerenders the mounted map once with the improved order.

**Tech Stack:** Java 8, Android reflection, Walmart in-store map models, JUnit 4, Gradle/Morphe Patcher.

**Spec:** `docs/superpowers/specs/2026-10-04-coordinate-route-order-design.md`

## Global Constraints

- Do not bundle floorplans, create store-specific mappings, or trace walkable shelf paths.
- Use only coordinates returned by Walmart's mounted in-store map.
- Optimize a closed route: chosen entrance → mapped stops → same entrance.
- Keep map and WebView updates in place; never recreate the map to apply an order.
- Fall back to existing natural aisle ordering whenever geometry is missing or incomplete.
- Keep reflection failures non-fatal and leave native map behavior functional.

## Review Focus

- Missing or renamed private map fields preserve aisle ordering; Task 2 tests unavailable geometry.
- Multiple entrances choose the lowest complete-loop cost; Task 1 tests this.
- Duplicate pin centers retain original order; Task 1 tests this.
- A delayed callback cannot reorder a newer session; Task 2 tests one-shot/session gating.
- Large lists use deterministic heuristic output; Task 1 tests this.

---

### Task 1: Pure coordinate route optimizer

**Files:**
- Create: `extensions/extension/src/main/java/app/template/extension/extension/RouteOrderPlanner.java`
- Create: `extensions/extension/src/test/java/app/template/extension/extension/RouteOrderPlannerTest.java`
- Modify: `extensions/extension/build.gradle.kts`

**Interfaces:**
- Produces `RouteOrderPlanner.Point`, `Stop`, `Entrance`, and `Result` value types.
- Produces `RouteOrderPlanner.optimize(List<Entrance>, List<Stop>) -> Result?`; null means retain aisle ordering.
- Task 2 consumes the ordered original indexes to reorder `cachedPinItems`.

- [ ] **Step 1: Write failing closed-loop optimizer tests**

Create JUnit tests proving: a coordinate layout whose natural aisle order zig-zags is reordered into the shorter closed route; two entrances are selected by total loop cost; duplicate centers preserve original-index order; and a list larger than `EXACT_STOP_LIMIT` has deterministic complete output.

- [ ] **Step 2: Run the test to verify it fails**

Run `./gradlew :extensions:extension:test --tests app.template.extension.extension.RouteOrderPlannerTest`.

Expected: FAIL because `RouteOrderPlanner` does not exist.

- [ ] **Step 3: Implement the smallest optimizer**

Add JUnit 4.13.2 to the extension test configuration. Implement `optimize` with Euclidean costs, every entrance as a closed-tour anchor, exact bit-mask dynamic programming through 12 stops, and deterministic nearest-neighbor plus 2-opt for longer lists. Tie-break equal costs by entrance id then original index.

- [ ] **Step 4: Run the focused test to verify it passes**

Run `./gradlew :extensions:extension:test --tests app.template.extension.extension.RouteOrderPlannerTest`.

Expected: PASS.

- [ ] **Step 5: Commit Task 1**

Stage only the Task 1 build file, production class, and test; commit `feat: optimize Route My List by map coordinates`.

### Task 2: Native geometry capture and in-place reorder

**Files:**
- Modify: `extensions/extension/src/main/java/app/template/extension/extension/WalmartRouteMyList.java`
- Modify: `patches/src/main/kotlin/app/template/patches/walmart/RouteMyListPatch.kt` only if a verified callback hook is required.
- Create: `extensions/extension/src/test/java/app/template/extension/extension/RouteMyListGeometryIntegrationTest.java`

**Interfaces:**
- Consumes `RouteOrderPlanner.optimize` from Task 1.
- Consumes `SelectedMapArea.pins[].pinRect.center` and `MapDataReadyPayload.pointsOfInterest`.
- Produces `tryApplyCoordinateRouteOrder(Object routeFragment, long routeSessionId) -> boolean`, which mutates active pins once or returns false while preserving fallback order.

- [ ] **Step 1: Write failing geometry and fallback tests**

Test reflection-independent helpers: POI-center calculation from min/max bounds; entrance-name/internal-name filtering that rejects exit-only labels; pin matching by zone/aisle/section; unmatched pins retained after ordered pins; and no mutation when an entrance or required pin center is missing.

- [ ] **Step 2: Run the integration test to verify it fails**

Run `./gradlew :extensions:extension:test --tests app.template.extension.extension.RouteMyListGeometryIntegrationTest`.

Expected: FAIL because extraction and one-shot reorder helpers do not exist.

- [ ] **Step 3: Implement geometry capture and session-safe reorder**

When a route begins, increment a route-session id and clear `coordinateOrderApplied`. Read the route fragment's native map view model after it receives map-ready metadata and pins-rendered state. Convert POI rectangles and pin centers to planner inputs, reorder only coordinate-resolved `cachedPinItems`, call the existing mounted-map rerender/card-update path, and mark the session applied. Any missing field, bad coordinate, incomplete match, stale session, or duplicate callback returns false and preserves the existing order.

- [ ] **Step 4: Add only a verified bytecode hook if the existing fragment hook cannot observe map-ready state**

Fingerprint the smallest real map-ready or pins-rendered method needed by Step 3. Do not add a second map screen or modify unrelated navigation.

- [ ] **Step 5: Verify integration and extension build**

Run `./gradlew :extensions:extension:test :extensions:extension:build --no-daemon`.

Expected: PASS with both test classes green and the extension artifact built.

- [ ] **Step 6: Commit Task 2**

Stage only the extension source, required patch hook, and geometry test; commit `feat: order Route My List from native map geometry`.

### Task 3: Bundle and device verification

**Files:**
- Modify: none unless Task 2 verification exposes a supported-version fingerprint mismatch.

**Interfaces:**
- Consumes the completed patch and the existing connected-phone deployment flow.
- Produces a built `.mpp` and a verified device install.

- [ ] **Step 1: Build the complete bundle**

Run `./gradlew :patches:build generatePatchesList --no-daemon`.

Expected: PASS and `patches-list.json` contains Route My List.

- [ ] **Step 2: Deploy to the connected Android phone**

Use the established project deployment script. Confirm the intended ADB device is connected and the installed package timestamp advances.

- [ ] **Step 3: Verify coordinate order on device**

Open a separated-area list. After native pins load, confirm the carousel changes once to an entrance-returning lower-distance order, the map remains mounted, the card remains synchronized, and check-off still advances to the next item.

- [ ] **Step 4: Verify fallback behavior**

Confirm through device logs or the integration test that missing geometry keeps the natural aisle order without crashing or opening a new map.

- [ ] **Step 5: Commit a verification-only fix separately if needed**

Stage only changed fix files and commit `fix: stabilize coordinate route ordering`.

# Google Maps 26.44.06: why map pins vanish during navigation

Date: 2026-11-12. Static analysis only (jadx + dexdump of the 26.44.06 base APK `classes*.dex`). No device, emulator or Frida.
Names are obfuscated names in this build and will change between versions. The structural anchors listed below are the parts meant to carry over.

Labels: **Observed** means read directly in bytecode or decompiled code. **Inferred** means reasoned from what was observed. **Unknown** means not settled statically.

## 1. The generator, its switch and its setter

**Observed.** The string `"PersonalPlaceLabelGenerator.onUpdateLabels"` occurs exactly once, in `apuj.run()`. `apuj` is a package-private `final class apuj implements Runnable`, and it is the class `mapMarkersPatch` resolves as "the generator":

| Role | Method | Behaviour |
|---|---|---|
| place setter `(ImmutableList)V` | `apuj.c` | stores the list in field `e`, schedules `run()` |
| changed flag `(Z)V` | `apuj.b` | `f |= z` |
| on/off switch `(Z)Z` | `apuj.h` | if `b != z`: `b = z`, schedule `run()`, return true |
| search filter `(Z, ImmutableList)V` | `apuj.g` | when on, only places whose id is in the list are drawn |
| tile list `(List)V` | `apuj.e` | visible tiles, fed by the camera listener `apui` (`"PersonalPlaceLabelGenerator.onCameraUpdate"`) |

When `run()` sees `b == false`, it removes every label it has drawn (`apuk.k` IdentityHashMap → `ayuz.a()`) and returns. With `b == true` it builds labels per tile from `e`.

**Observed.** The owner is `apuk`. Its log tag is `awrs.PERSONAL_PLACE_LABEL_GENERATOR`, and `apuj` is its field `e`, created in `apuk.<init>` as `new apuj(this)`:
- `apuk.b()` (enable): `if (e.h(true))`, then it registers the event subscriptions (`aqsk` places event, `avpj`), the camera listener and two `gsl` observers.
- `apuk.a()` (disable): `if (e.h(false))`, then it unregisters them.
- `apul` handles event `aqsk`. It sets `apuk.g = aqsk.c()`, then calls `apuj.b(changed)` followed by `apuj.c(aqsk.c())`. This is Maps' only caller of the place setter.

**Observed.** The controller is `bubg`, a merged class with fields `boolean a` and `Object b = new apuk(...)`:
- `bubg.k()`: `a = true; apuk.b()` (create)
- `bubg.l()`: `a = false; apuk.a()` (destroy)
- `bubg.m(boolean z)`: `if (a) { z ? apuk.b() : apuk.a() }` (visibility toggle while created)

Two controllers exist:
- **Phone:** `aprq`, an `aiti` veneer whose `bsbd` name is `"PersonalPlacesBasemapVeneer"`. `aprq.nX()` (onCreate) calls `bubg.k()` and `aprq.nY()` calls `bubg.l()`. `aprq.e(z)` calls `bubg.m(z)`, and `aprq.f(z, list)` calls `apuk.c` (the search filter).
- **Car:** `rxc.dv` (`"MapManagerModule.providesPersonalPlaceLabelController.get"`), driven by the car `MapManager` `ras`. `"MapManager.onCreate() - personal place labels"` calls `bubg.k()`, and onDestroy calls `bubg.l()`.

### Who turns it on

**Observed.**
- **Phone:** `nbp` case 9, the `"StartupVeneerScheduler create map-dependent post-startup veneers"` step, calls `aith.b(54)`, which is `aprq`. It is scheduled from `cwdl.au()` on milestone `azrv.c`, and its only guard is `aith.d()` (activity created). Creating the veneer runs `nX()`, then `bubg.k()`, then `apuk.b()`, then `apuj.h(true)`.
- **Car:** `ras` MapManager onCreate calls `bubg.k()`.
- **Re-enable:** `bubg.m(true)` comes from `xyh.q(...)` when directions polylines are cleared (gated on `aylf.f()`), and from `alck` when an `albl` state with `h == false` arrives.

No account, sign-in or personal-places layer check appears anywhere on these paths.

### Who turns it off

**Observed.**
1. **Directions and navigation (the cause).** `xyh` is the `DirectionsMapManagerImpl` (its dump prints `"#DirectionsPolylineRendering DirectionsMapManagerImpl:"`, `TripRouteOverlay`, `numIncidentsToRender`). `xyh.n(yeq)` shows a route, and its callback `xyf.a(yeq, aagz)` ends unconditionally with `((bubg) xyh.a.a()).m(false)`. The phone's `xyh` gets the veneer's controller (`aprq.g()` via the `ngw.mk` provider). The car's `xyh` (`rxc.java` `new xyh(..., new onm(..), ...)`) gets the car controller through `onm`. Every time a route is drawn, on the phone or in the car, during preview or active guidance, the generator is switched off. Clearing the route (`xyh.f()`/`g()` → `q()`) switches it back on.
2. **Screens with `GmmPostTransitionState.shouldHidePersonalLabels = true`** (`ndn.q`). `neu` case 2 calls `aprq.e(false)`, or `alck` with `albl.b` calls `aprq.e(false)`. Only non-navigation screens set it (`adeh`, `adqj`, `adwd`, `adxl`, `adzz`, `aebi`, `alnu` chat, `alpn` Ask-Maps overlay, `alhj` web view). The navigation state builder `kxl.f(...)` passes `false`.
3. Lifecycle destroy: `bubg.l()`.

## 2. Signed out, and during navigation

- **Signed out: enabled.** Observed: the enable path has no account gate. Inferred: the account's `aqsk` places event is empty or never arrives, so Maps never calls `apuj.c` itself. Drawing depends entirely on `SavedOnMap.shown(true)` → `refresh()` → `uaRefresh()` → `apuj.c` → `withLocal`.
- **During navigation: disabled by design.** Observed: `xyf.a` calls `bubg.m(false)`, then `apuk.a()`, then `apuj.h(false)`. Our hook `SavedOnMap.shown(gen, false)` removes the generator from `generators`, so `SavedOnMap.refresh()` returns early (`generators.isEmpty()`). `withLocal` and `WazeAlerts.mapItems` are never reached. Even if we called `withLocal`, `run()` with `b == false` only clears labels.
- Inferred: this matches the emulator run exactly. Pins were selected, but no generator was registered while a route was on the map. If navigation was started straight from an intent, Maps may also have hidden the generator before the first coalesced redraw ran. The redraw is posted with a delay, and by the time it runs `generators` can already be empty.
- **Also observed.** While `apuj.g(true, list)` is active, which is search results via `aprq.f` from `aqvf`/`apkl`, only places whose id is in the result list are drawn. Our pins are hidden during a search-results state as well. This is a smaller issue.

## 3. Fix options

### A (recommended): keep the generator visible when Maps hides it for a route; drop Maps' own places in that state

**Hook.** In the controller's visibility toggle `bubg.m(Z)V`, the one path Maps uses for "hide while a route is shown". Create (`k`) and destroy (`l`) stay untouched.

Structural anchors, all reachable from the existing generator resolution:
1. Generator `G` (already resolved): `apuj`.
2. Owner `O`: the type of `G`'s only constructor parameter (`G.<init>(O)V` stores it in a field). Its enable/disable are the two `()V` methods of `O` that invoke `G.<switch>(Z)Z` with `const/4 1` and `const/4 0` respectively (`apuk.b`/`apuk.a`). `O` also has the field of type `G` (`apuk.e`) and the `ImmutableList` field (`apuk.g`) holding the account's unmodified places.
3. Controller `C`: the class whose method `(Z)V` does `iget-boolean` on its own field, `check-cast O`, and invokes both `O.enable` and `O.disable`. Exactly one such method exists (`bubg.m`). As a cross-check, `C` also has the two `()V` methods that `iput-boolean` 1 or 0 and call one of them (`k`/`l`).

**Patch at the start of `C.m`.** It has 3 registers. `v0` is free at entry because the first original instruction overwrites it.
```
invoke-virtual {p0}, C->uaGenerator()Ljava/lang/Object;   # new bridge: ((O) b).e
move-result-object v0
invoke-static {v0, p1}, Lorg/ungoogled/ui/SavedOnMap;->visible(Ljava/lang/Object;Z)Z
move-result p1
```

**Extension: `SavedOnMap.visible(gen, wanted)`.**
- Record `mapsHidden[gen] = !wanted` in a weak identity map.
- Return `wanted || anyPinsFeature()`, where `anyPinsFeature()` is `Shapes.speedCamerasPatched() || Shapes.wazeAlertsPatched()`.
- When it returns true while the generator is already on, `apuk.b()` sees `h(true)` return false, so nothing is re-registered and nothing leaks.
- When Maps re-shows the generator, `visible(gen, true)` clears the flag and calls `refresh()`.

**`withLocal` while `mapsHidden[gen]` is set.** Return only the warning pins: no Local saved and none of Maps' own places. That keeps Maps' intent of a clean route map for personal places.

**`uaRefresh` change.** Point it at the owner's `O.g`, the account list (empty when signed out), instead of `G.e`. Otherwise a navigation-time list that holds only pins would become the "account" list after the route clears. One extra bridge or field read: `G` holds `O` in field `c`.

**Risk.** Low to moderate. The patch adds one prologue and two bridge reads, and leaves the lifecycle alone. The behaviour change is limited to the route-shown state.

Unknown, needs one acceptance check:
- Whether basemap labels added by `buia.f(chtx)` render in the navigation camera and style (`useCarNavStyles`, 3D tilt).
- Whether the per-tile cap `bgdx.as()` or the list visibility filter `apuo` drops pins when a list has no "shown on map" state. Our items already pass `apuo` in browse mode.

The same hook covers the car, because the car `xyh` calls the car controller's `m(false)`. Vela is unaffected.

**Optional.** Handle search the same way: let `withLocal` keep our pins through `G.g(true, list)` by appending pin ids to the filter list (hook `G.g`, `(ZLImmutableList;)V`). This is lower priority.

### B (minimal, coarser): ignore `m(false)` entirely

Patch `C.m` to `p1 = p1 || anyPinsFeature()`, with no `withLocal` filtering. It is simpler, but signed-in microG users would then see their personal places, and Local saved, on the route map during navigation. For Ungoogled with no account, the only effect is that Local saved also stays visible. This is acceptable if the owner prefers it, but it deviates from Maps' design.

### C (not recommended): a different native layer

The nav route overlay (`xyh` → `yba` `TripRouteOverlay`, `numIncidentsToRender`) renders incidents taken from the server's route response protos. They are constrained to the route and need fabricated incident protos and icon ids. That means high churn, and they are fragile across versions. A search-result or pin layer (`ojm`, `bjqr` callouts) is single-selection and is also cleared by navigation transitions. Neither is better than keeping the personal-label generator alive.

## 4. Implemented: option A

**Observed** in the patch source and in the bytecode of the patched 26.44.06 APK (dexdump of the Morphe CLI output, deleted after reading).

- **Anchors**, resolved from the generator `G` (`apuj`) and each required to be unique, or the patch fails with a `PatchException` naming it:
  - Owner `O` (`apuk`): the only parameter of `G`'s only constructor. `G` keeps it in its one field of that type (`apuj.c`).
  - `O`'s generator field (`apuk.e`) and its one `ImmutableList` field, the account's untouched places (`apuk.g`). Both are made public if needed. Both are already public in 26.44.06.
  - `O.enable`/`O.disable` (`apuk.b`/`apuk.a`): the `()V` methods whose only switch call `G.h(Z)Z` takes a literal 1 or 0.
  - Controller `C` (`bubg`): the one non-static `(Z)V` method in the APK whose owner calls are exactly `{enable, disable}`, with a `check-cast O`, one `iget-boolean` and one `iget-object` on its own class. That is `bubg.m`, with created flag `bubg.a` and holder `bubg.b:Object`.
- **Bridge** `C.uaGenerator()Object`: returns `((O) b).e` only while `a` is true and `b instanceof O`, otherwise null. `bubg` is a merged class, so `b` is checked rather than cast blindly.
- **Prologue of `C.m(Z)V`**: `invoke-virtual {p0} uaGenerator`, `move-result-object v0`, `invoke-static {v0, p1} SavedOnMap.visible(Object, Z)Z`, `move-result p1`. Registers: `bubg.m` has 3 registers and 2 ins, so v0 is its only local, with p0 = v1 and p1 = v2. Before the first original instruction no local holds a value. The original code also overwrites v0 first (`iget-boolean v0, v1, bubg.a`). The patch requires at least one local and at most 16 registers.
- **`SavedOnMap.visible(gen, wanted)`**: null `gen` returns `wanted`. Otherwise it records Maps' wish in a weak identity set `hiddenByMaps` and returns `wanted || pinsPossible()`, where `pinsPossible()` = (`Speed cameras` patched and its camera or Flock map pins on) or (`Waze alerts` patched and **Road alerts on the map** on). A change that keeps the generator shown asks for the usual coalesced redraw. `shown(gen, false)` clears the record: the generator really turned off, through destroy or through hiding with no pins possible.
- **`withLocal`**: while `hiddenByMaps` holds the generator, it draws only the warning pins, with no Local saved and none of Maps' places. The pure part is `SavedOnMap.compose`.
- **`uaRefresh`**: it now feeds `G`'s setter `((O) G.c).g`, the account list (empty when signed out), instead of `G.e`. A pins-only list from navigation therefore never becomes the account list after the route clears.
- Create (`k`) and destroy (`l`) are untouched.

**Inferred.** The same hook covers the car, because the car's `xyh` calls the same `bubg.m`. Screens with `shouldHidePersonalLabels` (`aprq.e(false)`, such as chat, the Ask-Maps overlay and web views) now keep the pins and hide Maps' places as well. Pin settings are read at Activity attach. If they are turned on while a route is shown, pins appear with the next `m` call, not at once.

**Known, not fixed.** The search-results restriction `G.g(true, list)` still hides our pins while search results are shown (§2).

**Checks.** The Morphe CLI patched the full 26.44.06 APKM with `Offline saved places`, `Speed cameras` and `Receive alerts from a third-party application` applied. JVM tests: `SavedOnMapTest`.

**Unproven, for the runtime check.** Whether pins render in the navigation camera and style. Whether the per-tile cap or `apuo` drops them in a pins-only list. Whether the car generator exists and draws. That Maps' own saved places disappear on route draw within the 1 s redraw bound and return on route clear.

## Residual unknowns
- Whether `azrv.c` (the post-startup milestone for veneer 54) fires when Maps is cold-started directly into navigation by intent. This does not matter under option A, because `m(false)` is overridden whenever the veneer exists. If the veneer is never created, `bubg.a` stays false and `m` is a no-op, so pins need the veneer first.
- Label rendering in navigation camera and style. This is runtime only.

# Google Maps 26.44.06: drawing warning markers during route preview and navigation

Date: 2026-11-12. Static analysis only: JADX output of the 26.44.06.1006895251 base APK (scratch-only, deleted after reading). No device, emulator, DHU, adb or Frida. Follows [why pins vanish during navigation](2026-11-12-maps-pins-generator.md) and [alert pins from WARNINGS_V1](2026-11-12-maps-alert-pins.md).

Names are obfuscated names in this build. The structural anchors are the parts meant to carry over to other builds.

Labels: **Observed** means read in decompiled code. **Inferred** follows from that code without runtime proof. **Unknown** is not settled statically.

Runtime fact this note starts from (owner's emulator run): with the `bubg.m` override, the personal-place generator stayed on during navigation and received 1–3 pin items, yet nothing was drawn on the navigation map. Google's own route incident icon was drawn.

**Decision (2026-11-12).** The owner chose Path A (§4–§5): Google's own incident report callout, with our own icons. The route-dot marker (`ahdz`, §7) was considered and not built. §9 describes the implementation.

## 1. Why personal-place labels do not draw during navigation

### What the generator actually produces

**Observed.**
- `apuj.run()` builds one `chtx` "paint tile" per visible tile `bkyp`. The tiles come from `apuu.a` through the camera listener `apui`. Each `chtx` holds `chvz` point labels built by `apur.b(...)`. It is then added with `buia.f(chtx)` (client-injected features, `blhv`, or `blie` under GeoXP) and shown with `bjxk.d()`.
- The icon and text styles of these labels are **legend style references, not self-contained styles**. `apup` maps every label kind (DEFAULT, EMOJI, CUSTOM, STAR, HOME…) to `chwl` style ids. `apur.b` writes those ids as `chwg{c = chwl.getNumber()}` extensions (`chwh.c`/`chwh.e`) and through `bgde.ah(apup.n)`. The only inline style is the HOME/WORK `chxf`. The label also carries label flags `chvz.k = 16|17 (|2)`, priority `chvz.l = 100`, a min-zoom value `chvz.m` (`14<<3` for contacts, else 0) and zoom variants `chvx`.
- Style ids resolve against the map's current style table: `blgi.a(bjvp)` → `bjvp.d(id)` → `bkkx.h.d(id)`.
- Navigation switches the map's style. `bjsn` (`MapModeControllerImpl`; its dump prints `carNavStylesEnabled`) selects `blau.NAVIGATION*` when `g` (car-nav styles) is set (`bjsn.b()`). Those modes map to the separate `bkxg`/`ciaw` legends `NAVIGATION`, `NAVIGATION_LOW_LIGHT`, `NAVIGATION_EMBEDDED_AUTO` and others. `ndn` (`GmmPostTransitionState`) carries `useCarNavStyles` for the phone navigation state, and the car `MapManager` `ras` dumps the same flag.
- The point-label factory (`bkqr`, `"LabelFactory.createPointLabel"`) classifies labels into draw planes (`blnf`: `STARS`, `TRAFFIC_INCIDENTS`, `NAVIGATION_ADS`, `SEARCH_RESULT_ICONS`, `PLACEMARK`…). No client-side "hide personal labels in navigation" rule was found there or in `apuo`.

### Assessment

- **Inferred (most likely):** the navigation legend does not define the personal-place style ids, or defines them hidden or zoom-gated at navigation zooms. The labels are then dropped by the renderer, not by Java. The legends are server data and are not in the APK, so this cannot be proven statically.
- **Inferred (secondary):** the labels go through the basemap label collision set at priority 100, against the navigation road and shield labels, in a tilted camera. Google never shows them in navigation (`xyf.a` always calls `bubg.m(false)`), so this placement is untested by Google.
- **Not the cause (observed):** account or sign-in gates, `apuo` (our items already pass it), and the per-tile cap `bgdx.as()` for one to three items. Tilted-camera tiles are handled by `apuu`, with a tile-rect intersection when tilted.
- **Unknown:** which of the two applies. One frame with a single pin at low tilt and high zoom would tell them apart, but neither leads to a cheap fix.

### Cheap flag?

No safe one was found.
- Forcing `bjsn.g` (car-nav styles) off restyles the whole navigation map: road widths, colours and POI density. That is a large visual regression for every user.
- Rewriting `apur` to put inline bitmap styles into per-tile labels touches a 800-line builder, keeps the tile and collision coupling, and is high churn.

**Recommendation:** stop pursuing the label path for navigation.

## 2. Owner decision and scope

The owner decided the solution must use paths Maps already has on by default during navigation:
- Google's own incident and hazard icon path: the barrier/lane-closure icon that rendered next to our invisible pins.
- Secondarily, the route traffic path.

It must be able to show any symbol, ideally our own 19-icon pack. The personal-place generator, search pins and a custom overlay are out of scope. The bitmap point marker (`ahdz`) from the first version of this note counts as a custom overlay under that decision, so it is no longer the recommendation. It appears in §7 only for comparison.

Static fact-finding found **three** Google-owned incident and traffic paths that draw during navigation. All three end in the same incident-callout styler, `ahzj` ("Jamcident callouts").

## 3. Shared renderer: `ahzj`, Google's incident callout ("Jamcident")

**Observed.**
- Anchor strings in `ahzj`/`ahzq`: `"Attempted to use Jamcident Callout background style after it has been destroyed."`, `"… spacer style …"` and `"… text style …"`.
- `ahzj(Context, bjvp styleTable, bjws calloutFactory, boolean night, boolean car, …)`. The `car` flag selects `ahzp.CAR` or `ahzp.PHONE` icon sizes.
- A callout is built as `bjsq b()` → `bjsq.e(map.e(), background, bjwr.a())`, a GL callout (`bjwp`). Its content is an icon chunk plus an optional text chunk (`u(...)`), with position `chvz.h = chsi{c = point}` when a point is given. Placement goes through the callout manager (`bkzu`/`bkzo`, anchors `ahzq.h = [BOTTOM_RIGHT, BOTTOM_LEFT, TOP_RIGHT, TOP_LEFT]`).
- **Icon sources.** This answers the owner's question about where the incident icon comes from. There are three ways to fill the icon chunk:
  1. **Legend sprite by type.** `n(bjsq, chwl)` → `blgi.d(chwl)`, with `chwl e(ckai, night, variant)` mapping the problem type enum `ckai` to a navigation-legend style id. Built-in types (from the `e` switch): `ROAD_CLOSURE`, `LANE_CLOSURE`, `SUSPECTED_ROAD_CLOSURE`, `CRASH`, `CONSTRUCTION`, `JAM`, `STALLED_VEHICLE`, `OBJECT_ON_ROAD`, `POLICE_PRESENCE`, `MOBILE_SPEED_CAMERA`, `SPEED_CAMERA`/`RED_LIGHT_CAMERA`/`RED_LIGHT_SPEED_CAMERA` (two variants), `SPEED_CAMERA_ZONE`/`SPEED_CONTROL_ZONE`, `HEAVY_RAIN`, `HAIL`, `SNOW`, `FLOOD`, `FOG`, `THUNDERSTORM`, `CYCLONE`, `LANDSLIDE`, `EARTHQUAKE` and `CRASH_PRONE_SPOT`. `UNKNOWN_PROBLEM_TYPE`, `UNPAVED_ROAD`, `NARROW_ROAD`, the restrictions, `UNDERPASS` and the deprecated types return `chwl.a`, which means not drawn. Any other value throws.
  2. **Icon URL.** `o(bjsq, url, scale)` → `ahzq.c(url, size, scale)`, an inline `chxf`/`chwc`/`chvf{c = url}` icon style. The URL is resolved by the map resource manager: `bjtk.f` (`"Non-MapCore ResourceManagerImpl.getIconResource"`) and its MapCore twin `bleo`. Both accept `http(s)://`, `//` and **`data:`** URLs, decoding `data:` through Glide; `"SVG format not supported by Glide for data urls"` is logged for `data:image/svg`. Anything else is a relative icon name with the server icon base prepended.
  3. **Bitmap.** `i(bjsq, Bitmap)`/`q(...)` → `cagw.cb(bitmap)` (`blgh`, an inline bitmap style).
- `bjej.c(Bitmap)` produces `"data:image/png;base64,…"`. That is how Google itself turns a `Drawable` into an incident icon URL (§4).

**Answer to the owner's icon question:**
- **(a) Our own bitmap per item: yes.** Through the URL path with a `data:image/png` URL, or the bitmap path. Google itself does this for user-report icons (§4).
- **(b) Registering extra icons into the legend: no.** Legends are server data, and their style ids form a fixed enum (`chwl`).
- **(c) Built-in types only:** this is what happens when a server flag (`cfyq.bE`, §4) selects legend icons. We bypass it per item with one small bytecode patch. The list above is the fallback vocabulary, mapped in §6.

## 4. Path A (chosen): Google's "incident report callout" event

This is the path Maps uses to show an incident icon at a position immediately after the user reports a hazard in navigation. It takes a position and an arbitrary `Drawable`.

**Observed.**
- **Event model.**
  - Abstract `bmtm implements ayui`: `Drawable c()`, `bjpk d()` (position), `bmut e()` (icon URL day/night pair), `ckai f()` (type) and `String g()` (optional label).
  - Concrete event: `bmtn(bjpk, bmut, Drawable, String, ckai)`, the only subclass.
  - Posted on the app event bus `ayue.d(ayui)`. Google's report flow `aicd` posts `new bmtn(point, null, categoryDrawable, label, ckai)`, or with a server icon `bmut`.
  - `ayue` is app-scoped (`njz.af`), so a single post reaches every subscriber.
- **Handler.** `bmti extends ayug`, anchor string `"AddIncidentReportCalloutEvent must have either an iconUrl or a drawable."`. It runs on `aypq.UI_THREAD`.
  1. If a `Drawable` is present: draw it into a square bitmap of `(car ? ahzp.CAR : ahzp.PHONE).d × ceil(density)` px. Then `bjej.c(bitmap)` → `bmut(dataUrl, dataUrl)`.
  2. Create `ahzj` lazily, in car mode when `akvk.E().b()`.
  3. **Icon choice.** `if (awub.aK().bE)` → legend: `ahzj.e(ckai, …)` → `n(...)`, returning without drawing when it is `chwl.a`. Otherwise → `ahzj.o(bjsq, night ? url.b : url.a, scale)`, the data-URL icon.
  4. `ahzj.t(bjsq, 1L, icon, point, null)` assembles the callout. With feature flags on, `t` may append a vote-count text ("1"): **Unknown**.
  5. With a label: an extra tap target. Without one: none.
  6. Set `chvz.m = 112`, then the managed callout `bkzu(calloutManager, bkzo{callout, position = point, priority bkzm.q, anchors ahzq.h})`, `bkzu.g()` (show), and add it to the owner's list `m`.
- **Owner.** `bmth implements bmnk` (a navigation lifecycle component):
  - `f()` subscribes `bmtm` events on `ayue` (`u` field).
  - `g()` unsubscribes, clears and destroys `ahzj`.
  - `a()` clears all: `bkzv.c()` on every element of `m`, then `m.clear()`.
- **Built on phone and car.**
  - Phone: `nns.n()` uses the phone activity graph `ngw`.
  - Car: `nsu.J()`. `nsu` imports `androidx.car.app…`; it is the car graph whose map, measle and directions objects appear in §7.
  - The car navigation controller `prp` holds a `bmth` (`m`) and calls `bmth.a()` on navigation-state transitions (`qgu.se` → `prp` around `0x0696`/`0x06aa`).

**Inferred.**
- These callouts draw in the navigation camera on the phone and the car screen. They are Google's own report-confirmation incident callouts, on the same `ahzj`/callout-manager path as the route incident icon the owner saw.
- They are position-based (explicit `bjpk`), not tied to the route, so off-route warnings also work.
- They persist until cleared. Google clears them only on navigation-state changes, so we must remove ours ourselves.
- **Unknown:** whether `bmth` is subscribed during route preview, or only during active guidance. Its lifecycle is the navigation component's, which suggests guidance only.

### Why not the other two paths as primary

- **Path B, route incidents (`yba` TripRouteOverlay).**
  - Data: `xzf.Q(ycm, ycj, anmw)` picks `cjcb` incidents from the navigation route's traffic proto `cjee` (`ycm.f().o`, set by `ycj.ap(cjee, int)` on trip updates; `bmca` handles `"Trip update failed"`/`REQUERY_*`). They are passed to `new yba(…, list, …)` in `xyq.a` (`"createTripRouteOverlayList"`), only when `yeq.J()`.
  - `yba` turns each `cjcb` into `ahzk` (an along-route callout candidate, `aiad`), positioned by along-route metres: `cjbu.p (cjbs) → cjbo{c = start m, d = length m}` → `ycn.m(start, len)`.
  - `yba.i(Set)` styles them with `ahzj`: legend if `cfyq.bE`, otherwise icon URL from `cjcb.u` (`ydu.k` → `yds.g`). It re-filters on progress (`yba.h(int)`) and rebuilds in `c()`.
  - It is drawable only when the item passes `ahzk.c().i()`, which requires the display proto `cjbs.e (cjbr).d` to be a nonzero legend id.
  - Arbitrary icons are blocked without an extra patch: `yds.b(url)` prefixes `"https:"` onto anything not starting with `http`, which breaks `data:` URLs. Unknown icon variants are also filtered to SVG or PNG.
  - Items are tied to the current route (they need along-route metres), rebuilt with every `yba`, and need fabricated protos (field numbers in §8). Feasible, but more invasive and on-route only.
- **Path C, traffic.**
  - `cjee` field 1 (`cjde{1 distance, 2 seconds, 4 enum}`) feeds the ETA time profile `ahyr.d` in `ycj.aN`. It is not colouring.
  - Route "stretches" `ahis{a start m, b length m, c id, d ahip type, f–j legend chwl styles, k bkzm}` (types include `JAMCIDENT_ROAD_STRETCH_SLOWER_TRAFFIC`, `JAMCIDENT_ROAD_STRETCH_TRAFFIC_JAM`, `JAMCIDENT_VISUALIZATION_JAM_STRETCH` and `HEAVY_TRAFFIC`) enter via `xzf.C(ImmutableList<ahiv{routeId, ahiu{ahiq{routeIndex, list<ahis>}}}>)` and are drawn by `yba.k` as **legend-styled callouts along a route stretch**, not as line colour.
  - Live line colouring comes from the route polyline traffic data when the drive-mode line is built (`xzf` `"DirectionsOverlayManager.createAndRenderLineForDriveMode()"`); I did not trace it.
  - A short coloured segment for an average-speed zone or jam is **Inferred** feasible only through `xzf.C` with a JAMCIDENT stretch type, and it needs valid legend style ids. Treat it as phase 2.

## 5. Patch plan for Path A

### Anchors (26.44.06; each must resolve uniquely, otherwise `PatchException` naming it)

| Role | 26.44.06 | Structural anchor |
|---|---|---|
| Handler `R` | `bmti` | unique string `"AddIncidentReportCalloutEvent must have either an iconUrl or a drawable."`; method `a(ayui)V` |
| Event base `E` | `bmtm` | type of the `check-cast` on the handler parameter; abstract, with `()Drawable`, `()P`, `()U`, `()K`, `()String` |
| Event `C` | `bmtn` | only concrete subclass of `E`; constructor `(P, U, Drawable, String, K)` |
| Point `P` / LatLng `L` | `bjpk` / `bjpd` | `P` from `E`'s point getter; `L` is the type of `P`'s static `(L)P` method (`bjpk.E`), where `L` has a `(DD)V` constructor |
| Type enum `K` | `ckai` | `E`'s enum getter; an enum, so names are kept (`valueOf("OBJECT_ON_ROAD")`) |
| Owner `O` | `bmth` | type of the handler's `check-cast` on its host field; has the `List` field `R` adds the managed callout to (`m`), a `()V` that iterates it calling an interface `()V` and then `List.clear()` (`a`), a `()V` that calls the bus subscribe `(Object, Map)` (`f`), and one that calls unsubscribe `(Object)` (`g`) |
| Bus `B` | `ayue` | type of `O`'s field used by `f`/`g`; post method = the `(ayui)V` method (`d`), the event interface being `E`'s interface |
| Legend flag | `cfyq.bE` | in `R.a`, the only `iget-boolean` whose result branches between a call to the static `(K, Z, Z)chwl` mapper (`ahzj.e`) and the `(bjsq, String, I)` URL method (`ahzj.o`) |

### Bytecode changes

1. **`R.a`, after the legend-flag `iget-boolean vF`:** `invoke-static {vF, p1}, IncidentPins->legend(ZLjava/lang/Object;)Z` and `move-result vF`. For our events this returns false, which forces the `data:` URL path with our bitmap. For Google's events it returns the original value.
2. **`R.a`, after `List.add(managedCallout)` on `O.m`:** `invoke-static {p1, vCallout, vOwner}, IncidentPins->added(Object, Object, Object)V`.
3. **`O.f` and `O.g` epilogues:** `IncidentPins.start(owner, bus)` and `IncidentPins.stop(owner)`.
4. **`O.a` prologue:** `IncidentPins.cleared(owner)`.
5. **Bridges added to `O`:**
   - `static Object uaPost(Object bus, Drawable icon, double lat, double lng, String type)`: `new C(P.E(new L(lat, lng)), null, icon, null, K.valueOf(type))`, then `((B) bus).d(event)`. It returns the event. Label `null` means icon-only, no tap target.
   - `static void uaDrop(Object owner, Object callout)`: invoke the managed-callout interface `()V` used by `O.a` (destroy), then `((O) owner).m.remove(callout)`.

### Extension `IncidentPins`

- Driven by the existing `ExternalTelemetry.updatePins` change detection (at most 1 Hz, `WarningPins.MIN_REDRAW_MS`), posting to the main looper.
- **Live owners.** A weak set of owners, each with its bus. Phone and car each have their own owner. One post reaches both, because the bus is app-scoped, and `added` arrives once per owner.
- **State:** `Map<owner, Map<pinKey, callout>>` plus `pending: IdentityHashMap<event, pinKey>`. `legend(flag, event)` = `flag && event !in pending`.
- **Sync:**
  - new key → `uaPost` with a cached `BitmapDrawable` of the pin's icon from the 19-icon pack, square, about 96 px source, scaled by Maps;
  - removed key → `uaDrop` on every owner holding it;
  - moved or changed key → drop, then post (no move API).
  - The type string is the §6 fallback (used for equality and for the legend fallback).
- **Owner events:**
  - `cleared(owner)` (navigation-state change) and `stop(owner)`: forget that owner's entries, without calling into Maps;
  - `start(owner)`: re-post every current pin.
- **Off:** when the setting is off or the provider disconnects, drop all.
- **Privacy:** coordinates stay in memory and logs carry key, icon and count only. Never set a label (`g()`), so no text is shown and no tap opens a Google report UI.
- **Coexistence:** keep the current personal-place pins until this is proven, then remove the `bubg.m` override and the pins-only `withLocal` mode.

### Acceptance (one bounded session, genuine provider data, GPS-only movement)

1. **Phone, active navigation:** a `WARNINGS_V1` pin's own icon appears as a Google incident callout at its position when its pill appears. Record whether `cfyq.bE` was true, and whether a vote-count "1" text is appended (`ahzj.t`).
2. It disappears on passage, `CLEAR` or expiry. It is re-added after a reroute or navigation-state change (`cleared`/`start`) without duplicates, and no callouts remain after navigation ends.
3. **Car (DHU, Maps on the car):** the car owner `start`s and the same icon draws on the car screen.
4. **Route preview:** record whether any owner is subscribed. If none, preview is not covered by this path (§4, Unknown).
5. Collision behaviour against Google's ETA and incident callouts is acceptable. Tapping our callout does nothing.
6. No crash or ANR on navigation start, stop or car disconnect, and no leaked callouts after repeated add and remove.

## 6. Built-in fallback mapping (legend mode only)

Used only if the bitmap path cannot render (for example if the forced `data:` path fails at runtime). "none" means Google has no fitting built-in icon. Those kinds could only use `OBJECT_ON_ROAD` as a generic hazard, or stay unshown.

| Our kind (icon key) | Closest `ckai` |
|---|---|
| speed_trap | MOBILE_SPEED_CAMERA |
| speed_camera | SPEED_CAMERA |
| average_speed | SPEED_CAMERA_ZONE (or SPEED_CONTROL_ZONE) |
| speed_trap_hotspot | MOBILE_SPEED_CAMERA |
| traffic_jam | JAM |
| roadworks | CONSTRUCTION |
| incident | CRASH (accident) or OBJECT_ON_ROAD (generic) |
| poor_road | OBJECT_ON_ROAD |
| emergency | POLICE_PRESENCE (closest; not an emergency-vehicle icon) |
| wrong_way | none |
| level_crossing | none |
| animals | OBJECT_ON_ROAD |
| bridge | ROAD_CLOSURE (open bridge) |
| matrix | LANE_CLOSURE |
| traffic_camera | none (SPEED_CAMERA would misstate enforcement) |
| maximum_speed_unknown | none |
| border_nl | none |
| speed_limit_130 | none |
| traffic_light | RED_LIGHT_CAMERA only if it is an enforcement camera, otherwise none |

## 7. Comparison: other native layers (not chosen)

- **Styled point marker `ahdz`** (strings `"Both iconStyle and layoutStyle must be provided together."` and `"Either named styles (iconStyle and layoutStyle) or zoomToIcon must be provided."`): a positioned bitmap feature used for route measles. It is created by `ahfr` (`"Null bitmap provided, NoOpStyledMeasle returned."`) and handed to `xzf`/`yba` on the phone (`ngv`/`ngw`) and in the car (`rxc`/`nsu` → `rao`). Feasible, but a client overlay rather than the incident path, so excluded by the owner's decision.
- **Route incident path (B)** and **traffic stretches (C):** see §4.
- **Search and search-along-route pins** (`ojm`, car `sbb`/`rax`/`pqg`) and **basemap traffic incidents** (`blnf.TRAFFIC_INCIDENTS`, server tiles): not usable.

## 8. Reference: incident proto field numbers (stable wire numbers)

Decoded from the protobuf-lite message info, for Path B or future use. Java names are obfuscated; field numbers are stable.

- `cjcb` (incident):
  - 1 enum, 2–4 strings, 9 enum `g` (`cjca` category, e.g. INCIDENT, TRAFFIC_PROBLEM, ON_ROUTE_PROBLEM), 13 enum `s` (`cjau` subtype), 14 `t`/15 `u` icon sets (`ciyq`; hasbit 17 = `0x20000` flag checked in `yba.i`), 32 string `e`;
  - oneof `c`/`d`: 22 `cjbu` (problem), 30 `cjbg` (on-route problem), and others.
- `cjbu`: 1 `cbol` (delay `c` seconds), 6 `cjbs` display/position, 19 enum `ckai` problem type.
- `cjbs`: 3 `cjbr` display styles; oneof 4 `cjbo` {1 start m, 2 length m, 5 int}.
- `cjbr`: four legend enum ids 1–4. Field 2 must be nonzero to draw.
- `ciyq` (icon set): 5 repeated `ciyp`{1 url, 2 format `cjzw` PNG/SVG, 5 variant}.
- `cjee` (route traffic): 1 `cjde` time profile, 2/4/8/11/12 repeated `cjcb` (4 = `g`, used by `xzf.Q`; 12 = `k`), 3 enum delay class, 7 int64.

## 9. Implemented: warning icons as Google's incident callouts (Path A)

The work is static: code, JVM tests and one Morphe CLI patch run of 26.44.06. Nothing was run on a device. No route-dot (`ahdz`) code ships.

### Patch (`incidentCalloutsPatch`, a dependency of **Receive alerts from a third-party application**)

`patches/googlemaps/ui/speed/IncidentCalloutsPatch.kt`. Each role must resolve uniquely, otherwise the patch fails with a `PatchException` naming it. Values in parentheses are 26.44.06.

| Role | Anchor |
|---|---|
| Handler `R` (`bmti.a`) | the only method with `"AddIncidentReportCalloutEvent must have either an iconUrl or a drawable."` |
| Owner `O` (`bmth`) | the type of the first `check-cast` of the handler's host field (`bmti.d`) |
| Event base `E` (`bmtm`) | the next `check-cast`, of the parameter. It must be abstract and implement one interface `I` (`ayui`). |
| Event `C` (`bmtn`) | the only concrete subclass of `E`. Its constructor has five parameters: one `Drawable`, one `String`, one enum `K` (`ckai`), and a position `P` (`bjpk`) with a static `(L)P` method (`E`) where `L` (`bjpd`) has `(DD)V`. |
| Types | `K` must still define all nine type names `IncidentPins` uses |
| Legend flag (`cfyq.bE`) | the only `iget-boolean` in `R` followed within 10 instructions by a static `(K, Z, Z)` call (`ahzj.e`) |
| Callout list and type (`bmth.m`, `bkzv`) | `R`'s only `List.add`, which must read a `List` field of `O` and be followed by `callout.show()` and `return-void` |
| clear-all / destroy (`bmth.a`, `bkzv.c`) | `O`'s `()V` that destroys each element of its list and then clears it |
| start (`bmth.f`) | `O`'s `()V` that creates `R` |
| stop (`bmth.g`) | `O`'s other `()V` calling clear-all |
| Bus (`ayue`, field `bmth.u`) and post (`ayue.d`) | the field start subscribes on; post is the `(I)V` method that Maps' own report flow (`aicd`) calls right after constructing `C` |

Bytecode:
1. **Legend flag, `R` after `iget-boolean`:** `if-eqz flag, :google; flag = !IncidentPins.ours(p1)`. Google's reports keep whatever the flag selects. For our events the flag is false, so Maps draws our bitmap (`ahzj.o` with the event's `data:` URL).
2. **Hand-over.** At `R`'s entry, `IncidentPins.handling(p1)` and `IncidentPins.handlingOwner(p0.host)` record the event and owner. Before the final `return-void`, `IncidentPins.handed(callout)` passes the callout, and `handed` calls `added(event, callout, host)`. The early exits jump straight to that return, so only a drawn callout is handed over.
   - **Why at entry (acc28):** the first build read `p0` and `p1` at the end. `R` (25 registers, `p0` = v23) reuses `p0`'s register for a boolean (`move/from16 v23, v3`). ART rejected the class (`VerifyError ... copy-reference v1<-v23 type=BooleanConstant`), and Maps crashed when guidance started the owner (`bmth.f`). `p1` (v24) is never written, so the legend-flag block's `ours(p1)` is valid.
   - **High registers:** `iget-object` cannot address v23, so the owner is read through `move-object/from16 v0, p0` first.
3. **Owner hooks:** at the end of `O.f`, `IncidentPins.start(owner, bus)`; at the start of `O.a`, `IncidentPins.cleared(owner)`; at the start of `O.g`, `IncidentPins.stop(owner)`.
4. **`IncidentPins.uaEvent(drawable, lat, lng, type)`** is rewritten to return `new C(P.E(new L(lat, lng)), null, drawable, null, Enum.valueOf(K, type))` without posting it. There is no icon URL and no text. **`IncidentPins.uaSend(bus, event)`** is rewritten to `bus.d(event)`.
   - **Why two steps (acc30):** the first build built and posted in one call (`uaPost`) and recorded the event after it returned. The bus runs the handler synchronously during the post, so `ours(event)` was false. Maps drew Google's legend sprite (`bE` was true), `added` took the callout for Google's own report, and nothing tracked it. The callout stayed behind after passage, and the unacknowledged post was repeated every 5 s. The event is now recorded between `uaEvent` and `uaSend`.
5. **`IncidentPins.uaDrop(owner, callout)`** is rewritten to `callout.c()` followed by `owner.m.remove(callout)`.

### Extension

- **`IncidentPins.Book`** (pure, JVM-tested) keeps each owner's callouts by pin key and decides what to do:
  - Removal: a gone pin, or one that moved or changed icon, is removed.
  - Posting: a wanted pin that some owner lacks is posted once. One post reaches every subscribed owner (phone and car). A post nobody drew is repeated after `REPOST_MS` (5 s), and at once after a new owner starts or Maps clears an owner.
  - Callouts handed over: a callout for a pin no longer wanted (or wanted at a different place), or a second one for the same owner and pin, is removed again.
- **The live shell:**
  - Runs on the main thread and syncs on change, at most once a second.
  - Shows `ExternalTelemetry.warningPins()` (the pills' `WarningPins.select`, so the contract gates are unchanged) only while navigating with a WARNINGS_V1 provider. That covers turning the setting off, a provider disconnecting and navigation ending: the wanted set becomes empty and every callout is removed.
  - Owner stop and clear-all forget that owner's callouts; Maps removes them itself.
  - Our events are tracked by identity. That identity is what `ours()` answers for the legend flag, and what maps each handed-over callout to its pin.
- **Icons:** the pills' 256px artwork `morphe/navigation-warning-icons/<key>.png` at 48 dp as a `BitmapDrawable` (Maps rescales it to its report-icon size), falling back to `incident`. No text label.
- **Type field:** the closest `ckai` per kind (§6): speed_trap and its hotspot `MOBILE_SPEED_CAMERA`, speed_camera `SPEED_CAMERA`, average_speed `SPEED_CAMERA_ZONE`, traffic_jam `JAM`, roadworks `CONSTRUCTION`, emergency `POLICE_PRESENCE`, bridge `ROAD_CLOSURE`, matrix `LANE_CLOSURE`, everything else `OBJECT_ON_ROAD`.
- **No double drawing:** while the callouts draw (`IncidentPins.drawing()`), `WazeAlerts.mapItems` leaves the WARNINGS_V1 pins out of the personal-place labels, and `SavedOnMap` is redrawn when that changes. Outside guidance the label path, including the `bubg.m` override, is unchanged, so route preview keeps the label pins.
- **Stable ordering:** `ExternalTelemetry.updatePins` stores `WarningPins.byKey(...)`, so the pills swapping two equally near warnings (acc26: about twice a second) changes neither the labels nor the callouts.

### Still to prove at runtime

1. **Phone guidance:** our icon appears as a Google incident callout at the pin's position when its pill appears. Record whether `cfyq.bE` was true and whether `ahzj.t(…, 1L, …)` adds a vote-count "1".
2. **Lifecycle:**
   - the callout disappears on passage, `CLEAR` or expiry;
   - it is re-posted after a navigation-state change (Maps' clear-all) without lasting duplicates;
   - nothing is left after navigation ends or the owner stops.
3. **Car (DHU, Maps on the car):** the car owner starts and the same icon draws on the car screen.
4. **Two owners:** when only one owner lacked a pin, the repeated post may briefly show a duplicate on the other owner before it is removed. Confirm this is acceptable.
5. **Collision:** behaviour against Google's own ETA and incident callouts is acceptable. Tapping our callout opens nothing (no label, so no tap target).
6. **Stability:** no crash or ANR on navigation start, stop or car disconnect, and no leaked callouts.
7. **Route preview:** keeps the label pins, and guidance shows no label pins.

## Residual unknowns

- The value of `cfyq.bE` in this account and build, and whether the forced `data:` icon renders identically on the phone and the car.
- Whether `bmth` is active in route preview.
- The optional vote-count text from `ahzj.t(…, 1L, …)`.
- Callout collision and priority against Google's own callouts when several warnings are close together.

# Google Maps: start guidance on the host's request

Status: implemented 2026-11-22 (sections 1 to 4); the Start views are identified statically and not yet
observed on a device.
Scope: `extensions/maps-gearslip` and `patches/src/main/kotlin/patches/googlemaps/car/`.

## Why

A car host that runs a voice assistant sends a destination, Maps shows its own route preview,
and the driver has to tap Maps' Start. The host cannot press it: Maps draws that button into
the surface, and the host only receives a plain navigation template. The host now starts
routes by itself after a visible three-second countdown in apps where it can see a start
action; Maps needs a way to take part.

## What exists

- The adapter reaches Maps' live car window (`ProjectionRenderer.decor()`), already injects
  taps into it (`click(x, y)`) and already finds views by resource entry name
  (`NativeOccupiedAreas`, `describe(root, x, y)`).
- The DriveDeck-specific channel: `optionalHostService(host, "map_overlays")` gives
  `app.drivedeck.IMapOverlayHost` (adapter → host: txn 1 register, txn 2 occupied rects);
  the host calls back on `app.drivedeck.IMapOverlayCallback` (txn 1 overlay rects, txn 2
  gesture start). Both check the calling UID against the session.
- `NativeGuidance` reports only GUIDING or not. Route preview looks the same as idle.
- A `google.navigation:` URI reaches Maps unchanged but still opens the preview in the car UI;
  it does not skip Start.

Nothing in the repository identifies the Start button.

## Design

### 1. Identify the Start control

Find the resource entry name of the Start button in the car route-preview layout of the Maps
version the patch targets. Static analysis of that version's resources and layouts first. If
the name cannot be established statically, stop and report: a device layout dump needs the
owner, and validation tooling is frozen without their approval.

The name (or short list of names, if layouts differ by screen size) lives in one place in the
extension. The patch fails when the targeted Maps does not contain that resource, in the
existing `requireMethod`/`check` style: a patch that silently cannot find Start is worse than
one that refuses to apply.

#### Result: established statically, not yet seen on a device

Target: Maps 26.44.06.1006895251 (`COMPATIBILITY_MAPS`). The original APK is not on the machine; an
APK of exactly that version, patched by this repository, is; its resource table and the car
classes read below are the original's (the patches hook `rhe.G` and `snk.a`, nothing read here
depends on either). A 26.43 APK also on the machine was not used. Read-only: `apktool d -s` (resources), `aapt2 dump resources`, `dexdump -d` (which
code uses which id or string) and `jadx --single-class` (one class at a time). Class names below
are this version's obfuscated ones and change with it.

The car draws its UI from code, not layout XML: none of the car view ids (`nav_card_view`,
`status_card_view`, the route and place ids below) appears in any layout file, so a layout dump of
the resources cannot show Start. The code that builds the views does:

1. The only car-specific "Start" string is `CAR_START_NAVIGATION` ("Start"). It is the label of
   the primary-action descriptor `smx`. The car's free-navigation overlay (`rhe`, tagged
   `CarFreeNavOverlay`, the class the patch already guards for car Search) opens its destination
   overlay with `smx` when the route has no stops and with `smv` (`CAR_ROUTE_ADD_STOP`, "Add stop")
   when it has some.
2. That overlay's footer is the car's `placedetails.nextgen.footer` view model
   (`PlaceDetailsFooterViewModelImpl`, `tho`) and its view (`snl`; `snl.a()` builds it). The view
   model maps the footer's state to one label (`sdp.K`): Loading, Retry, replace-same-stop, Select
   stop, Replace stop, Add stop, Start (state NAVIGATE), Continue. So the footer's views are
   shared by all of these actions; only the label says Start. The footer's enabled flag is the
   view model's own (`z()`; false while it loads).
3. `snl.a()` builds two clickable frames, one visible at a time by layout size, both wired
   (`ON_RIPPLE_CLICK`) to the view model's primary action `r()`:
   - `place_details_navigation_footer_action_button` (0x7f0b0906), the wide layout's text button;
   - `place_details_navigation_footer_spinner_or_action_icon` (0x7f0b0909), the narrow layout's
     icon button (its icon is `place_details_navigation_footer_action_icon`, 0x7f0b0907).
   `dexdump` confirms `snl.a()` uses exactly these ids. The label sits in a text or content
   description inside the frame.
4. Ruled out. `start_navigation_action_button` (0x7f0b0ad6) is the container of the whole action
   row; Maps itself only asks it for focus (`requestFocus`, for a rotary or D-pad), it has no click
   handler of its own. `prenav_route_overview_navigate_button` (0x7f0b0942) is the trip overview's
   "Confirm" (`CAR_TRIP_OVERVIEW_CONFIRM`, preflight and stop planning), not Start. The
   `route_select_*` ids belong to the alternate-routes list. `ROUTE_START_NAV`,
   `START_NAVIGATION_BUTTON` and `PERSISTENT_FOOTER_START_BUTTON` are used by the phone UI.

So the list is the two frames of item 3, and a frame counts as Start only while it carries the
`CAR_START_NAVIGATION` string as read through the frame's own resources (the car window's
language), because the same frames say "Add stop" or "Continue" at other times. The existing
RendererProbe `start` scenario's tap at (218, 382) and the run 28 acceptance ("typed query, route
preview, Start reached GUIDED_NAV") are consistent with a Start in the lower left card, but name
nothing.

What this does not establish, and one device observation settles: that Maps wires the click to
those exact frames (read from the declarative view builder, not executed), and which of the two
the owner's head unit draws. Ask the host to start on a route preview; the adapter logs under tag
`MapsNativeCar` either `Started guidance on the host's request from <name>` (this settles it) or
one warning saying there is no car window, no usable Start view (not on a route preview, still
loading, another action) or that the Start view took no click. If the name is wrong the effect is
silence: nothing is clicked and the host's countdown never starts. The patch refuses a Maps whose
footer builder no longer uses the ids (`validateMapsRoutePreviewStart`).

### 2. `NativeRoutePreview`

A small class beside `NativeOccupiedAreas`:

- `find(decor)`: the Start view, or null. It must be attached, shown (itself and its
  ancestors visible, non-zero size) and enabled.
- `shown(decor)`: `find(decor) != null` and guidance is not GUIDING.
- `start(decor)`: `performClick()` on that view. No coordinates.

All on the main thread, like the existing decor access.

### 3. Tell the host when the preview is up

`IMapOverlayHost` txn 3, one-way: one boolean, "route preview shown". Sent when the value
changes, driven by the same decor layout observation that feeds the occupied areas, and once
with `false` when the session ends or guidance starts. A host that does not know txn 3
ignores it; confirm that an unknown one-way transaction to the existing host stub is harmless
before relying on it.

### 4. Start on request

`IMapOverlayCallback` txn 3, one-way, UID-checked like txn 2: "start guidance". On the main
thread:

- already GUIDING: nothing;
- `find(decor)` is null: log once, nothing;
- else `start(decor)`, then refresh guidance so the host's `navigationStarted` follows as it
  does for a driver's tap.

No result is returned: the host confirms through `navigationStarted`, exactly as when the
driver taps.

### What this does not do

- No synthetic tap at a position, no change to the intent Maps receives, no new bytecode hook.
- No start without the host asking, and nothing for hosts that never ask.

### As built, where it differs from the text above

- `find` also requires the Start label (section 1, item 2), so "Add stop" and "Continue" are not
  pressed. Nothing is Start when Maps has no `CAR_START_NAVIGATION` string.
- `shown` takes the guidance state as an argument (`shown(decor, guiding)`); the renderer supplies
  its own hosted-navigation flag. `start` returns the view that took the click, or null.
- A host starts out knowing "not shown", so the first report is sent only when the preview is up;
  the report at session end (or renderer failure) is `false`, and only when the host was last told
  `true`. A preview already up when the host subscribes is reported at once.
- Transaction numbers: adapter to host txn 3 on `app.drivedeck.IMapOverlayHost` (after 1 register
  and 2 occupied boxes); host to adapter txn 3 on `app.drivedeck.IMapOverlayCallback` (after 1
  overlays and 2 gesture start). Neither was used, on either side. DriveDeck's host stub answers
  any code other than 1 and 2 with `false` before reading anything, so an unknown one-way
  transaction is harmless there.
- The patch-time check is the footer builder's use of the ids, not a resource table lookup. The
  extension's names and the patch's ids are two lists tied by a test (same names, same order).
- No debounce. A second request right after a click presumably finds the footer already in its
  Loading state (disabled, not labelled Start) and does nothing, but that is read from the view
  model, not observed. A host should send one request per route.

## Tests

Robolectric, in `extensions/maps-gearslip/src/test`:

- `NativeRoutePreviewTest`: found when shown and enabled; not found when hidden, detached,
  disabled, zero-sized or under a hidden ancestor; `start` clicks exactly that view;
  not "shown" while GUIDING.
- `NativeCarServiceTest`: txn 3 from the session's UID clicks Start once; from another UID it
  is refused; while GUIDING or with no Start it does nothing; the preview-shown boolean is
  sent on change and `false` at session end.

Run `./gradlew :extensions:maps-gearslip:testDebugUnitTest` and the patch tests once, as one
batch. A build is not runtime proof: the owner validates on a phone with the host.

## Repository rules that apply

Author and committer exactly as the repository requires, checked with the identity script
before any commit; conventional commit subject `feat(Google Maps): …`; no attribution
trailers; no release-owned files; no version bumps; nothing pushed or published.

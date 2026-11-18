# Maps alert pins from WARNINGS_V1 (implementation note)

Date: 2026-11-12. Follows item 2 of [Alert geolocations and on-map markers](2026-11-11-alert-geolocation-markers.md). Static work only: repository code, JVM unit tests, Gradle builds and JADX 1.5.6 output of Google Maps 26.44.06.1006895251 (base APK, scratch-only, not retained). No device, emulator, DHU or Frida run.

Labels: **Observed** means read in repository or decompiled code. **Inferred** follows from that code without runtime proof. **Unknown** is not established.

## What changed

- **Pin source.** With a provider that negotiated WARNINGS_V1 (`WarningSession.advertisesEvents(source)`), `WazeAlerts.mapItems` now pins exactly the events the warning pills show. `ExternalTelemetry.pillEvents` is the pills' existing selection (`WarningView.carEvents` with category preferences, `PointPillGate`, passage/off-route relevance), shared by the pills and `WarningPins.select`. Pins therefore have the pills' identity, `CLEAR`, expiry, category and passage filtering, and the pills' limit of three.
- **Geometry gate** (`WarningPins.placeable`): both native coordinates present and finite, never `0,0`, not `position_estimated`. A `native_point_target=true` point lasts until `state_until`. Any other point (all Waze points, FM responders) needs `position_observed_elapsed_ms` at most 5 s old. No direction, and no zone line or extent.
- **Fallback.** Sources without WARNINGS_V1 (older provider patches, the Waze alert-sharing bridge) keep the previous telemetry/bridge report pins and the "legacy alert types" filter. That filter does not apply to WARNINGS_V1 pins, because the pills do not use it.
- **Icon.** Each pin carries the closest emoji for its shared icon key (`IndicatorContract.icon`; 19 keys, `incident` fallback). Its title is the kind name in English or Dutch, not the warning text, whose distance would go stale.
- **Identity.** Each pin is in its own CUSTOM list `ungoogled:warning:<key>`. The key is `w` + 16 hex of SHA-256(provider session, warning id), so it is stable over revisions and carries no id text or position.
- **Refresh.** `ExternalTelemetry.updatePins` runs with every update and the existing 1 s tick. It asks `SavedOnMap` to redraw only when the pin list (value equality) or mode changes. `SavedOnMap` now keeps every live generator in a weak identity set (added by the setter or switch-on, removed at switch-off) and redraws all of them. It remembers its own items per generator, so a second map's earlier pins are removed rather than piling up. It coalesces requests and holds redraws to one per `WarningPins.MIN_REDRAW_MS` (1 s), running the first after a quiet second at once.
- **Settings text.** "Legacy map-pin and alert types", and the **Road alerts on the map** subtitle now says pins follow the pills.
- No patch (bytecode) change, no new GMM binding, no shared `support/navigation-alerts` change, no new logging. Coordinates stay in memory: `Pin.toString` prints only key and icon.

## Follow-up: pins during a route

Maps hides the personal place generator whenever a route is drawn, so pins never appeared in route preview or navigation ([diagnosis and fix](2026-11-12-maps-pins-generator.md)). The controller's visibility toggle (`bubg.m` in 26.44.06) now asks `SavedOnMap.visible` first. While pins can be drawn, the generator stays shown, and `withLocal` gives it only the warning pins. This is a bytecode change. The **No patch (bytecode) change** item below describes the first commit only. Statically verified only. The pins during navigation, on the phone and in the car, still need runtime proof.

## Observed in GMM 26.44.06 (static)

- The personal-place label builder (`apur.b`, abstract `apug` implementer) chooses the icon from list data. A CUSTOM list's `emoji` string gives an EMOJI label. A `PHOTO_PIN` takes a list photo string through `FIFE_MONOGRAM_CIRCLE_CROP` into the label proto (a remote Google image URL). No local bitmap or resource path exists for these labels, so the 19 PNG assets cannot be drawn through this path. Emoji is the closest native option.
- The label proto receives a feature id only when its low word is non-zero (`if (bjowVar.c != 0)`). The `0:0` id is therefore a natively supported "bare spot", not a collision. A synthetic non-zero id would send a fabricated Google place id into the label (and possibly a place lookup on tap), so `0:0` is kept and per-warning identity goes into the list id instead.
- The generator (`apuj`) accepts the place list in `c(ImmutableList)`, which always schedules a rebuild. With the changed flag set, it regenerates the labels of every cached tile (`apuk.f`, 30 tiles), which is why redraws are change-driven and bounded.
- Each `apuk` generator is constructed with its own map reference. Whether the projected car map creates and renders one is **unknown**. The multi-generator change only ensures that a car generator, if one exists, is redrawn too.

## Inferred, not proven

- Native label collision rules can still hide a pin among Maps' own labels at some zoom levels.
- With a WARNINGS_V1 provider disconnected, no pins show (the report list is not used as a substitute). This matches the pills, which drop provider warnings on disconnect.
- Pins lag the pill by up to the 1 s redraw bound plus GMM's own label pass.

## What acceptance must prove (owner, later)

Phone, on an emulator GPS-only drive with genuine provider data (no injected alerts):

1. With **Road alerts on the map** on, in route preview and during navigation and a WARNINGS_V1 provider (FM15 or De-Waze), a pin with the matching emoji appears at the warning's map position when its pill appears.
2. The pin disappears with the pill on passage, `CLEAR`, or expiry. A Waze/responder pin also disappears when its position is no longer fresh (more than 5 s).
3. A fixed FM camera pin stays while its pill does, without flicker from repeated unchanged updates.
4. Turning **Road alerts on the map** off removes the pins.
5. Logcat shows no coordinates from these classes.

Car rendering of these pins is **unknown** and needs one capture in a later session. If the car map draws no personal places, the pins are phone-only.

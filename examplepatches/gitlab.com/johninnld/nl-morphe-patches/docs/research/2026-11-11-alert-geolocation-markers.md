# Alert geolocations and on-map markers (static research)

Date: 2026-11-11. Static only: repository source plus JADX 1.5.6 output of Waze 5.27.0.1 (1030748) base APK, Flitsmeister 15.0 (1289) base APK and Vela 0.5.2621. No device, emulator or runtime evidence was produced. The decompiled output is scratch-only and is not retained in the repository.

Labels: **Observed** means read in repository or decompiled code. **Inferred** means following from that code without runtime proof. **Unknown** means not established.

## 1. What coordinates exist, what we ship, and what we drop

### Channels

- **WARNINGS_V1** (`support/navigation-alerts`). Observed: `WarningEvent` carries optional `latitude`/`longitude` (WGS84 doubles), which must come as a pair with `position_observed_elapsed_ms` and `position_estimated` (`WarningEvent` ctor `geometryGroup`). It can also carry `native_point_target`. Transport is an authenticated Binder: `WarningEndpoint`/`WarningConnection` check the calling UID and a callback challenge. `WarningCodec` passes the fields through unchanged.
- **Telemetry broadcast** (`support/navigation/.../NavigationProtocol.send`). Observed: `alert_latitude[]`/`alert_longitude[]` per report (`NavigationAlerts`). The broadcast is implicit and unprotected unless the provider's *Receiver package* is set (`setPackage` only when `target` is non-empty).
- **Legacy Waze bridge** (`extensions/waze/.../Bridge.alerts`). Observed: `org.ungoogled.waze.ALERTS` with `lat`/`lng` as int microdegrees, sent by plain `sendBroadcast` without a permission.

### Waze (5.27.0.1 JNI protos, stable names)

| Native source | Geometry the source exposes (observed, JADX) | What we put in the Bundle | Dropped |
|---|---|---|---|
| `NativeAlertDescriptor.info` (`AlerterInfo`) | `getPosition()` → `Position.IntPosition` with int `latitude`/`longitude` in microdegrees (1e-6°, about 0.1 m resolution). `IntPosition` also has `altitude` and N/S/E/W ints. No heading/azimuth field. | `WazeWarningModels.descriptor`: `latitude`/`longitude` = value/1e6, `position_estimated=false`, `relevance=point_ahead`. `NativeWarnings.descriptorFields` stamps `position_observed_elapsed_ms` with the repository observation and `position_clock_origin=native_repository`. The same position also goes into the telemetry broadcast (`NavigationBroadcasts.alerts`) and the legacy bridge. | Altitude/bounds (not meaningful for a pin). Waze never sets `native_point_target`, so every Waze point is treated as "fresh ≤5 s only". |
| `ZoneAlertData` | Only `state`, `zonePercent`. No coordinates. | `native_zone_state`, `native_zone_percent`. | Nothing; there is no geometry. |
| `SegmentInsightInfo` (incl. `AVERAGE_SPEED_CAMERA`) | `Id{segmentType, segmentId}`, `positionRelativeToSegment`, `remainingDistanceMeters`, `remainingDurationSeconds`, `priority`, `sourceAlertInfos{id, uuid, alerterType, subtype, familiar}`. **No coordinates and no polyline.** | `WazeWarningModels.segment`: distance and phase only. A correlated descriptor inherits the descriptor's single point. | Nothing geometric to drop. Zone start/end coordinates are **unknown/not exposed** in Java DTOs. Native-layer geometry may exist, but it is not reachable through these protos. |
| `RtAlertItem` (rtalerts) | int `latitude`/`longitude`, plus `reportedBy`, `moodName`, comments and screen X/Y. | Not used. | Deliberately unused: it carries reporter identity (privacy). |
| Patch-owned `OsmCameras` | OSM node lat/lon. | `NativeWarnings.osm`: lat/lon, `position_estimated=false`, `point_ahead`. | No direction. |

Precision (inferred): fixed cameras are map-editor points, so they are point-precise. User reports (police, hazard, jam, accident) are the reporter's position at report time. They are approximate (likely tens of metres) and not tied to a direction. The owner's probe (`position { latitude: 51485487 longitude: 5416153 }` = 51.485487 N, 5.416153 E) matches the microdegree encoding. Which end of an average-speed segment a `CAMERA` descriptor's position marks is **unknown**.

### Flitsmeister 15.0

Observed models (`nl.flitsmeister.fmcore.data.model.reports`):

- `BaseReport.location` (`android.location.Location`). `a1b.b(lat,lng)`/`a1b.x(via)` build it with `new Location("")`, so `elapsedRealtimeNanos=0`.
- `SpeedCam`: `location`, `bearing1`, `bearing2` (Float, camera facing directions), `maxSpeed`, `speedCamType`.
- `SpeedTrap`, `PoliceHotspot`: point `location`.
- `Incident`: `location`, optional `gpsPath`.
- `BaseTrajectReport` (`TrafficJam`, `AvgSpeedCheck`): `gpsPath` (`List<via>`, double lat/lng), `tailGpsPath`, `startLocation`/`endLocation` (first/last path point), `polygon`, `totalLength`. `getLocation()` returns `getStartLocation()`.
- `AvgSpeedCheck.segments[]`: per-segment `gpsPath`, decoded from an `encodedPolyline` by `g73`/`cge.b` (Google polyline, 1e-5°, about 1 m).
- Early warnings (emergency/responders): server JSON `latitude`/`longitude`, parsed in our `EarlyWarningGeometry` and correlated to the request fix.

What we ship (observed, `extensions/flitsmeister/.../NativeWarnings.describe` lines ~574–586):

- Fixed points (`SpeedCam`, `SpeedTrap`, `PoliceHotspot`, `Incident` without `gpsPath`, bridge/rail crossings) ship lat/lon with `native_point_target=true` and `position_clock_origin=native_decision`, because the native Location has elapsed time 0.
- Non-fixed families whose Location has elapsed time 0 (`TrafficJam`, `AvgSpeedCheck`, path incidents) **drop lat/lon on WARNINGS_V1**: the branch `at==0 && !fixedPoint` removes them (inferred from code; not runtime-checked).
- Early-warning responders ship the JSON position with the request-fix clock (`native_response_request_fix`). These are moving targets; the contract allows only fresh use.
- The telemetry broadcast (`NavigationBroadcasts.reports`) ships `report.getLocation()` for every active alerted report. For jams and zones that is the **start** of the path.
- `NavigationBroadcasts.readCandidate` reads the zone `gpsPath`/segments but only uses them inside the producer (`ZoneGeometry.project`), to compute remaining distance and percent and the distance to `path[0]`.

Dropped: `SpeedCam.bearing1/2`, zone/jam **end** location, all polylines (`gpsPath`, `tailGpsPath`, segment polylines, `polygon`), and Incident `gpsPath`.

Precision (inferred): camera DB entries are surveyed points. Zone and jam polylines are road geometry at about 1 m precision. Responder positions are server-reported snapshots.

### Summary of question 1

Yes for **points**. Waze descriptors and FM fixed reports deliver exact native point coordinates to Maps and Vela over WARNINGS_V1, and in parallel over the telemetry broadcast. Zone/jam **start** reaches receivers only via the telemetry broadcast (FM), and zone **end** and polylines reach no receiver. Waze exposes no segment geometry at all. FM has it natively, and we drop it.

## 2. Drawing icons at those positions

Contract constraints (`docs/contracts/navigation-indicators-v1.md`, Geometry section):

- Draw only native coordinate pairs. Never default to (0,0).
- Fixed native points may persist until `state_until`. Other points (Waze, responders) need `position_observed` ≤5 s.
- No direction arrow without a native bearing.
- No zone line or extent unless a native polyline is shipped.
- Passed/off-route filtering applies to visuals as well.
- A marker is display-only and never renews speech or the observation clock.

### Google Maps

- **Phone: already exists (observed).** `SavedOnMap.withLocal` is injected into the place setter of `PersonalPlaceLabelGenerator` by `mapMarkersPatch` (`patches/googlemaps/saved/OfflineSavedPlacesPatch.kt`, `savedOnMap()`, resolved structurally, not by obfuscated name). `WazeAlerts.mapItems` turns each alert into a native personal-place item with a CUSTOM list emoji per kind (`SavedOnMap.item`/`listInfo`). For the modern sources, `WazeAlerts.activeAlerts` → `ExternalTelemetry.mapAlerts()` uses the telemetry `RoadAlert` lat/lon, so FM and De-Waze reports already pin, gated by **Road alerts on the map**.
- **Gaps:**
  - Pins come from the telemetry report list, not from WARNINGS_V1 identity and lifetime.
  - The icon is an emoji, not the 19-asset vocabulary.
  - Native label collision and zoom rules can hide pins.
  - Pins use a 0:0 feature id.
- **Car (Android Auto):** **Unknown** whether the projected car map instantiates or renders `PersonalPlaceLabelGenerator`. `SavedOnMap` holds one `WeakReference` generator, so `refresh()` would redraw only the latest instance (inferred).
- **Screen overlay alternative:** no hook into GMM's main or car camera projection exists. The only geo↔screen converter is the offline picker's (`PickerOverlay.refreshProjection` → `OfflinePicker.pickerGeoOf`). Building a projection overlay means new obfuscated camera bindings, a ~30 Hz tracking loop and frame-sync jitter, with high churn per GMM release. Not recommended.
- **Recommendation:** keep the native personal-place path. As a visibility checkpoint, add a mode that feeds `mapItems` from active `WarningView` events with fixed `native_point_target` coordinates (and fresh ≤5 s Waze points). It should use the same identity, `CLEAR`, expiry and passage filtering as the pill. Effort: low–medium, no new GMM hooks. First verify the car rendering with one capture in the next planned acceptance session.

### Vela (MapLibre Android, observed)

MapLibre's `maps` package is R8-renamed (`MapLibreMap`→`org.maplibre.android.maps.f`, `Style`→`l`). JNI-bound classes keep their names: `MapSnapshot`, `GeoJsonSource`, `SymbolLayer`, `Feature`.

- **Car: best candidate.** The car map is a `MapSnapshotter` bitmap that the `cw` snapshot callback (`Lxv;->a(MapSnapshot)`, bound in `VelaCarWarningFrame.kt`) scales onto the car Surface (`width=h/bitmapW`, `height=i/bitmapH`).
  - Vela itself already projects native markers on that frame. `cw.b(Canvas,MapSnapshot,F,F)` draws traffic controls (`lv.b`, `jk4{LatLng, ik4 SIGNAL|STOP|RAIL_CROSSING|SPEED_HUMP}`) and Flock route cameras through `cw.q`/`cw.r` = `mapSnapshot.pixelForLatLng(LatLng) × scale`, and only at zoom `t ≥ 13.5`.
  - Our `CarUi.warningFrame(renderer, canvas)` runs on the same Canvas after `cw.g`. Extending it to receive the snapshot (callback `p1`, or the `cw.m` field) and the two scale factors lets it draw warning icons exactly where the frame was rendered, with no drift. The draw must be clipped to the visible rectangle `cw.u()` that the pills already use.
  - Effort: low. One extra register in the existing hook, plus the existing hash guard.
  - Risk: the emulator Snapshotter/GLES SIGSEGV (see `2026-11-05-vela-native-aa-acceptance.md`), so car acceptance needs a non-emulator head unit, or it stays unproven.
- **Phone:** Vela installs GeoJSON sources and symbol layers in `iw4.f0(Style,boolean)` (`vela-speedcam-src`/`vela-speedcam`, `vela-flock-src`, `vela-controls-src`). It updates them in `iw4.L(...)` via the renamed `GeoJsonSource.c(FeatureCollection)`.
  - A dedicated `warnings-src` and `SymbolLayer` added after `f0` and updated from `TelemetryRuntime` is the native approach. It renders in the map, so it pans and tilts with the map.
  - This needs patch-time binding of renamed `Style`/`Layer`/`Source` methods under hash-pinned contracts, as `VelaTelemetryPatch.velaContracts` already does.
  - Do not reuse `vela-speedcam-src`, because it would mix our semantics with Vela's.
  - Effort: medium.

### Cross-cutting risks

- **Privacy.** No new egress. However:
  - Report coordinates near the car reveal approximate user location.
  - The telemetry broadcast and the legacy bridge are implicit, unprotected broadcasts, unlike WARNINGS_V1.
  - Prefer WARNINGS_V1 as the marker source, and keep coordinates out of logs and receipts.
  - Never use `RtAlertItem` (reporter identity).
- **Performance.** Redraw on change only. GMM label regeneration per refresh is the costliest step, so it should be throttled. Vela car icons per snapshot and phone `setGeoJson` on change are negligible.
- **Obfuscation churn.** GMM resolves structurally. Vela is pinned per build through contract hashes, and Waze protos keep their names. FM15 model names are kept: `nl.flitsmeister.fmcore.data.model.reports.*` are unobfuscated.
- **Contract.**
  - No zone or jam extents until FM polylines are added as explicit native fields, for example a bounded encoded polyline with its own clock and metadata.
  - No camera direction until `SpeedCam.bearing1/2` is shipped as a native field.
  - Waze average zones can show at most the correlated camera point.

## Recommended approach

1. Vela car: draw contract-gated point icons from WARNINGS_V1 in the existing snapshot frame, using `pixelForLatLng`.
2. Maps phone: switch or extend the existing personal-place pins to WARNINGS_V1 events with identical lifetime, then verify car rendering once.
3. Vela phone: add a dedicated symbol layer.

Optional producer additions, each a separate contract change: FM `bearing1/2`, zone end and segment polylines, and a Waze `native_point_target` for fixed cameras only once it is proven.

# Vela alert markers: bindings and acceptance (implementation note)

Date: 2026-11-12. Follows [Alert geolocations and on-map markers](2026-11-11-alert-geolocation-markers.md), recommendation 1 (Vela car) and 3 (Vela phone). Static work only: repository source, JADX 1.5.6 and apktool/baksmali output of the publisher-signed Vela 0.5.2621 (46210) APK (SHA-256 `f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f`), JVM unit tests and Gradle builds. No device, emulator, DHU or Frida run was made; decompiled output was scratch-only and deleted.

Labels: **Observed** means read in the DEX or repository code. **Inferred** means following from that code without runtime proof.

## What is drawn

Both receivers use one selection (`TelemetryRuntime.markers(now)` → `AlertMarkers.select`):

- Candidates are exactly the pill selection, `TelemetryRuntime.carWarnings()`: WARNINGS_V1 identity, CLEAR, `state_until`, category preferences, native car exclusions, `display_only`, the top-three ordering and the point-pill gate (passed/off-route removed at once, a point needs a distance).
- A candidate gets a marker only with a native `latitude`/`longitude` pair that is not (0,0), relevance `point_ahead` or `moving_emergency`, and no in-segment state (`WarningGeometry.remainingSegment`). Passed/off-route relevance is checked again.
- `native_point_target=true` on a `point_ahead` event keeps the marker until `state_until`. Every other point (Waze descriptors, responders, which never qualify as fixed) needs `position_observed_elapsed_ms` at most 5 s old.
- No direction arrow, zone line or extent. Icons are the shared `WarningIcons` 256px pack (`IndicatorContract.icon`).
- Display-only: selection reads immutable `WarningEvent`s; nothing renews speech, the observation clock or warning state. Coordinates are not logged; the change signature that contains them stays in memory.
- Gate: in-app switch `morphe_alert_markers` (default on), phone **Speed and road alerts** and car **Navigation provider**. Car markers also require the existing car-details switch.

## Car (Android Auto) binding

Observed in `Lxv;->a(Lorg/maplibre/android/snapshotter/MapSnapshot;)V` (25 registers, 335 instructions, flags 17, unchanged pinned hash `005a5364…3d8`, validated before patching):

- The native frame scales the snapshot bitmap onto the surface with `scaleX = cw.h / bitmap.width` and `scaleY = cw.i / bitmap.height` (1.0 when the bitmap is null).
- Before the native puck call `invoke-virtual/range {v1 .. v7}, Lcw;->e(Canvas, MapSnapshot, F, F, D)V`, R8 lays out `move-object v3, v2` (v3 = MapSnapshot p1), `move v4, v5` and `move v5, v6` (scale factors), `move-wide v6, v7`, `move-object v2, v11` (v2 = Canvas).
- The existing hook site (index 286, the former `Lcw;->u()` call that both native skip branches target) now calls `invoke-static {v1, v2, v3, v4, v5}, Lnl/johninnl/vela/CarUi;->warningFrame(Ljava/lang/Object;Landroid/graphics/Canvas;Ljava/lang/Object;FF)V`; `Lcw;->u()` is re-added after it.
- Guards: the existing frame hash, plus the puck call and the five moves checked at patch time. The unit test proves that no branch, switch or catch handler from outside the block enters it and nothing in it rewrites v3..v5, so every path into the hook carries the snapshot and scales.

`CarUi` projects each marker with the frame's own `MapSnapshot.pixelForLatLng(org.maplibre.android.geometry.LatLng)` × (scaleX, scaleY), the same as Vela's `cw.r`. It withholds markers when the snapshot has no bitmap, clips to `overlayViewport` (current visible rect, 80 dp button lane reserved) and draws them before the pills, so pills cover them. Icon size is 28 dp at host density, between 16 px and a fifth of the short surface side.

Differences from Vela's own markers (observed in `cw.b`/`cw.q`): Vela draws traffic controls only at zoom ≥ 13.5 and hides points more than `h11.c` metres behind its frame centre. Our markers use neither rule; passage filtering removes passed points instead. The frame presentation key now includes the marker signature, so marker expiry requests a new native snapshot without a new GPS frame.

## Phone binding

Observed: `Liw4;->f0(Lorg/maplibre/android/maps/l;Z)V` (65 registers, 2668 instructions, flags 25, hash `76f335f442c0f8722f4d4b00b5b7e73604de7a640092fcaccb969fdeebd30e5a`) installs Vela's own sources and layers. Its only caller is the phone map's style-loaded callback `wu4.a(Style)`, built with the phone `MapLibreMap` (`org.maplibre.android.maps.f`); the car uses a separate `MapSnapshotter`. `f0` has one `return-void` and never reassigns p0 (v63).

The patch replaces that return with `invoke-static/range {p0 .. p0}, Lnl/johninnl/vela/MapMarkers;->style(Ljava/lang/Object;)V` followed by `return-void`. `MapMarkers` adds source `johninnl-warnings-src` (`new GeoJsonSource(String)`) and symbol layer `johninnl-warnings` on top of the style at that moment, with layout properties `icon-image ["get","icon"]`, `icon-allow-overlap true`, `icon-ignore-placement true` and `icon-anchor center`. It registers one 30 dp bitmap per icon key (`johninnl-warning-<key>`, bitmap density = display density) and republishes the source from `TelemetryRuntime.publish` (main thread, events and the 1 s tick) only when the marker signature changes. Vela's `vela-speedcam-src`, `vela-flock-src` and `vela-controls-src` are never touched.

Renamed MapLibre members, each pinned as `Contract(registers, instructions, flags, velaFingerprint)` in `patches/src/main/kotlin/patches/vela/VelaAlertMarkers.kt`:

| Member (observed meaning) | Contract |
|---|---|
| `l.a(String, Bitmap)` addImage → `c` | 3, 2, 17, `d076f6894a43a410ffaee6a3dc2ef7b18d5f5fa589ee9181cb15b659acb76f62` |
| `l.c(String, Bitmap)` addImage | 4, 12, 17, `59e7dc557bec047f3702bc88d943a034991bfa69b24b8ab08176d9c2024c2bba` |
| `l.d(Layer)` addLayer | 3, 10, 17, `a1dbb1e4a8f2da18a7f21517ae506b66181edd428bc7deae9da3e46589a4dc70` |
| `l.h(Source)` addSource | 3, 10, 17, `087662dec0acbf19d30b3af680f8f1c7f41d6a4e07d2cdb44a0970ac85f8380a` |
| `l.n(String)` getSource | 3, 13, 17, `710290840c885f1f54b4e940e7125592571fa8ce6d8870b88816fa836d1be957` |
| `l.v(String)` loaded-style check (field `l.f:Z`) | 3, 9, 17, `d4a0f92be61a2806d61e39e92036eff1a6dfa11144e9b92a5c28413af484d3df` |
| `Layer.g(xd3[])` setProperties | 7, 32, 145, `5bc330f4c796c6dc1e9435d178c2a03ae38c43556b1abde55ab031f08c87595c` |
| `xd3(String, Object)` PropertyValue (layout unless `i03`) | 3, 4, 65537, `7535090ababba2eabc02b9114fc6ac0efb89d9825fd001a060eebda91eb17158` |
| `GeoJsonSource(String)` | 3, 9, 65537, `cf270d6b3b6ae19d87e5ca938216499c23955d23fc9de00847352c795ff091fe` |
| `GeoJsonSource.c(FeatureCollection)` setGeoJson | 3, 16, 17, `f3d57a78c7222ca592216551aefd9c12b386465b2fe718cad0c2ebf34a24b1a5` |
| `SymbolLayer(String, String)` | 3, 3, 65537, `d505c87da58701a587d116a48a843a0c54aca67b6698825c58c3c9764c31d98f` |

Unrenamed MapLibre names are checked for presence only: `MapSnapshot.pixelForLatLng`/`getBitmap`, `LatLng(double, double)`, `Point.fromLngLat(double, double)`, `Feature.fromGeometry(Geometry)`, `Feature.addStringProperty`, `FeatureCollection.fromFeatures(List)`. `cp1`/`i03` must still extend `xd3`. `cp1` has no constructor of its own in this DEX (R8 calls `xd3.<init>` directly), which is why the base `xd3` constructor is used.

Inferred, not runtime-proven: the `["get","icon"]` expression array passes through `Layer.g` unchanged (it is not a `jt0`) and native conversion accepts it as an expression; a stale style throws from `l.v` and is dropped until the next `f0`; `MapMarkers` follows only the most recent phone style if Vela ever creates two phone maps.

## What acceptance must prove

- **Car:** unprovable on the emulator. Vela's car map `MapSnapshotter` SIGSEGVs in GLES on the AVD once the map moves ([2026-11-05 Vela AA acceptance](2026-11-05-vela-native-aa-acceptance.md)), so the projected frame needs a physical head unit or phone DHU. It must show the icon on the genuine provider point, moving with the map, beneath the pills, clipped from the button lane, and gone after passing.
- **Phone:** emulator-testable with genuine provider data and GPS-only movement (contract: only GPS may be fabricated).
  1. With Flitsmeister selected and a speed camera pill showing, the speed-camera icon appears on the map at the camera's road position and pans, rotates and tilts with the map.
  2. The icon count equals the warning pills for point alerts; a jam or average-speed section pill has no icon.
  3. After driving past the camera, the pill and icon disappear together; CLEAR or the 30 s state window removes both.
  4. With De-Waze, a report icon disappears within about 5 s when Waze stops refreshing its position.
  5. Turning **Show alerts on the map** off removes the icons at once; turning it on restores them. Vela's own speed-camera, Flock and traffic-control icons are unchanged.
  6. A light/dark style switch (style reload) brings the icons back.
  7. Speech timing and wording are unchanged by markers.

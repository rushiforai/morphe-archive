# Navigation broadcasts, schema 1

The default-selected **Broadcast navigation data** patches for Waze 5.26.90.901 and Flitsmeister 14.17 publish the same primitive-only Android Intent schema. A consumer can register once for `nl.johninnl.navigation.NAVIGATION_STATE` and use the same keys for either provider. No proprietary Parcelable, overlay, visible Activity or account identifier is required by the transport.

## Transport and provider selection

- Common state: `nl.johninnl.navigation.NAVIGATION_STATE`.
- Common snapshot request: `nl.johninnl.navigation.NAVIGATION_STATE_REQUEST`.
- Waze aliases retained: `nl.johninnl.waze.NAVIGATION_STATE` and `_REQUEST`.
- Flitsmeister aliases: `nl.johninnl.flitsmeister.NAVIGATION_STATE` and `_REQUEST`.

Choose the common state action for new receivers. Both aliases and the common action carry identical extras/session/sequence for the same event; subscribing to both requires deduplication. Existing Waze receivers continue to work. `source_package` identifies `com.waze` or `nl.flitsmeister`; maintain state separately for each provider and choose the preferred provider in the consuming app. Never combine the speed of one app with the zone of the other.

Register an exported dynamic receiver in the consumer's running service. A manifest receiver can receive explicitly targeted messages when the patch option `receiverPackage` names that package. Blank means implicit local broadcasts to running receivers. Android background/stopped-package rules still apply.

Request a snapshot with `new Intent("nl.johninnl.navigation.NAVIGATION_STATE_REQUEST").setPackage(providerPackage)`. Requests are throttled to one per second per provider. They do not start a stopped app or refresh observation timestamps. Normal updates are capped at one per second, status/limit/segment changes may publish immediately, and fresh data receives a five-second heartbeat. Stale values are omitted.

Android 14+ uses the framework share-identity broadcast option. Validate `BroadcastReceiver.getSentFromPackage()` and `getSentFromUid()` against the installed provider; the source_package extra alone is not authentication. Earlier Android versions do not provide this authentication through this open protocol. The payload contains primitive scalars/arrays, bounded strings and per-process/session identifiers. Optional road-alert coordinates describe report/camera positions, not the device location. No account identifier or device GPS fix is added. The existing schema-1 actions and fields remain compatible; approach and road-alert fields are optional additions.

## Fields common to both providers

| Extra | Android type | Meaning |
| --- | --- | --- |
| schema_version | int | 1; additions are optional fields |
| source_package | String | Provider application package |
| publisher_session_id | String | Random per-process UUID |
| sequence | long | Increasing event sequence in that process |
| sent_elapsed_ms / sent_unix_ms | long | Publication times; use monotonic elapsed time for freshness |
| current_speed_status | String | unknown, valid, stale or disabled |
| current_speed_updated_elapsed_ms | long | Speed observation time, or -1 |
| current_speed_max_age_ms | long | 5000 |
| current_speed_kmh | double, optional | Fresh normalized current speed; stationary zero is valid |
| road_speed_limit_status | String | unknown, valid, stale or disabled |
| road_updated_elapsed_ms | long | Road observation time, or -1 |
| road_max_age_ms | long | 30000 |
| road_speed_limit_kmh | double, optional | Fresh normalized effective limit |
| road_speed_limit_display | int, optional | Original numeric limit |
| road_speed_limit_display_unit | String, optional | Original recognized units or metric/imperial |
| zone_status | String | unknown, active, inactive, stale or disabled |
| zone_updated_elapsed_ms | long | Last accepted zone observation/clear time, or -1 |
| zone_max_age_ms | long | 90000 |
| zone_source | String, active only | legacy / insights for Waze, flitsmeister for Flitsmeister |
| zone_segment_id | String, active only | Opaque native identity, including Flitsmeister segment index; can be empty for Waze legacy |
| zone_session | long, active only | Observation session, scoped to publisher process |
| zone_remaining_m | int, active only | Remaining distance in metres |
| zone_progress_percent | double, active only | Progress percentage; preserve estimated flag |
| zone_progress_estimated | boolean, active only | Whether progress is an estimate |
| zone_observation_start_elapsed_ms | long, active only | Start of observed portion |
| zone_observed_distance_m | int, active only | Decrease from initial remaining distance, without double-crediting backward jitter |
| zone_average_partial | boolean, active only | Always true; earlier unobserved parts are unavailable |
| zone_average_method | String, active only | observed_distance_over_elapsed_time |
| zone_average_speed_kmh | double, optional | Observed distance * 3600 / elapsed milliseconds, after 30m and 3s |

Check status and optional-field presence. Missing values are unknown, not zero. Check `0 <= nowElapsed - observationElapsed <= maxAge` locally, including after the provider dies; Android may omit a final shutdown message. A request or heartbeat timestamp cannot make an old measurement current. Segment changes, reacquisition after expiry and substantial distance/progress reversals reset the observation average.

## Approaching an average-speed zone

An approach is a separate observation, before the active zone. It must not start an observed average or manufacture progress from an already-active zone. An active-zone snapshot takes precedence over approach details for display.

| Extra | Android type | Meaning |
| --- | --- | --- |
| zone_approach_status | String | unknown, ahead, inactive, stale or disabled |
| zone_approach_updated_elapsed_ms | long | Native candidate/approach observation or clear time, or -1 |
| zone_approach_max_age_ms | long | 30000 |
| zone_approach_id | String, ahead only | Opaque native zone/segment identity; at most 160 characters |
| zone_approach_distance_m | int, ahead only | Observed distance to entry, or -1 if unknown |
| zone_approach_distance_estimated | boolean, ahead only | True for a geometric estimate; false for a native approach distance |

Require `ahead`, a nonnegative distance and a locally fresh observation before using an approach distance for an advance warning. A missing or -1 distance is unknown. A clear publishes `inactive`; disabled, stale and unknown observations omit approach details. Neither a request nor a heartbeat refreshes the approach observation.

Waze's supplied 5.26.90.901 APK defines `SegmentInsightInfo.PositionRelativeToSegment.APPROACHING=0` and `WITHIN=1`. For average-speed-camera segment type 7, the exporter reads the native APPROACHING identity and `remainingDistanceMeters` separately from WITHIN active-zone data. Flitsmeister's `AvgSpeedCheckTask` has a native candidate before path entry. Its directed report/segment path distinguishes pre-entry from active/exit; the pre-entry distance is the straight-line distance to that candidate's start and is explicitly estimated. It is not a measured route distance. A fresh GPS fix cannot continue using an old Flitsmeister candidate indefinitely: another native candidate observation is required within 30 seconds.

## Road-alert observations

The same state snapshot can carry the provider's currently advertised road reports, independently of the older Waze `org.ungoogled.waze.ALERTS` Maps bridge. Receivers do not need that bridge or a provider overlay. Only fresh reports are included. A valid empty array set is an explicit empty-list observation; stale/disabled/unknown snapshots omit all alert arrays.

| Extra | Android type | Meaning |
| --- | --- | --- |
| alerts_status | String | unknown, valid, stale or disabled |
| alerts_updated_elapsed_ms | long | Last native report-list observation/clear time, or -1 |
| alerts_max_age_ms | long | 30000, also the maximum age of each entry |
| alert_ids | String[] | Opaque report identities, each at most 160 characters |
| alert_kinds | String[] | Normalized kinds listed below, each at most 40 characters |
| alert_titles | String[] | Provider titles, each at most 240 characters |
| alert_updated_elapsed_ms | long[] | Observation time of each report, preserved across aggregate updates |
| alert_distance_m | int[] | Current observed distance to the report, or -1 if unavailable |
| alert_trigger_m | int[] | Provider warning threshold, or -1 if unavailable; never the current distance |
| alert_latitude / alert_longitude | double[] | Report positions in degrees; NaN if unavailable |

All arrays have identical lengths and contain at most 512 entries. Validate their types, lengths, supported kinds, coordinates and observation times before use. Scope report identities to `source_package` and `publisher_session_id`; the same ID in a different provider/process is not the same observation. Check both list freshness and each entry's own `alert_updated_elapsed_ms`. Updating the custom Flock list cannot make an older native Waze camera report fresh. Publisher-side expiry removes old entries from later snapshots, and consumers must also expire them locally if publication stops.

Normalized kinds are `camera`, `mobile_camera`, `police`, `hazard`, `crash`, `jam`, `closure`, `flock` and `average_speed_zone`. They describe the source's available report categories, not a promise that every provider supplies every kind or that every nearby road incident is known. `average_speed_zone` in a report list is not proof of active enforcement or an approach distance; use the explicit zone/approach observations for those states.

The native Waze repository supplies report positions and a trigger threshold, but no current approach distance in this adapter, so its `alert_distance_m` is -1. Flitsmeister's advertised report list also uses -1 when no native current distance is available. Enabled Waze OpenStreetMap camera layers supply the observed camera distance from their existing heading/proximity check; that distance is geometric, not along a route. `alert_trigger_m=600` means “warn at 600 metres”, not “this report is now 600 metres away”. A consumer may derive an explicitly estimated distance from a fresh location/heading and report position when no observed distance exists; the threshold alone must never trigger a warning.

## App-specific production and lifetime

Waze reads its native LocationSensorListener speedometer callback, including normalizedSpeedKph, plus native legacy/insights zone callbacks. Its speedometer View and zone bar can remain disabled. The patch includes background keep-alive (default 180 minutes); Waze's engine and permitted background location must remain active. Legacy percent is Waze-provided; insights progress estimates the observed remainder. Its road-alert producer is `AlerterNativeManager.b(NativeAlertRepositoryUpdate)`: native descriptor info supplies type/title/position/ID and `triggerDistanceMeters`. Native police, crash, jam, camera, closure and road-hazard categories are normalized into the common kinds. The enabled **Flock cameras** and **Speed camera alerts** layers also export cameras that pass their existing ahead-on-road check; they do not start extra downloads when those layers are off. Native repository export does not depend on **Share Waze Alerts with external applications**. See [Waze bindings](waze/navigation-broadcasts.md).

Flitsmeister captures original AppLocationService fixes before missing GPS speeds are substituted. GPS speed is normalized from m/s; location accuracy and timestamps govern validity. RoadInfoService supplies the final effective limit after variable signs, roadworks and vehicle restrictions. Native active-zone candidates/segments supply their directed polylines; the exporter projects onto that path within 30m and calculates estimated remaining/progress. It updates this geometry with fresh GPS fixes and resets on segment changes. Its distance/time observed average uses the same calculation as Waze and does not rely on the eligibility-gated native sample-average display. Flitsmeister's driving/location foreground service must remain running; closing it clears the feed. Background location and Android power policies still govern delivery. It does not require overlay permission or a route on screen. Road reports come from a once-per-process background subscription to `AppNotificationBus.getBusAlertedReports()` through the actual `fs7.b(b49)` bus API. Only active `AlertedReport` models are exported. `SpeedCam`, `SpeedTrap`, `PoliceHotspot` and incident categories supply static/mobile cameras, police, hazards, crashes, jams and closures; location-based commercial promotions are excluded. Native zone stop clears active/approach state; driving/location stop clears the feed and stops its heartbeat.

The producer module tests exercise the shared schema, speed freshness/zero/missing values, units, averages, projection, out-of-order detection, identity resets, native approach/entry distinction, independent alert ages, payload bounds, reflective bus delivery and lifecycle clearing. The supplied original Waze and Flitsmeister inputs also pass production bundle application/rebuild with fingerprint validation, both with only navigation export and alongside default patches. These checks establish producer bindings and payload behavior, not live-road accuracy.

The earlier independently signed common-action receiver/probes are in `scripts/navigation-probe/`. The Vela-specific test-only native producers and reproducible build/run steps are in [scripts/vela/probes](../scripts/vela/probes/README.md). They drive real patched native methods/model buses with public road fixtures and keep provider Activities backgrounded and overlays off. Compiling these probes does not establish that a live provider-to-Vela phone/Android Auto/voice run passed. Emulator callback/IPC evidence, a completed Vela UI run, physical head-unit rendering and physical driving remain separate evidence boundaries.

[Recorded speed/active-zone baseline validation](navigation-validation.json). The baseline predates the optional approach/road-alert additions; its earlier receiver capture does not establish those new paths or the Vela UI.

## Silent provider startup API, version 1

The updated provider broadcast patches also declare a separate, cold-bindable Binder service: `com.waze/org.ungoogled.waze.NavigationControlService` or `nl.flitsmeister/nl.johninnl.flitsmeister.NavigationControlService`. Maps/Vela bind only to the selected provider during visible use or navigation. The Binder descriptor is `nl.johninnl.navigation.STARTUP_V1`; transaction 1 accepts the interface token and returns an exception header followed by a Bundle with `version=1`, native `state`, diagnostic `engine_state`, and an optional immutable foreground-service PendingIntent named `start`. Transactions run off the receiving UI thread and late replies are discarded after source/session changes.

The provider verifies the framework Binder caller UID against the installed receiver packages. Blank receiver targeting permits `app.vela`, `com.google.android.apps.maps`, `org.ungoogled.android.apps.maps`, and its `.microg` variant. An explicit Receiver package limits the API to that package, as well as targeting the data feed. Request extras cannot impersonate the caller. The PendingIntent targets a private location foreground service, never an Activity. Consumers verify its provider package/UID before sending it.

The private service posts its foreground notification before starting the actual native engine. Waze invokes its Application's guarded WazeInitializer continuation (`com.waze.ls.d(g.d.e)`), which brings NativeManager online and starts the native service using its own session ID. Its readiness requires both `isAppStarted()` and `getInitializedStatus()`. The patch suppresses Application's stale-task UI relaunch/exit path. Flitsmeister starts its existing FlitsmeisterBaseService; readiness follows AppLocationService's native start/stop hooks rather than broadcaster registration.

Health polling runs every 10 seconds, with a faster first check after startup. Startup has a 30-second grace period; retries back off from 5 to 60 seconds. Each authorized health check renews a 15-second lease scoped to the current boot. When checks stop, an engine started by this API shuts down through Waze's native shutdown controller or FlitsmeisterBaseService's normal stop lifecycle. An engine already running or starting independently is never acquired. Opening the provider on the phone or starting its visible car session transfers ownership to the user, including after that UI closes. Car metadata queries alone do not transfer ownership. A late native initialization callback checks ownership and the latest heartbeat again before shutdown. The process-local watchdog survives destruction of the extra sharing service. Android scheduling and native teardown govern completion after the deadline; no force-stop is used. The response adds api_started, health_interval_ms and health_timeout_ms without changing the version-1 descriptor. Engine health is distinct from GPS, road, zone and report observation ages; this API does not change schema-1 freshness or authenticate older broadcasts.

Location grants and Android foreground-service restrictions still apply. The integration uses the documented provider-created PendingIntent path from a visible receiving app; a blocked background start is reported without an Activity fallback. Missing APIs retain compatibility with manual provider startup. No SDK downgrade, privileged helper, root or Shizuku is required. Emulator-only verification tooling lives in `scripts/navigation-startup/`.

### Provider audio during managed sessions

The startup lease also makes the selected provider a quiet data source. Waze and Flitsmeister speech and alert playback are suppressed before requesting audio focus, while native completion callbacks continue. Queued provider sounds are cleared with completion/cleanup; owned player volume is gated per instance and restored when the lease expires. Direct TTS, system sounds and the Waze patch's own camera chime follow the same gate. Saved provider sound preferences and the phone's stream volumes are not rewritten. Maps/Vela audio runs in its own process and retains its existing warning/voice settings. The API optionally reports `audio_muted`.

## Native Flitsmeister warning events

The development native-warning integration adds `WARNINGS_V1` beside this schema-1 broadcast feed and `STARTUP_V1`. Its version is independent. The startup STATUS response advertises the optional `warning_api` Binder endpoint and `warning_protocols`; matching FM and receiving-map patches negotiate it before claiming native warning audio. Waze and older compatible builds retain their existing data/legacy paths without gaining complete native FM warning support.

This authenticated channel carries native `ANNOUNCE`, state-only `UPSERT` and `CLEAR` events with provider session, sequence, warning/revision/announcement identity, semantic content and separate state/audio deadlines. State snapshots and their revisions do not invent announcements. A changed unsaid instruction retains its original authority/deadline; CLEAR cancels it, including when received through resynchronization. A new announcement index requires another actual native announcement.

Provider and callback UIDs, registration challenge, configured receiver package and ownership/grant identities protect this Binder channel on every supported Android version. The pre-Android-14 broadcast-sender limitation documented above remains specific to schema 1. One receiving app owns audio; a display-only recipient cannot infer playback permission from event reception.

Voice/Tone/Silent choices remain capped by the receiving app's native mute. Readiness, acceptance, actual audio start and completion are separate states, and completion is not proof of physical audibility or car routing. Uncertain old output fences replacement grants until positive quiescence or the source-owned parked recovery flow. An engine becoming available does not revive expired announcements. Managed FM silence remains independent of receiver output failure.

See the [protocol core](../support/navigation-alerts/README.md), [reviewed design](superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md) and [artifact/evidence inventory](research/2026-11-03-native-warning-implementation-review.md) for bounds, ownership, replay, compatibility and current proof limits. Final installed, timing and phone/car acceptance remain open; this section does not claim a completed release.

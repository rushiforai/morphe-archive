# Waze navigation broadcasts, schema 1

**Broadcast navigation data** targets Waze **5.26.90.901**. It is a separate, default-selected patch. It reads native engine callbacks, without the speedometer View, an Activity, the average-speed overlay, or Share alerts with Maps. Its optional `receiverPackage` patch option restricts delivery to one Android package; blank sends implicit local broadcasts to compatible running receivers.

The patch automatically includes the existing **Stay awake in the background** control. While navigation broadcasting is enabled, that keep-alive is effective even if its separate runtime switch was previously off. Its patch option defaults to 180 minutes; choose a longer timeout for longer route-less sessions. This extends Waze's own idle timeout, not Android's process lifetime. The keep-alive is also applied when Waze reports native initialization ready, without requiring a new server sync. Waze must be initialized, its native engine must remain running, and background location must be permitted when required by Android. The broadcaster itself never brings an Activity to the foreground or starts a route. Missing native data expires rather than being repeated as a current observation.

For a receiver compatible with both Waze and Flitsmeister, use the [shared contract](../navigation-broadcasts.md). Both apps publish the common `nl.johninnl.navigation.NAVIGATION_STATE` action; Waze retains the aliases below. The native callback also exports `normalizedSpeedKph` as optional `current_speed_kmh`, with status and a 5000 ms maximum observation age. Zero is valid. The shared source implements both providers' schema and partial-average calculation.

## Actions and transport

- State: `nl.johninnl.waze.NAVIGATION_STATE`
- Request current snapshot: `nl.johninnl.waze.NAVIGATION_STATE_REQUEST`

Extras use only Android primitive types and strings: no Waze Parcelable or proprietary class is needed in the receiver. Register a dynamic exported receiver in a running consumer/service for the state action. A request may be sent with `Intent(REQUEST).setPackage("com.waze")`; Waze's dynamic request receiver exists while its process is running. Requests are throttled to one per second and ignored when sharing is off. A request/heartbeat changes the envelope timestamp, **not** the underlying observation timestamp.

Normal publication is capped at one per second; semantic transitions such as a changed limit, zone identity, clear, or disable may be immediate. Fresh data has a five-second heartbeat when no native change is pending. Stale values are not kept alive as valid values. Switching off sends one clearing snapshot, stops periodic publication and drops queued native updates; enabling starts unknown until new native observations arrive.

On Android 14+, the sender enables framework broadcast identity sharing. A receiver can check `getSentFromPackage()` and `getSentFromUid()` against the installed Waze package/UID. On older Android versions, this open intent protocol does not authenticate the sender. The `source_package` payload alone is not authentication. A target-package option limits recipients but does not authenticate senders. The transport adds no internet connection, device GPS fix or account ID. Optional road-alert arrays can contain report/camera positions; those are not the device location. The [shared contract](../navigation-broadcasts.md#road-alert-observations) defines those additions and their individual observation ages.

## Snapshot fields

| Extra | Android type | Meaning |
| --- | --- | --- |
| `schema_version` | int | `1` |
| `source_package` | String | Sending Waze application package |
| `publisher_session_id` | String | Random per-process session; not an installation/account identifier |
| `sequence` | long | Increasing within the publisher process session |
| `sent_elapsed_ms` | long | Publication time, `SystemClock.elapsedRealtime()` |
| `sent_unix_ms` | long | Wall-clock publication time, for logs only |
| `road_speed_limit_status` | String | `unknown`, `valid`, `stale`, or `disabled` |
| `road_updated_elapsed_ms` | long | Native road observation time, or `-1` |
| `road_max_age_ms` | long | `30000` |
| `road_speed_limit_kmh` | double, optional | Known, fresh road limit normalized to km/h |
| `road_speed_limit_display` | int, optional | Native numeric limit before conversion |
| `road_speed_limit_display_unit` | String, optional | Recognized native unit or nonlocalized `metric`/`imperial` fallback |
| `zone_status` | String | `unknown`, `active`, `inactive`, `stale`, or `disabled` |
| `zone_updated_elapsed_ms` | long | Selected native zone observation/clear time, or `-1` |
| `zone_max_age_ms` | long | `90000` |
| `zone_source` | String, active only | `legacy` or `insights` |
| `zone_segment_id` | String, active only | Native insights segment ID; empty when unavailable |
| `zone_session` | long, active only | Local zone observation session; scoped to publisher session |
| `zone_remaining_m` | int, active only | Waze-reported remaining distance in metres |
| `zone_progress_percent` | double, active only | Native legacy percent or explicitly estimated observed progress |
| `zone_progress_estimated` | boolean, active only | True for insights-only progress derived from the first observed remaining distance |
| `zone_observation_start_elapsed_ms` | long, active only | Start of this observation session |
| `zone_observed_distance_m` | int, active only | Decrease in remaining distance since first observation; small backward jitter is not credited twice |
| `zone_average_partial` | boolean, active only | Always true: this is an observed average, not a certified complete-zone average |
| `zone_average_speed_kmh` | double, optional | Observed distance / monotonic sample elapsed time, after at least 30 m and 3 s |

Unknown/stale/disabled numeric values are **omitted**, never represented as zero. An active zone can legitimately have no average yet. Consumers must check status, field presence, publisher session and observation age. Reject negative ages (for example, cached data from before a reboot). Expire data locally if Waze dies: Android does not guarantee a final process-shutdown broadcast.

## Calculation and native bindings

`LocationSensorListener.updateSpeedometer(int, String, int, double)` supplies the native display units and road limit. English unit aliases are recognized; localized unit labels fall back to Waze's own nonlocalized GENERAL_UNITS setting and GENERAL_DEFAULT_UNITS for automatic selection. Unknown settings stay unknown.

Legacy zone updates come from `NavigationInfoNativeManager.i(AverageSpeedCameraZoneUpdate)` and `h()` clear. Modern updates come from `InsightsInfraNativeManager.c(SegmentInsightUpdate)`, selecting average-speed-camera segments (type 7) in WITHIN position (1). The exact native enum also defines APPROACHING position (0), exported as separate optional `zone_approach_*` observations before entry. Native `AlerterNativeManager.b(NativeAlertRepositoryUpdate)` supplies the optional common road-alert list independently of Share alerts with Maps. See the [approach](../navigation-broadcasts.md#approaching-an-average-speed-zone) and [road-alert](../navigation-broadcasts.md#road-alert-observations) contracts for distances, estimates, list clears and 30-second observation expiry.

The first active feed owns a zone until clear or expiry, so an unrelated feed's empty update cannot terminate it. A changed/acquired native segment ID, a large remaining-distance jump, or a substantial native-percentage regression starts a new observation session. Delayed samples do not move observation time backward. A native clear/end removes active metrics.

The average is `(first_remaining - minimum_remaining) * 3600 / (last_observation_ms - start_ms)`. It is updated from observations rather than fabricated between them. If Waze is opened mid-zone, earlier distance and time are unavailable. Legacy progress uses Waze's percentage; insights-only progress estimates the fraction of the initially observed remaining distance that has been covered. Consumers must preserve these distinctions in their UI.

## Gearslip

**Support Gearslip**, independently default-selected, makes Waze's `HostValidator` accept the package `app.seb3thehacker.gearslip` whichever key signed it. Patching Gearslip re-signs it, so a pinned certificate stops matching. On a phone the allowlist is the only route for a third-party host, because `TEMPLATE_RENDERER` only counts on Automotive.

The check is by package name, not by certificate. Any app installed under that package name is accepted, so install Gearslip only from a source you trust. The validator still requires the caller's UID to own the package, which stops another app from claiming the name.

The patch also adds a narrow manifest package-visibility query. It keeps the three Android Auto certificate entries and does not disable host validation, so other hosts are still rejected. Host admission is separate from head-unit/surface/navigation compatibility.


## Verification

The recorded speed/active-zone baseline below predates the optional approach/road-alert fields. That 29-patch catalog passed 30 application/rebuild runs (combined and every patch independently), with fingerprint validation and no force flag. Its eighteen Waze extension unit tests covered units, observed averages, source ownership, identity/reroute resets, stale/unknown values, heartbeat/request freshness and switching off. Current approach/road-alert producer checks and their evidence boundaries are described in the [shared contract](../navigation-broadcasts.md#app-specific-production-and-lifetime).

On an API36 phone emulator, a separately signed receiver in a different UID/process received snapshots while the Waze Activity was backgrounded and the zone overlay was not applied. The native location provider was resolved through Waze's dependency container; callbacks from the live LocationSensorListener implementation, legacy navigation manager and insights manager were exercised. The probe checked the native background timeout, Gearslip host admission, rejection of an unlisted host and forged UID, and preservation of the original Android Auto hosts. The receiver capture verified framework sender identity, mph and localized-unit conversion, zone progress/average math, ID resets and clearing on disable. Original numeric resource IDs were preserved.

The package-name host check was validated on the same emulator with Gearslip 0.3.31-alpha signed by an unrelated test key. The previous certificate-pinned patch showed Gearslip's "would not start" screen and logged `Unrecognized host`. With the current patch, Waze's car screen opened in Gearslip's phone preview. This covers the preview only, not a physical head unit.

[Recorded checks and artifact hashes](navigation-validation.json). Test sources are in `scripts/waze/navigation-probe/`; the receiver is a test app, not a Vela integration. `scripts/waze/validate_navigation_events.py` checks its JSONL capture. Physical head-unit rendering, all vehicle/Android power policies and live-road data were not tested.

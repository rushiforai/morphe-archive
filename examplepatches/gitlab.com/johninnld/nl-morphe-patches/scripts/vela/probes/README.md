# Native producer probes for Vela

These local test instrumentation APKs drive the supplied patched Waze 5.26.90.901 and Flitsmeister 14.17 native methods. They contain no proprietary classes and never send `NAVIGATION_STATE` or mutate exporter `STATE`/`ALERTS`. The instrumentation reads a private exporter snapshot only to assert what the real producer callbacks produced; that diagnostic Intent is never broadcast. Vela receives the actual publisher's common authenticated broadcast.

Use only the owned API 36 emulator coordinated by the root task. These scripts do not create/start an emulator, install apps, or touch a device. Probe output contains phase names, native publication session IDs, status strings, speed/average values and pass/failure evidence; it does not print coordinates. All report locations are public Davis road fixtures, with a test path along latitude 38.5449 from longitude -121.7540 to -121.7340. The default pre-entry native location is 0.004 degrees west of the test path; the active portion begins 0.003 degrees east of its start. These positions do not describe a real enforcement zone.

## Build and signatures

Patch both providers with the current production Morphe bundle. Set the `Broadcast navigation data` option `receiverPackage=app.vela`. Keep the provider APKs and their instrumentation APKs signed with the **same local test certificate**. An instrumentation signed with a different key cannot attach to the patched provider. The Vela app can retain its independent local signing key.

Compile/dex/link against Android 36 without any target model dependencies:

```sh
python3 scripts/vela/probes/build.py --sdk /Users/jneerdael/Library/Android/sdk --output .analysis/vela-native-probes --compile-only
```

Build and sign both test APKs using a pre-existing local app test key (the default example alias/password matches the earlier navigation probes):

```sh
python3 scripts/vela/probes/build.py --sdk /Users/jneerdael/Library/Android/sdk --output .analysis/vela-native-probes --app-key /absolute/path/to/app-test.jks --alias waze-test --ks-pass pass:android --key-pass pass:android
```

`--ks-pass env:PROBE_KS_PASSWORD` and `--key-pass env:PROBE_KEY_PASSWORD` also work. The builder uses `javac --release 8`, Android build-tools 36.0.0 `d8`, `aapt2`, `zipalign` and `apksigner`. It writes `waze/probe.apk` and `flitsmeister/probe.apk` below the output directory. `--compile-only` produces unsigned APKs and does not require a key. No release signing keys are needed.

## Root-coordinated runtime

The commands below are examples for the root task to run only against its known owned emulator serial. Install the correctly signed patched providers and patched `app.vela` first; satisfy any native startup/location onboarding once. Deny the two providers' overlay permission, leave background location/driving services permitted, and start Vela's native receiver before collecting phases. Both provider Activities are sent to Home before the first fixture observation, so they can be backgrounded together while Vela renders phone or Android Auto UI.

```sh
adb -s emulator-5554 shell appops set com.waze SYSTEM_ALERT_WINDOW deny
adb -s emulator-5554 shell appops set nl.flitsmeister SYSTEM_ALERT_WINDOW deny
adb -s emulator-5554 install -r .analysis/vela-native-probes/waze/probe.apk
adb -s emulator-5554 install -r .analysis/vela-native-probes/flitsmeister/probe.apk
```

Each runner streams `VELA_PROBE_PHASE` and `VELA_PROBE_VERIFIED` instrumentation status records. Capture Vela phone/Auto screenshots and runtime evidence while the corresponding phase is held. Select the relevant provider in Vela before its probe, or switch while a long phase runs. To keep both feeds advertising, start their instrumentation commands in two root-controlled terminal processes; neither probe launches the other provider's Activity.

```sh
adb -s emulator-5554 shell am instrument -w -r -e scenario drive -e hold_ms 15000 nl.johninnl.velaprobe.waze/nl.johninnl.velaprobe.WazeProbe
adb -s emulator-5554 shell am instrument -w -r -e scenario drive -e hold_ms 15000 nl.johninnl.velaprobe.flitsmeister/nl.johninnl.velaprobe.FlitsmeisterProbe
```

The sequence is native approach plus report list, active partial average plus report list, alerts without a zone, then an empty native repository clear. Native current speed is 72 km/h and effective limit is 50 km/h; active observed-distance average is approximately 72 km/h. This deliberately provides overspeed warning inputs. The final clear supplies a stationary zero. Every native sample has a real new elapsed observation time; repeated samples occur 2.2 seconds apart. A phase lasts at least 6.6 seconds, default 12 seconds (rounded up by the sampling loop), so coalesced broadcasts have time to reach Vela and the partial average exceeds 30 m / 3 s thresholds. Custom Waze overlay/Maps-sharing switches are disabled for the fixture; the navigation exporter remains enabled with native background keep-alive.

Arguments:

| Argument | Values and behavior |
| --- | --- |
| `scenario` | `drive` (default), `approach`, `active`, `alerts`, `clear`, `stop`, `stale`; Waze also supports bounded `callbacks` |
| `hold_ms` | Duration of each sampled phase; minimum 6600, default 12000 |
| `final_hold_ms` | Extra time after the final phase with no fixture callbacks; default 0 |
| `end_action` | `leave` (default) or `stop`; stop uses actual provider configuration/lifecycle methods |
| `stale_wait_ms` | No-callback wait in `stale`; default 96000, minimum 31000 |
| `approach_offset_deg` | Flitsmeister only: longitude offset west of the public zone start, default 0.004; finite `0 < offset <= 0.004` |

`active` first holds approach then active. `stop` holds active, then uses the real native stop path. `stale` holds active, stops producing fixtures, then asserts the zone observation timestamp did not change and the report list expired. At the default 96-second wait it covers speed (5 s), report/approach/road (30 s) and active zone (90 s) freshness. If a native source independently produces another observation, the strict timestamp assertion fails rather than calling that a stale test. Keep Vela alive while performing disappearance/fallback checks; finishing instrumentation can end/restart the provider process, which is another disappearance test and is not the same as the in-process stale interval.

```sh
adb -s emulator-5554 shell am instrument -w -r -e scenario stale -e hold_ms 10000 -e stale_wait_ms 96000 nl.johninnl.velaprobe.waze/nl.johninnl.velaprobe.WazeProbe
adb -s emulator-5554 shell am instrument -w -r -e scenario stop -e hold_ms 10000 -e final_hold_ms 10000 nl.johninnl.velaprobe.flitsmeister/nl.johninnl.velaprobe.FlitsmeisterProbe
```

For a nearer Flitsmeister approach within Vela's voice-warning lead, use `-e approach_offset_deg 0.001` (about 87 m at this public latitude) or `0.0005` (about 44 m). The default remains unchanged. Keep the native pre-entry/active assertions: if the closer fix enters the native zone early, that run fails the approach check rather than relabeling an active observation. Neither this argument nor any fixture callback changes production warning thresholds.

```sh
adb -s emulator-5554 shell am instrument -w -r -e scenario approach -e approach_offset_deg 0.001 nl.johninnl.velaprobe.flitsmeister/nl.johninnl.velaprobe.FlitsmeisterProbe
```

### Waze immediate callback verification

The Waze native engine continues to emit legitimate empty `SegmentInsightUpdate` messages because its real JNI route does not enter the fixture zone. Those observations correctly clear a fixture approach/zone before the next 2.2-second hold assertion. The strict hold scenarios keep failing when that happens; retain that failure evidence. Do not weaken production clears or treat a Java fixture as a sustained native route.

Use the separate Waze-only `callbacks` scenario to check the actual callback boundary:

```sh
adb -s emulator-5554 shell am instrument -w -r -e scenario callbacks nl.johninnl.velaprobe.waze/nl.johninnl.velaprobe.WazeProbe
```

It backgrounds Waze and stops its audited concrete platform location listener to prevent stationary device fixes from replacing the fixture's 72/50 values. It then invokes the real approach and report callbacks and checks their immediate output, invokes the real first `WITHIN` observation and checks active identity with the partial average correctly pending, and invokes native empty updates and checks inactive zone/approach plus an empty report list. Each callback and assertion runs in one main-thread operation. It neither waits for a held observation nor manufactures the distance/time samples needed for an average.

Successful stages emit `VELA_PROBE_VERIFIED_CALLBACKS` with `verification_scope=immediate-native-callback` and `held=false`, distinct from the hold scenario's `VELA_PROBE_VERIFIED`. Diagnostic snapshots include public fixture IDs/status/distance and redact non-fixture IDs; no GPS coordinates are printed. The check proves native callback-to-exporter-state behavior. Coalesced receiver delivery, a steady native JNI route, sustained/accurate partial averages and Vela phone/Auto/voice rendering require separate evidence; do not infer them from this marker.

Do not treat a successful producer probe as proof of Vela UI/voice behavior. Cross-check Vela's authenticated sender/session, selected source, phone rendering, Auto rendering, voice mute, expiry/clearing and Flock suppression/restoration during the same observed interval. Real physical driving remains outside these emulator fixture checks.

## Exact native bindings

Waze waits for `NativeManager.isAppStarted`, resolves the real `LocationSensorListener`, insights manager and alerter manager, then invokes:

- `LocationSensorListener.updateSpeedometer(int, String, int, double)` for normalized current speed/effective limit.
- `InsightsInfraNativeManager.c(SegmentInsightUpdate)` with native proto builders. `SegmentInsightInfo.Id.segmentType=7`; `position=0` is the actual APK's `APPROACHING`, `1` is `WITHIN`. An empty info list clears insights.
- `AlerterNativeManager.b(NativeAlertRepositoryUpdate)` with real `Position.IntPosition`, `AlerterInfo`, `AlerterId` and `NativeAlertDescriptor` objects. Native type numbers 10/1/5/2/3/12 supply camera/police/hazard/crash/jam/closure. A trigger of 600 m is the native warning threshold, never a fabricated current distance.
- `NavigationInfoNativeManager.h()` clears legacy active-zone state. Export disable uses the real `Customization` setting path.

Flitsmeister starts its actual base foreground service and resolves the native `ab0.E1` location singleton, `omf.F1` road singleton and `fsi.r.k` average-zone task. It stops the platform location subscription to avoid stationary emulator fixes racing deterministic native samples; the native driving service/exporter remains active. Fixtures invoke `ab0.A(Location)`, `omf.z()` and `iz0.c(Location,float,String)`, not extension producer methods.

The zone is a real no-argument `AvgSpeedCheck` model with id/road/country, GPS path, explicit start/end Locations, 90-degree directed bearing, day/night maximums, and a real `AvgSpeedCheckSegment(1,List<via>,50,50)`. The runner inserts it into the native `i06.d` report cache and selects `iz0.d` before native detection. This supplies the native task's normal candidate input even before GPS-path entry; no eligibility-gated average UI is involved. Each phase recreates current fixes with accuracy/bearing/speed and current elapsed/time stamps.

Road reports are real no-argument `SpeedCam`, `SpeedTrap`, `PoliceHotspot` and `Incident` models with id/road/country/report Location. Incident enum values `SLIPPERY_ROAD`, `ACCIDENT`, `HEAVY_TRAFFIC`, `ROAD_CLOSURE` produce the matching road-warning categories. Each is wrapped in `AlertedReport(BaseReport, AlertStatus.ACTIVE)` and submitted to the actual `AppNotificationBus.getBusAlertedReports().a(List)` bus. The native background subscription must deliver that list before assertions pass. The empty list clears reports. Stop invokes native zone/location `onStop` and stops the native base service.

The fixture modifies native runtime report caches/configuration only inside the isolated emulator process; it does not write the provider report database. Restore/restart the emulator apps after evidence collection. Do not install these instrumentation APKs on everyday-use apps/devices.

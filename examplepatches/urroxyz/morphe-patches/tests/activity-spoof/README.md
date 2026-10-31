# Activity spoof integration tests

The demo is an ordinary Google Activity Recognition consumer, not a protocol-aware receiver. Build it with JDK 21 and Android SDK 36:

```sh
cd demo
./gradlew :app:assembleAlphaDebug :app:assembleBetaRelease :app:assembleControlDebug
```

Apply **Physical Activity spoof [RECEIVER]** to the original Alpha and Beta APKs with Morphe Manager. Leave Control unpatched. Sign both receivers and the Transit transmitter with the same key. Keep APKs and keys out of this repository.

On each demo, grant Physical Activity permission and tap **Subscribe: sampling + vehicle transitions**. The app registers sampling every five seconds and vehicle/walking/still entry and exit transitions through the normal Google SDK. The minified Beta build deliberately retains the supported public SDK API boundaries; fully removed/renamed boundaries are unsupported.

Enable **Spoof Physical Activity** in patched Transit while GO genuinely reports an onboard phase. Both patched demos should receive IN_VEHICLE at 100% confidence and a vehicle ENTER through their original PendingIntent receivers. Control should continue to show genuine provider readings. Turning the setting off should emit vehicle EXIT and resume genuine readings; if no genuine sample has been observed, the patch does not invent a stationary sample.

Also test:

- Request/remove subscriptions and re-register while an override is active.
- Kill a receiver process while a source is active; its subscription capabilities should recover.
- Kill a receiver before enabling a source; existing provider-held callback tokens should be reacquired without another Subscribe tap.
- Kill the transmitter process; its lifetime Binder must withdraw the override.
- Duplicate and stale sequences, multiple sources, unsupported protocol versions, and a sender signed with a different key.

Runtime traces are bounded JSONL files in each app's external files directory under `activity-spoof/events.jsonl`. The demo separately writes the events received by its original SDK consumer to `events.jsonl`.

## Recorded validation

Pixel 10 Pro XL, GrapheneOS: two independent patched demos received the Transit onboard assertion and setting-off withdrawal. Vehicle sampling delivery took 71–102 ms and ENTER took 92–146 ms in the observed live GO run; these are individual observations, not percentile benchmarks. All 21 protocol assertions passed, including multi-source arbitration, duplicate/stale rejection and version checks. An actually different signing certificate was rejected over Binder. Receiver process-death recovery passed, including recovery before a transmitter was active. An unpatched control retained genuine readings.

KineStop 5.6 patches at its standard transition registration/result API calls. The installed receiver accepted Transit's IN_VEHICLE event, started its cue service, and displayed an overlay. The user also confirmed that cues disappeared after alighting. Its auto-start checkbox was initially enabled without a live subscription; toggling that feature off/on registered the original callback successfully. Permission and a checked option alone do not establish an active provider subscription. Receiver applications decide how to react to events; this does not guarantee ownership protection for manually started app features.

`FiltersTest.java` exercises transition-filter extraction using real `play-services-location:21.4.0` and `play-services-basement` classes. Run it with `Sdk.java`, those dependencies and the Android API definitions on the Java classpath. No Google SDK binaries are vendored here.

## Native GO state regression

Transit reads the active model held by GoService, then inspects the native transit segment's `RoutePathType.Riding`. The native `VehicleLocation.containsCurrentUser` flag independently corroborated boarding on the Pixel. A vehicle missing from a map viewport is not treated as alighting. The active trip is scoped to GoService, so previewing another itinerary cannot cancel vehicle activity.

A detour reminder previously replaced the main instruction and caused a false EXIT. Reminder strings are no longer used for the activity decision. Unknown/missing models retain an existing assertion but cannot create one; confirmed non-riding state, GO cleanup, GoService destruction (including direct stopSelf), setting-off and process death withdraw it. A stopped-session fence prevents stale callbacks from reactivating the old ride. Native model flows are eagerly shared and retained by GoService while GO runs.

```sh
python3 tests/transit-onboard/test.py
```

The deterministic test exercises the production transmitter and reader with the inspected Android/model boundaries. It covers detours, translations, unrelated itinerary previews, missing models, alighting, cancellation, new sessions and persisted settings. Device evidence remains separate from these offline assertions.

Bike mode, templates and the activity toggle use the stable `xyz.urro.transit.go.v1` SharedPreferences file. Initialization does not reset it. They survive app restarts and normal in-place updates with the same package/signature. An uninstall, data clear or incompatible package/signature replacement cannot preserve private app settings.

GO location/motion injection is a developer utility under `utils/go-input-spoof/`; it is not compiled into the normal release.

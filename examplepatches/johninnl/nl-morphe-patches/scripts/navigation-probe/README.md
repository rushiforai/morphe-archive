# Common navigation receiver probe

Test tooling only. It is not a Vela/Gearslip consumer implementation and is never injected into patched apps.

Build with `python3 scripts/navigation-probe/build.py --sdk /path/to/sdk --output .analysis/probes --app-key /path/to/app-test.keystore --receiver-key /path/to/receiver-test.keystore`. Both local test key passwords are `android`; app alias `waze-test`, receiver alias `receiver`. Use independent keys for the receiver and apps. Never use production signing keys. SDK build tools 36.0.0/platform 36 and JDK are required.

Patch the supplied originals with **Broadcast navigation data** and `receiverPackage=nl.johninnl.wavereceiver`. Flitsmeister requires the complete split archive including arm64 native libraries and automatically includes Fix PairIP startup. For Waze, include Support Gearslip if running the Waze probe. Sign each test app with app-test and install matching original splits when applicable. Install supplied Gearslip for Waze host checks. Install/launch the separately signed receiver once to clear its stopped state. Grant location/background-location and notification permissions; deny Flitsmeister SYSTEM_ALERT_WINDOW. Use an owned API36 ARM64 emulator.

Run the Waze instrumentation package `nl.johninnl.wazenavprobe/nl.johninnl.wazenavprobe.Probe` and Flitsmeister instrumentation `nl.johninnl.flitsmeisterprobe/.FlitsmeisterProbe`. Save each `am instrument -w` stdout. Each probe prints PUBLISHER_SESSION; the verifier uses that exact process session, since Android can restart the app after instrumentation and emit another initial unknown/disabled snapshot.

Extract the common-action receiver capture using `adb exec-out run-as nl.johninnl.wavereceiver cat files/events.jsonl > common-events.jsonl`, then run:

```
python3 scripts/navigation-probe/verify_events.py common-events.jsonl --waze-log waze-runtime.log --flitsmeister-log flitsmeister-runtime.log
```

The same receiver listens only to the shared action and records primitive extras plus framework sender UID/package. Verification checks both exact probe sessions, independent authenticated UIDs, current speed including valid zero, mph normalization, observed average formula/partial flag, native segment resets and final clear/disable. Native probes background the Activity with Home before driving actual patched producer methods. Flitsmeister stops the emulator's stationary native GPS provider to avoid nondeterministic races with deterministic test observations; its service/task instances remain real. Flitsmeister's overlay permission is denied. This proves hook wiring and local IPC under those conditions, not live-road accuracy or phone/head-unit compatibility.

Wait more than the one-second publication interval after the average sample before clearing or changing a segment; the probes allow 2.2 seconds for this coalesced event.

# Native warning artifact contracts

Inspect the exact original APKs before adding semantic warning or speech hooks. This tool reads DEX with dexlib2; it never starts an app or modifies an APK. The `selection.json` lists raw DEX owners and method names. Every overload of a selected name is included. Missing methods/enums fail inspection.

Requirements: JDK 17+, the project's Gradle-resolved dexlib2/Guava/Gson jars. Use `--classpath` to select explicit jar paths; otherwise the tool selects matching jars from the local Gradle cache. No tools or dependencies are installed automatically.

From the repository root:

```bash
python3 scripts/navigation-alerts/inspect_bindings.py --artifact /absolute/path/to/original.apk --selection tests/fixtures/navigation-warnings/maps-selection.json --expect tests/fixtures/navigation-warnings/maps-contract.json
```

Use `flitsmeister` or `vela` selection/contract pairs for those artifacts. Extract FM's `base.apk` from the supplied APKM first. Input identities are recorded in [the binding report](../../docs/research/2026-11-02-native-warning-bindings.md).

The additional `maps-speech-selection.json`/`maps-speech-contract.json` freezes Maps' current-route, composite-player and original never-played completion bindings. Apply both original-artifact oracles when changing the Maps speech hooks.

FM additionally has an exhaustive coverage inventory:

```bash
python3 scripts/navigation-alerts/inspect_bindings.py --artifact /absolute/path/to/flitsmeister-base.apk --selection tests/fixtures/navigation-warnings/flitsmeister-selection.json --expect tests/fixtures/navigation-warnings/flitsmeister-contract.json --coverage tests/fixtures/navigation-warnings/flitsmeister-coverage.json
```

Add `--require-complete` to reject unsupported categories or entry points. This currently fails intentionally: capture and playback integration are pending. Required native entry points are frozen separately in the contract; deleting a manifest row fails validation. An exported row must reference evidence; an excluded/unsupported row must state its reason. The checker validates disposition shape, and cannot establish runtime truth from an evidence string.

`--output` writes a fresh inventory for review. Do not automatically overwrite the frozen oracle to accommodate an incompatible target. The method hash includes opcodes, widths, register operands, literals, references, branch/switch/array payloads and typed catch ranges, excluding debug metadata. Enum inventories contain raw ACC_ENUM field names; they may differ from runtime `Enum.name()` or JADX aliases. Initializer contracts retain those semantic mappings for Maps.

For private control-flow inspection, add `"include_instructions": true` to a copy of the selection. Keep resulting instruction dumps in ignored `.analysis/`, and use the ordinary selection when comparing frozen contracts. Offsets are obtained by summing instruction code-unit widths; catch rows are not instructions.

## Production Maps runtime cases

Build the Maps instrumentation with `build_native_probe.py`, then use `run_maps_production_probe.py` against a rebuilt candidate. The runner requires the pinned original, verifies the owned emulator and installed APK hashes, and preserves candidate ZIP payloads when test-signing. It rejects blocked/inconclusive observations and retains their instrumentation separately from successful results.

Supported cases are `production` (native original-player regression, hold/final-dispatch fencing, composite teardown and missing-route refusal), `production_speech` (private durable grant, real offline TTS callbacks and bounded synthetic PCM capture), `production_tone` (native static-track head/drain/release with no TTS instance), `production_speech_arrival` (a real native job arriving during the owned warning), and `production_route` (require an app-created current route before P0 preemption/regeneration).

The route case needs the actual intended Maps patch combination, including **Bypass Play Services checks** and its map-data restoration dependency for a re-signed app. A Waze-alerts-only candidate can prove local player/speaker behavior while failing to load online routing. No route model is fabricated to satisfy that case. These component cases do not replace cross-UID FM-to-receiver, physical-phone or actual-car acceptance.

Tests:

```bash
python3 -m unittest discover -s tests -p test_navigation_warning_bindings.py
```

Exact matching does not prove insertion safety, warning eligibility, playback, routing, timing or compatibility after patching. Those gates remain in the reviewed design.

## Private native audio experiments

`build_native_probe.py` builds test-only same-signer Maps/Vela instrumentation. `run_native_probe.py` checks the original artifact digest, its non-signing ZIP payloads, the exact owned emulator/AVD, installed APK hashes and actual native results. It archives previous reports before a rerun and atomically publishes a new result only after successful collection. Raw results stay under ignored `.analysis/`.

`build_fenced_vela.py` produces a private candidate for the specific delayed system-TTS closure race, with exact three-hook verification. `probe/TaggedSpeechFence.java` is a test prototype; it is not part of any extension or release. The native probe's `scenario=fenced` compares tagged cancellation with retained untagged synthetic speech.

See [runtime evidence and reproduction](../../docs/research/2026-11-02-native-warning-runtime-spikes.md). Native model capture, real route regeneration, neural outcomes, audio ownership/replay, full phone/car coordination and complete-warning acceptance remain separate requirements.

`scenario=codec` compiles the production [shared protocol core](../../support/navigation-alerts/README.md) into instrumentation and verifies immutable round trips, native Parcel sizing, UTF-8 rejection and bounded batch splitting without speaking. It does not fabricate native FM capture or prove Binder authentication. The component verification snapshot is in `tests/fixtures/navigation-warnings/warning-core-verification.json` from the repository root.

`scenario=ledger_io` checks the real app-private writer lock, file permissions, 100 fsync/rename commits and descriptor counts. Run `ledger_write` then `ledger_recover` in separate instrumentation processes to check reload/failover fencing, new-consumer rejection and revoked STARTED handling. These fixtures never invoke an audio adapter. Recovery performs explicit provider-internal test cleanup because no real player was created; it does not prove quiescence of a production receiver. The ownership component snapshot is `tests/fixtures/navigation-warnings/ownership-verification.json`.

## Separate-UID Binder fixture

Build three disposable APKs without contacting a device:

```bash
python3 scripts/navigation-alerts/build_binder_probe.py --sdk "$ANDROID_HOME" --output .analysis/native-warning-bindings/binder-probe --key /path/to/private-test.p12
```

The source service permits the actual PackageManager UID of the allowed client; the stranger APK is denied. The client instrumentation checks the remote Binder descriptor, source callback UID, callback challenge, initial snapshot/live ordering, authenticated health PING and grant bookkeeping. Readiness is explicitly simulated and no speaker is created. The synthetic event's NOT_STARTED/quiescent report is justified by that absence of output.

Run only on the designated disposable `native_warnings_api34` AVD, verifying both its name and `ro.kernel.qemu=1` before installing. Each client APK supplies `nl.johninnl.warningprobe.BinderClientProbe` instrumentation targeting itself. Pass `-e unauthorized true` for the stranger. Retain source/build hashes, independently verified installed APK hashes and both instrumentation results. The observed component record is `tests/fixtures/navigation-warnings/binder-verification.json`; it does not establish FM capture, native speech or phone/car acceptance.

## Native FM producer and integrated receiver probes

Build the reflection-only helper with `build_fm_model_probe.py --kind capture`. The `integrated_trigger` and `integrated_matrix` scenarios initialize the installed production endpoint and invoke the actual patched native entry points. They reject an installed test sink and never emit a packet directly or override source coverage. Source mute uses the real managed lease, and the host runner blocks only the owned FM UID's IPv4/IPv6 traffic while retaining exact lease/firewall rollback evidence.

The current capture runner admits only `emulator-5582` / `native_warnings_vela_api34` or `emulator-5584` / `native_warnings_car_api34`, with qemu and API 34 checks. The shared `emulator-5580` profile is rejected after a conflicting external host session; its earlier evidence remains historical. The car coordinator is fixed to the exact 5584 profile and has no generic serial override. Coordinate the assigned AVD before use. Install the independently verified source/helper APKs first. Start the source runner before the real Maps or Vela receiver instrumentation; launch the receiver immediately on `fm_capture_stage=production_endpoint_ready`. The source waits for the actual confirmed and synchronized registration.

For a warm matrix, use `--scenarios integrated_matrix --trigger-family ordinary --trigger-pattern single --event-count 100 --native-id BASE`. One genuine native camera warning named `BASE-warmup` prepares the receiver and must complete before the measured events. Its separate `warmup_record` is excluded from warm latency statistics. Measured IDs are `BASE-001` through `BASE-100`; count one uses `BASE`. Ordinary identities are `SpeedCam:<id>` with `SPEED_CAM/SPEED_50`. `--trigger-family p0` uses `early/AMBULANCE:<id>` with `INCIDENT/AMBULANCE`, native GPS absent and native speed zero.

The `update` pattern requires a real later native UPSERT and revision advance; `repeat` requires a second native ANNOUNCE with an increased announcement index; `clear` removes the model through the actual native callback after observing STARTED. Normal and repeat events require COMPLETED; clear requires INTERRUPTED or CANCELLED. Each model contributes one measured authority, or two for repeat, plus one separate warmup authority per run. All events retain one source session. The source remains alive until terminal acknowledgements and actual receiver source-off/quiescence.

The matrix deadline defaults to 600 seconds, bounded at 900. The host process deadline is receiver-wait plus matrix deadline plus 45 seconds; receiver/coordinator deadlines must exceed it. Drain production diagnostics continuously into private output when collecting 100 events, because the production ring retains 512 rows. Input spacing occurs before native issuance and is recorded separately from delivery latency. These controlled native inputs establish the tested producer/IPC/receiver path; they do not establish detection quality, source lead time, or physical phone/car acceptance.

`build_vela_car_probe.py` builds a separate target-only car observer. Prepare the installed DriveDeck host's genuine **Car preview** UI, preserving its package, preferences and permissions. Start the source, then `nl.johninnl.warningprobe.integration.vela.car/nl.johninnl.warningprobe.integration.VelaCarReceiverProbe` with `reviewed_synthetic_choices=true`, explicit `host_package`, `mode=VOICE`, and exact `expected_warning_id`. After `CAR_RECEIVER_CONFIGURED`, select Vela through the actual host UI. The observer waits for the host-created native car Session, native guide and complete production warning connection; it never launches Vela's phone Activity. `CAR_WARNING_FRAME` records a real active host-window screenshot after a fresh native car frame. Require actual STARTED/COMPLETED diagnostics, managed provider mute, source-off/quiescence, host service/surface bindings, screenshot review and exact preference rollback. A standalone Canvas or manually constructed CarAppConnection does not satisfy this scenario. The observer is a prepared test harness; a successful build does not establish car-session acceptance.

### Parked recovery screen

`build_recovery_probe.py` builds only the reflection-based `ParkedRecoveryProbe` instrumentation for the real FM APK; it includes no target or alert class definitions. The probe requires the explicit `reviewed_parked_empty_state=true` test argument and verifies on the actual source actor that ownership and pending output are both absent before opening the private recovery Activity. It checks the two separate required confirmations, captures the actual window, performs the source-owned reset and verifies successful Activity closure. It does not create a grant/player or clear pre-existing uncertain output.

Run only on an explicitly owned test emulator after verifying exact AVD/API, target/helper hashes, matching signing certificate and an initially stopped source process. Preserve/restore app-startup preference changes and remove only the newly installed helper after stopping the source process created by the test. The recorded runs and cleanup are in `tests/fixtures/navigation-warnings/parked-recovery-verification.json`; actual live-owner refusal and uncertain real-output recovery remain separate acceptance cases.

### Two actual receiver ownership handover

Build `probe/OwnershipReceiverProbe.java` with `build_ownership_receiver_probe.py --target maps` and `--target vela`, using the same private signing key as both installed test APKs. It starts genuine receiver Activities in actual Android freeform windows, selects reviewed source/output preferences through the receiver APIs, and observes the existing session/scheduler/speaker. It never constructs an owner, grant, session or native navigation/ready state. The private off/stop files only coordinate the real source-selection and cleanup calls.

Run `run_integrated_ownership_probe.py` with explicit `--sdk`, `--source-apk`, `--maps-apk`, `--vela-apk`, `--source-probe`, `--maps-probe`, `--vela-probe`, a fresh `--output` and `--reviewed-synthetic-choices`. The pinned source helper must include `scenario=integrated_handover`. The runner permits only the task-owned `native_warnings_car_api34` AVD on `emulator-5584`, verifies installed APK hashes and matching certificates, freezes helpers, fences the source UID network, and restores temporary source permissions and freeform developer settings. Refuse independently changed settings rather than overwriting them.

The original native first camera completes in Maps while Vela remains a confirmed consumer; the source waits for the actual Vela `BUSY` status before requesting Maps source-off. Vela then acquires the real ownership lease and completes a distinct native camera authority. Join both receiver diagnostic archives to source dispositions to require one start per authority and nonoverlapping intervals. This proves that controlled BUSY/release case only; real engine/process death, parked uncertainty recovery, background navigation and car routing remain separate. See `tests/fixtures/navigation-warnings/receiver-handover-verification.json` for the retained accepted run and rejected initial baselines.

Use the same ownership runner with `--scenario death-recovery --death-owner vela` or `--death-owner maps` for actual system-voice process-death and parked recovery. The source helper must include `integrated_death_recovery`. Maps ownership is returned through real Vela source-off and Maps source-on choices before its kill case. The host stops the selected receiver only after source-observed native STARTED, verifies the persisted attempt remains uncertain after lease expiry, positively stops both receiver processes and Google TTS, and checks Android's active-player inventory before signalling the reviewed stopped-output barrier. The source then operates its actual private two-confirmation recovery Activity. A fresh receiver receives a distinct native future authority; audit its full archive for exactly one future start/completion and no old-authority replay.

For deliberate process death, the runner snapshots only each app's `shared_prefs` files while the app is stopped and restores their exact bytes, UID/GID and modes after verified stop. It never restores, deletes or edits the separate `no_backup/morphe-warning-output.bin` ledger; the actual parked UI owns that reset. Keep failed results, partial source reports and immutable helper APKs. A failed/expired observation is not permission to overwrite concurrent app data or claim the kill case passed. Provider-process restart remains a separate test.

### Actual provider-process restart

Use `run_provider_restart_probe.py` with the same explicit SDK/app/helper inputs, a fresh output directory, `--reviewed-synthetic-choices`, and `--receiver maps` or `--receiver vela`. The frozen source helper must include `integrated_restart_seed` and `integrated_restart_recovery`. The seed reaches a real durably acknowledged STARTED before its receiver and provider are force-stopped. Its interrupted result is expected to fail, but verified source network/lease rollback must finish before starting the next source runner.

The restarted source asserts a new provider session with the exact old pending attempt loaded from the existing ledger. A fresh receiver accepts a distinct controlled native warning while fenced and must retain `AUDIO_UNCERTAIN` with zero STARTED callbacks; save its actual window and full private diagnostic archive. Stop the receiver normally, positively stop both receivers/TTS, and check Android's active-player inventory before the actual parked UI reset. A further receiver process may start only a new future native authority. Join Java event-key identities and actual callback/source dispositions; record UI evidence separately from event acceptance and audio fencing. The common exact app-preference, permission, firewall/lease and Android-setting rollback checks apply; never edit the warning-output ledger to make this pass.

For the original Vela phone UI, add `--prepare-vela-ui --receiver vela` to the provider-restart runner. It uses actual observed welcome/data-source/voice controls, temporarily grants only the three declared location/notification permissions needed to skip repeated platform prompts, and verifies the visible warning plus native Settings → Navigation uncertainty text. Original onboarding/preferences and exact permission grants/flags are restored. A failed UI inspection can request only the real parked reset after verified process/player stop; retain its failed outcome.

The isolated phone guest is `--serial emulator-5590` / `native_warnings_ui_api34`. `--maps-package org.ungoogled.android.apps.maps` supports using the separately installed renamed Maps artifact for the other-app baseline without replacing the image's stock Maps. A Maps ownership helper for that target must be built with matching `--maps-package` in `build_ownership_receiver_probe.py`; the runner checks the selected receiver helper's declared target. Do not mutate currently shared 5584 while another task is installing/driving its debug car host.

If a failed test deliberately left a known pending attempt, `integrated_parked_cleanup` permits only that exact `--expected-pending-attempt` and `--expected-old-session`, with explicit `--reviewed-stopped-output` after both receivers/TTS and relevant active players have been positively stopped. It operates the real private two-confirmation recovery Activity. It does not delete or restore the ledger. Verify terminal source network/lease rollback and restore only the original test-owned app preference snapshot afterward; preserve the failed test record.

### Distinct native warning suite

Add `--warning-suite` to the isolated provider runner to use `integrated_warning_suite` instead of restarting the source. It invokes eleven accepted original native announcement entries: SPEED_50/100/130 cameras with corresponding controlled native input speeds, WRONG_WAY_DRIVER/PERSON_ON_ROAD/STATIONARY_VEHICLE/OBSTACLE incidents, and AMBULANCE/FIRE_DEPARTMENT/POLICE/ROAD_SERVICE early reports with native GPS absent and speed zero. Early report titles come from the original localized resources. The source never substitutes a packet or coverage flag. The ownership observer retains actual active speaker payloads in addition to diagnostics; join every source authority to that payload and its real start/completion/source acknowledgements.

For the road-service category regression, use `--warning-suite --warning-suite-cases road-service --warning-categories 8` (EMERGENCY only) against each receiver. The helper writes the reviewed category choice through the real WarningPreferences API, then restores it. The corrected early model must remain emergency/P0 without coordinates; an ordinary road-service incident and a native stationary-emergency source remain separate policies. The input speeds and accepted-entry timestamps do not prove upstream native detection quality, natural source lead or a moving route test.

For overlapping external warnings, use `--warning-suite --warning-suite-cases concurrent` with the `integrated_warning_suite` helper. One real native warmup precedes three pairs: two P1 dangers, a farther P0 while a nearer camera is genuinely STARTED, and two P0 authorities issued within eight seconds. The source observes actual dispositions rather than creating leases/grants. Require a positive started-camera stop (`INTERRUPTED` or explicit `CANCELLED` with started=true) before the urgent grant; transient uncertainty must remain fenced until that stop.

Run `verify_concurrent_warning_evidence.py RAW_RUN_DIRECTORY...` offline to join source authorities, actual speaker payloads, exact native callback identities and source dispositions. It rejects duplicate starts, missed immutable start deadlines, overlapping native callback intervals, missing terminals, wrong text, and failed cleanup. A physical output-routing or real route-guidance claim requires separate evidence.

### Source-driven Maps native guidance

Use the isolated warning-suite runner with `--receiver maps --warning-suite --warning-suite-cases native-guidance`. Supply a matching ownership helper built with `MapsVoiceProbe.java` and `MapsRouteReadinessProbe.java`; the helper loads the existing product speaker/coordinator/manager rather than constructing those objects. The runner temporarily grants the declared location/notification permissions and sets the disposable emulator to the recorded Amsterdam start fixture. The actual navigation intent plus original setup controls must produce native active navigation, a current route and a current step.

The helper submits controlled original TEST_NAVIGATION_VOICE/TEST_AUDIO media to that actual manager, waits for real start and advancing media position, then signals readiness. Only then may the actual source invoke the native road-service announcement entry point. Require controlled media stop/release before external STARTED, one external completion/source ACK, and a new PULL_GUIDANCE job from the current native route after release. Keep source, speaker and media timestamps on the shared elapsed-realtime clock. The temporary controlled WAV is deleted; ordinary navigation caches may remain in the disposable guest. This case does not establish a natural maneuver trigger or physical/car routing.

Use `--receiver vela --prepare-vela-ui --warning-suite --warning-suite-cases native-guidance` for the actual Vela route path. Its original navigation intent/Start control must create an active original nav session with current state and polyline. The witness uses the existing selected system guide, temporarily forwards its exact original listener, and submits one controlled native instruction before the source warning. Only `vela-<signed integer>` content IDs count as native words; `vela-lead-*` preambles do not. Correlate the controlled content ID to the original text hash. After source completion the runner sends a fresh emulator fix; require a distinct original native content start on the same active route before normal cleanup. Restore the original listener and temporary observation policy exactly. No route/session/guide or audio-ready flag may be fabricated to make this pass.

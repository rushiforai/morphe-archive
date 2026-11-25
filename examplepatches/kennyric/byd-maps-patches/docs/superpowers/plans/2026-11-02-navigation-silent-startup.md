# Silent Navigation Startup Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement task-by-task.

**Goal:** Silently start and recover the selected Waze/Flitsmeister provider from Maps/Vela.

**Architecture:** A shared Binder control protocol returns a provider-owned immutable startup PendingIntent and native health. A private foreground service initializes the native engine. Shared receiving clients monitor health asynchronously during visible/navigation sessions and retry with backoff.

**Tech Stack:** Java Android services/Binder, Kotlin Morphe patches, Robolectric/JUnit, Python artifact checks, Android 16 emulator.

**Spec:** docs/superpowers/specs/2026-11-02-navigation-silent-startup.md

## Global Constraints

- Exactly the four supplied originals; no provider Activity launch and no physical device operations.
- Preserve freshness, permissions, package identity checks and existing user work.
- Every author/committer is johninnl; no manual release version changes or stable promotion.

## Review Focus

- Native engine not ready even though Application/service exists: startup must finish native initialization.
- No GPS fix: do not restart a healthy provider or mark observations fresh.
- Late replies after source switch: cannot restart the previous provider.
- Untrusted Binder caller: cannot obtain the startup capability.
- Process death/screen off: reconnect without UI, bounded retries if Android refuses.

### Task 1: Shared control and lifecycle policy

Files: support/navigation-startup/src/main/java/nl/johninnl/navigation/startup/{StartupProtocol,StartupPolicy,ProviderControlService,ProviderEngineService,NavigationClient}.java; extension Gradle source sets; Waze unit tests.

- [ ] Write behavioral tests for the review conditions, caller validation, lease expiry, backoff and session selection; run and observe missing functionality.
- [ ] Implement protocol, service base classes and client with worker-thread IPC and main-thread lifecycle integration.
- [ ] Run the shared tests and affected extension suites.

### Task 2: Provider native startup

Files: extensions/{waze,flitsmeister}/.../Navigation{ControlService,EngineService}.java; provider broadcast helpers; patches/{waze,flitsmeister}/*NavigationBroadcastPatch.kt; shared resource helper.

- [ ] Add failing tests for native initialization, readiness and permission/disabled status.
- [ ] Wire Waze Application WazeInitializer and FlitsmeisterBaseService, guarding original DEX ABI; declare exported control and private location foreground services only with the broadcast patch.
- [ ] Apply patches to the supplied originals and validate native engine cold-start in emulator with neither provider Activity opened.

### Task 3: Maps and Vela integration

Files: ExternalTelemetry.java, TelemetryRuntime.java and respective patches/resources.

- [ ] Add failing tests for automatic selection/start, resumed activities, navigation/car sessions, source-off and stale health replies.
- [ ] Integrate shared NavigationClient with selected source/lifecycle and human-readable connection status. Keep all observation validation intact.
- [ ] Run consumer unit tests and apply changed patches to supplied Maps/Vela originals.

### Task 4: Runtime recovery and documentation

Files: scripts/navigation-startup/*, docs/navigation-startup-validation.json, shared contract and bilingual navigation guide/app docs.

- [ ] Build a separate-UID emulator probe and verify genuine native initialization plus process-death recovery and foreground Activity invariants.
- [ ] Exercise all four provider/consumer combinations, missing permission and source-off cases; retain logs and hashes.
- [ ] Document setup, silent behavior and demonstrated platform boundaries.

### Task 5: Review and delivery

- [ ] Run Python suite, release-workflow Gradle checks, changed-artifact patch validation and identity audit.
- [ ] Obtain a fresh whole-branch review and resolve material findings with regression tests.
- [ ] Commit under required identity, push feature branch and open a reviewable PR; no stable promotion.

### Task 6: Mute provider audio during API-managed sessions (user addition)

- [ ] Trace the supplied providers' central speech and alert playback paths and callback/completion contracts.
- [ ] Add failing behavioral tests for lease-scoped muting, restoration, queued audio, and unchanged telemetry/main-map sound.
- [ ] Gate native provider audio before initialization without changing saved preferences or device volume.
- [ ] Rebuild/repatch both providers, verify speech/effects muted during API sessions and restored outside them on the emulator, and document behavior.

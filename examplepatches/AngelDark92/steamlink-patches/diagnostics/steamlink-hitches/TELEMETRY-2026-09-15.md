# Decoder pipeline telemetry v2 — 2026-09-15

**Current FEC trial revision:** use the [FEC guard deliverable and selection](EXPERIMENT-2026-09-15-fec-duplicate-reservation.md). Its rebuilt pipeline helpers accept the guard and add post-Periodic marker snapshots plus packet-context acquisition observations. The original v2 archive described below is historical and cannot be combined with the new guard. Existing live evidence below concerns earlier helper hashes; current helper activation remains pending.

## Why this exists

The user still experienced whole-view freezes with Decoder input buffering v1. USB inspection of the installed **2.0.23/5002363** APK confirmed the exact v1 Buffered helper: SHA-256 `fc8934f90c96aef04c36117ab3ac9677e7d8f5755701d030e6e9d019ac50cd1b`, mode 1, successful hook activation. V1 is **tried, not a proven fix**. Do not propose the same staging change again as though it were untested.

The new work adds measurement. It does not suppress resets, change codec timeouts, replace the decoder, or change SteamVR settings.

## Fresh evidence

Capture: `build/live-hitch-20260915/telemetry-followup/capture`, PID 11656, 180 s logs/memory and 120 s Perfetto. Host evidence: sibling `telemetry-followup-host` directory. Raw captures remain local/ignored because they contain private session information.

- 10 decoded-buffer delivery gaps exceeded 50 ms. The largest were **361.528 ms** and **365.752 ms**, with repeated codec flushes during recovery. These measure decoder surface delivery, not physical panel presentation or user-marked freeze counts.
- Codec2 tracing exposed 10,612 input queues and 10,612 completion callbacks, including 5 timestamp-0 callbacks during recovery. Output starvation followed interrupted input delivery; this does not establish 360 ms of decoder execution.
- PSS changed from 956,507 to 955,467 KiB; EGL/GL allocation columns stayed constant. No large growing leak was measured. Short/capped/driver leaks are not excluded.
- V1 helper faults increased 59→64 and flushes 71→77. All visible helper reports were routine acquire/submit reports: the shared 1 Hz limiter suppressed the actual reasons. Helper faults are not independent reset counts because stock submission can signal the same error first.
- Maximum app runnable wait was 14.903 ms. The 2 longest gaps were not explained by a comparable scheduler stall.
- Device/host clock brackets place the starts of those 2 long gaps **187–266 ms** and **87–166 ms before** their first host reset requests. Those resets cannot initiate these 2 interruptions, but may prolong recovery. Host encoder reinitialization itself was around 1 ms; reset request-to-execution delay could be much longer.
- `wgp id` in the host warning is a **pose-cycle ID**, distinct from the video frame ID/acknowledgement. Do not join these counters as though they represented the same frame sequence.

Trace-health caveat: parser/other producer loss counters were nonzero. Ftrace CPU overruns and ring overwrite were 0; noninitial packet-loss markers were localized to other track-event producers. Paired codec stages and the sleeping ImageReader corroborate the long output gaps. Detailed health evidence and exact frame chains are in `trace-analysis/REPORT.md` and `telemetry-followup-host/RESET-TARGET.md`.

## The apparent APK crash was a host crash

Windows recorded `vrmonitor.exe`, PID 21408, crashing at **19:29:17** in `Qt5Gui.dll`, exception `0xc0000005`, offset `0x64c96`. SteamVR then logged loss of its master process and shutdown of OpenVR processes. The headset received `SYST_SERVER_SHUTDOWN` at approximately **19:29:23**, completed decoder/session teardown, and called `System.exit(0)`. Android recorded `EXIT_SELF`, status 0 at 19:29:35; the crash buffer was empty.

This establishes why Steam Link closed in that incident. The underlying Qt crash trigger remains unknown. Existing Windows dump paths/hashes are retained in `telemetry-followup-host/crash-dump-inventory.json`; no host repair or restart was performed by this investigation.

## Select and capture v2

Archive: `patches/build/libs/patches-1.18.0-dev.1-decoder-pipeline-v2-local.mpp`.

SHA-256: `5a232e650c4485913c16fc56063b10b05e5c0e4554561d32a6d9b05a8ab3859f`.

1. Apply the matching existing recommended bundle plus **Decoder input buffering (experimental)** separately.
2. For the next capture, choose **Observe + pipeline telemetry**. The user requested a stock-path diagnostic after v1 failed to solve the freezes. This uses the same patch entry to access telemetry but disables buffering. **Buffered + pipeline telemetry** remains available only for a deliberate later comparison of v1's hidden fault reasons.
3. Plain **Buffered** and **Observe** retain the original v1 binaries. Defaults, older build adaptations, and bundle memberships remain unchanged.
4. After installation and streaming, confirm a `v2 installed ... telemetry=1` log and `installed 18 data hooks`. Failure logs mean the hooks did not activate; do not infer results from the selected mode alone.
5. Capture a bounded 90–120 s Perfetto trace with `capture_live.py`, keeping the same scene. Its existing `atrace_apps` entry enables this package. Require nonzero `GXR2` slices in the resulting trace before interpreting the added telemetry.

This uses the [Android native tracing API](https://developer.android.com/ndk/reference/group/tracing), with tracing disabled unless selected and enabled by the capture. On Android 14 the app tracing allowlist does not require adding `profileable` to the manifest; no permission or manifest changes were added. Device activation is now verified below; comparative overhead remains unmeasured.

## What the telemetry records

- `assemblyAcquire`: staging/stock input acquisition for a frame; `completeSubmit`: complete-frame submission.
- `acquireLockWait` / `submitLockWait`, `copyInput`: separate helper-lock and copy spans.
- `dequeueInput` / `inputResult`: exact input index/error and requested timeout.
- `queueInput` / `queueResult`: frame timestamp, result, payload size, input index.
- `dequeueOutput` / `outputResult`: output index/error, valid frame timestamp and size. Negative returns never dereference undefined output metadata.
- `releaseOutput`, `acquireImage`, `imageTimestamp`: progress toward ImageReader delivery, retaining raw image timestamps. No output helper mutex is acquired.
- `nativeFault`: stock fault caller offset relative to the scene library; `helperFault`: separate helper reason; `faultGeneration`: entry/current generation and pre-existing FEC error flag; `periodicFault`: catches already-set FEC flags that can bypass the native fault call.
- `codecFlush` / `codecStop`: explicit recovery boundaries. The analyzer does not join frame IDs across observed resets. These markers are not a complete instrumentation of pose dispatch, socket transport, renderer submission, or physical display timing.

Fault reasons are preserved in 10 cumulative counters, independently of log throttling:

| Counter | Meaning |
|---|---|
| 0 | Staging pool unavailable |
| 1 | Null input ownership pointer |
| 2 | Pointer not owned by staging pool |
| 3 | Stale staging generation |
| 4 | Negative frame size |
| 5 | Frame exceeds 4 MiB |
| 6 | Real codec input unavailable |
| 7 | Generation changed during real acquisition |
| 8 | Frame exceeds real codec input capacity |
| 9 | Original codec submission failed |

Detailed helper fault logs have a separate limit of 8/s per instance and a suppressed-event counter. Perfetto fault events are independent of that log limit. Routine packets do not produce per-packet tracing or synchronous file writes. Detailed logs, formatting, tracing, copying and existing locks have overhead; compare equivalent capture modes.

Run `analyze_pipeline.py --self-test` for parser validation; use `--help` for the actual trace command. It exports stage timings, signed results, faults, reset boundaries, and conservative frame groups. An absent telemetry section is reported explicitly.

## Build and compatibility validation

- Exact **2.0.22/5002322** and **2.0.23/5002363** only; old resources stay SHA-identical. New resource hashes are pinned separately in Kotlin.
- 113 Kotlin tests passed, 0 skipped/failed. Cached local compilation was used; this is not a claim that the unresolved Gradle plugin path now works.
- 26 actual Morphe APK cases passed from the published archive using both verified pristine input APKs: both bundle baselines and all 4 modes standalone/in both bundle orders. Other ZIP entries stayed identical to the appropriate reference (113 standalone, 116 combined; signatures excluded).
- 10 additional real Morphe transitions passed: v1→Buffered telemetry→reapply→Observe telemetry→reapply→v1, on both bases. Mode changes affected only the helper; reapplication and final v1 restoration preserved all 118 ZIP entries byte-for-byte. The [validation receipt](decoder-pipeline-v2-validation.json) retains every case and hash.
- Native bridge: 12 scenarios on each exact build, plus pool tests. Production telemetry wrappers: 6 scenarios covering 7 APIs, forwarding, poisoned/undefined output pointers, trace gating, nested frame contexts and 2-thread isolation.
- Runtime loader: original 8 function guards/11 slots retained for ordinary mode; telemetry adds 7 exact GOT targets in the same 18-slot preflight/write/rollback transaction. Real NDK symbols are resolved from the retained media library. Unknown code, build IDs, mappings or original targets fail activation.
- Catalog regression preserved all other patch metadata and the stable catalog's logical contents. No bundle gained this experiment.

Rebuild helpers with `extensions/decoder-input-buffering/Build-Native.ps1 -CopyResources`; this writes only `_telemetry.so` resources. Update the 2 telemetry hash pins from validated output, then use `Build-DecoderExperiment.ps1`. Canonical payloads remain required inputs because release CI does not rebuild them.

At initial publication the v2 APK had **not** been installed or tested on the headset by the agent. The user chose to install it using their existing workflow; activation and new capture results must be appended after verification.

## Live Observe v2 results, 2026-09-15 20:00–20:09

User installation is now verified on **2.0.23/5002363**, mode 2, exact configured helper hash, all 18 hooks active, buffering disabled. The first and follow-up traces contain 306,058 and 136,871 GXR2 events. They directly expose input reservations, reset recovery and **UDP receive-buffer overflow at the app socket**. The finer capture attributes 3,793 dropped packets to that socket, including 971 during an output-gap interval without a decoder-input timeout or flush.

See [Observe results and the historical patch candidate](OBSERVE-RESULTS-2026-09-15.md) for timings, limitations, native addresses on both supported builds, and the 1→8 MiB receive-buffer experiment. No socket patch was applied during that capture. The subsequent [UDP live trial failed and worsened freezes](UDP-RESULTS-2026-09-15.md); it is no longer recommended. Buffered v1 remains tried and insufficient; ADB was stopped after capture.

The [Android XR and cross-PC follow-up](XR-HOST-COMPARISON-2026-09-15.md) checks the compositor through all 19 measured output gaps, live Android routing/thermal state, actual 2.0.20 transport/decoder differences, and historical/current host evidence. XR presentation continues through those gaps. The legacy transport's 24 MiB request versus the newer transport's 1 MiB request is a version-specific lead; host timing and receiver headroom remain unresolved contributors.

## Cleanup

After recording all APK hashes, test results and reproduction sources, 63 generated targets were removed (2,794,626,624 bytes): audit APKs/decoded temporaries, compiled classes/resources, native CMake output and duplicate local archive copies. The published MPP, canonical payloads, exact bases/tools, current captures and compact evidence remain. See [workspace cleanup](../../WORKSPACE_CLEANUP.md).

A separate review-test EXE/PDB remains because automatic approval review rejected its removal with only “blocked by policy.” That rejected action was not retried through another deletion mechanism. Another repository's `ThirdParty/json` submodule lost a pre-existing modified status during final verification; all deletion targets were inside this repository and that concurrent change was left alone.

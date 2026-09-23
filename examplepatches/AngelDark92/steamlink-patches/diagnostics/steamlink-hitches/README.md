# Live Steam Link hitch diagnostics

These tools capture an already-running USB-authorized Android device and analyze local artifacts. They do not install an APK or restart the app/SteamVR. The video connection can still use Wi-Fi while ADB uses USB.

## Capture

Current finding: [UDP 8 MiB trial failed; freezes worsened](UDP-RESULTS-2026-09-15.md). Before recommending another change, read the [tried-experiment ledger](TRIED-EXPERIMENTS.md), including the unsuccessful UDP increase, decoder staging, and `asyncSend=true` tests.

**All three standalone experiments (decoder input buffering, FEC duplicate reservation guard, UDP receive buffer) were tested, did not solve the hitching, and were removed from source on 2026-09-19 — see the [tried-experiment ledger](TRIED-EXPERIMENTS.md) and the retired-experiments section of [AGENTS.md](../../AGENTS.md) before proposing any retry.** The [FEC experiment record](EXPERIMENT-2026-09-15-fec-duplicate-reservation.md) and [original proposal](RECOVERY-PATCH-PROPOSAL-2026-09-15.md) remain as evidence; the host throttle/retransmit-history and legacy-transport candidates they describe were never shipped and remain unproven.

From the `steamlink-patches` directory, with the headset connected and streaming:

```powershell
python diagnostics/steamlink-hitches/capture_live.py `
  --adb ../Tools/install/platform-tools/adb.exe `
  --serial YOUR_DEVICE_SERIAL `
  --output build/hitch-capture-NEW-RUN `
  --seconds 300 --interval 10 --trace-seconds 90
```

- Use a fresh output directory. The capture records clocks, logcat without clearing it, process/system memory, pressure, thermal state, network counters, and an optional bounded Perfetto trace.
- Default `dumpsys meminfo --local` avoids calling into the app for heap/object enumeration. Heap allocation columns may be unavailable. `--detailed-memory` requests those details, but can trigger explicit garbage collections and introduce pauses; use it separately from timing-sensitive comparisons.
- `--trace-seconds 0` skips Perfetto. Tracing and sampling still have overhead; compare equivalent capture modes.
- ADB is stopped when the collector exits. `--keep-adb` is only for an ongoing investigation whose owner will explicitly stop ADB afterward.
- A successful trace pull is verified before remote deletion. Failed pulls preserve the remote trace for recovery. Inspect `commands.json`, `perfetto-command.txt`, and cleanup output rather than assuming every subsystem was accessible.
- Captures can contain private app logs, device identifiers, and local network information. Raw artifacts belong under ignored `build/`, not source control.

## Analyze memory and logs

For completed fine socket captures, use `analyze_udp_counters.py COUNTERS_FILE --uid CURRENT_PACKAGE_UID --port 10400 --output NEW_DIRECTORY`. Read the current package UID; reinstalling can change it. The parser requires the successful collector's `result.json`, preserves exact counter deltas, and excludes missing/ambiguous sockets and changed identities. `--self-test` exercises parsing and reset handling. Socket accounting does not measure packet age or effective receive-buffer capacity.

```powershell
python diagnostics/steamlink-hitches/summarize_capture.py build/hitch-capture-NEW-RUN
```

Outputs `device-summary.json` and `device-events.json`. Missing metrics remain unavailable; repeated retries do not equal unique lost packets. Log counts and video-buffer gaps are not counts of user-perceived freezes.

## Analyze Perfetto

Use the official [Perfetto trace processor](https://perfetto.dev/docs/analysis/trace-processor-python) and its Python package in a separate tooling directory:

```powershell
python diagnostics/steamlink-hitches/analyze_trace.py build/hitch-capture-NEW-RUN/stream.pftrace `
  --python-tools PATH_TO_ISOLATED_PERFETTO_PYTHON_PACKAGE `
  --processor PATH_TO_TRACE_PROCESSOR_SHELL_EXE `
  --output build/hitch-trace-analysis --pid APP_PID_FROM_CAPTURE_JSON
```

Inspect trace-health errors before interpreting absent events. Android SurfaceFlinger frame timelines need not include native full-space XR video frames. The codec `queueBuffer` timeline is a separate measurement of decoded-buffer delivery.

`correlate_trace.py --help` describes offline host/device correlation. Use bracketed device clock reads: Android and Windows wall clocks differed by about 0.45 seconds in the September 15 run. Do not order cross-device events separated by less than the measured clock uncertainty.

## Current investigation

- [Decoder staging v1: implementation, reasoning, and runtime outcome record](EXPERIMENT-2026-09-15-decoder-staging-v1.md)
- [Proposed experimental patch and implementation requirements](PATCH-PROPOSAL.md)
- [Decoder input ownership and recovery evidence](proposal-codec.md)
- [September 15 live findings](REPORT-2026-09-15.md)
- [Stock native cleanup issue and installed-bundle audit](native-leak-candidate.md)

The follow-up installed 2.0.23/5002363 helper matched Buffered v1 byte-for-byte and was active. Freezes persisted. [Follow-up findings and pipeline telemetry](TELEMETRY-2026-09-15.md) records the failed improvement, the separate host crash, and the next capture. Existing bundle definitions and older adaptations remain unchanged.

`analyze_pipeline.py` exports platform Codec2 frame IDs and optional `GXR2` native telemetry, including fault reasons, stage durations, and conservative reset boundaries. Run `python diagnostics/steamlink-hitches/analyze_pipeline.py --help` for its CLI or `--self-test` for parser checks. Missing GXR2 events mean telemetry was not observed; they do not prove a healthy pipeline.

`stale_feedback_guard_model.py` is an offline model of a secondary host-side candidate. It verifies predicate boundaries and the exact documented DLL file; it performs no patching. Its checks deliberately include an unresolved reconnect counterexample, so passing them is not deployment approval.

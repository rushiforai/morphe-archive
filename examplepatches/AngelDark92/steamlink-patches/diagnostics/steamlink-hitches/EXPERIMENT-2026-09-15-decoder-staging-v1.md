# Experiment: decoder-staging-v1

Date: 2026-09-15. Status: **tried on headset; freezes persisted**.

Follow-up: the user reported little improvement. The installed 5002363 helper exactly matched the Buffered v1 resource and its activation logs confirmed execution. A fresh 120 s trace still contained 361.5/365.8 ms decoded-output gaps; a 180 s capture showed 5 additional helper faults and 6 flushes. This is not a controlled stock-versus-v1 performance comparison, but it disproves treating v1 as a completed freeze fix. Its throttled logs lost fault reasons, so [pipeline telemetry v2](TELEMETRY-2026-09-15.md) adds observation rather than repeating the same proposed remedy. Original v1 binaries remain as selectable comparison baselines and for existing-build compatibility.

Patch name: **Decoder input buffering (experimental)**. Exact targets: **2.0.22/5002322** and **2.0.23/5002363**. Default-off, with no dependencies and no membership in any recommended bundle. Select this patch separately alongside the corresponding existing bundle. Mode **Buffered** is the experiment; **Observe** retains the original input path and adds counters.

## Hypothesis and decision

Live captures showed whole-view freezes, an approximately 1.99-second decoded-output gap, and input-buffer-unavailable events associated with FEC recovery/reset bursts. The 150 Mbit/s comparison did not noticeably improve freezes. The measured process/graphics memory stayed approximately flat. These observations identify a test target; they do not establish a leak or prove that input starvation causes every freeze.

Both exact binaries acquire a MediaCodec input buffer when a fragmented frame starts. FEC holds that buffer during assembly and ordered delivery. An unavailable input after the stock 20 ms wait propagates into recovery. The experiment removes those early reservations: incomplete compressed data goes into application staging, and the codec buffer is acquired only at actual complete-frame submission.

The earlier [proposal](PATCH-PROPOSAL.md) included a decoder worker. **That worker was not implemented in v1.** Further tracing found renderer metadata retained in a 16-frame RX ring and submission timestamps published by the synchronous caller. A worker would require additional metadata/acknowledgement lifetime changes. Keeping submission synchronous isolates the early-reservation hypothesis and preserves the existing timing, metadata, image, and renderer paths. The 20 ms wait can still happen for a complete frame; v1 does not solve genuine decoder backpressure.

This is a new input-staging experiment. The retired decoder-to-Surface experiment remains retired; its rendering changes are not reused.

## Actual implementation

- The APK changes only the scene's verified `DT_NEEDED` string `libmediandk.so` to the same-length `libgxr_dbuf.so`, and adds the matching helper. The helper itself retains the real `libmediandk.so` dependency.
- Before scene constructors run, the helper verifies the exact GNU build ID, immutable input/lifecycle functions, and original relocation-backed pointers. It changes 11 data pointers covering Acquire, Submit, Init, Flush, Stop, destructor, the FEC periodic check, and packet acceptance. It does not rewrite executable instructions. Failed activation logs an error and retains stock behavior.
- Runtime mapping checks support the Visual Delay patch's existing PT_NOTE conversion. The GNU note bytes remain verified through their readable load segment. Runtime page permissions are restored after pointer installation.
- Buffered mode has 24 lazy staging slots of 4 MiB: **96 MiB maximum backing allocation per codec**. This follows the observed FEC 4 MiB assembly limit; the completed frame is independently checked against the actual codec input capacity before copying. Normal frames add 1 compressed-data copy.
- At submission, v1 calls the original acquisition function, copies the complete compressed bytes, and calls the original submission function with the original frame ID, size, and marker flag. The stock caller records timestamps in its existing sequence. No asynchronous success is fabricated.
- Acquisition/capacity/ownership/queue failures explicitly reach the original FEC fault path. Returning `false` alone would be wrong because the caller ignores it. Genuine codec recovery remains active.
- Flush, Stop, and Init advance the generation but quarantine existing staging leases. Buffers are reclaimed only after the original periodic error check, and only when absent from all 16 RX pointers and 128 pending pointers. Nested Stop/Init during acquisition cannot recycle a pinned submission. Backing allocations are freed after the original codec destructor; a bounded startup memory increase is expected before that.
- A receive timeout can enter recovery from another transfer thread without the normal packet lock. Buffered mode therefore holds a shared recursive mutex across the full packet acceptance function and periodic recovery. This covers pointer publication, fragment writes, and pending transfer. Ordinary packet checks do not scan the pool, read a clock, or log; reclamation runs only after a generation change. The mutex adds overhead that still needs headset measurement.
- The helper's statically linked C++ runtime symbols are hidden so they cannot replace Valve's C++ runtime through dependency lookup. Only the protected configuration object is exported.
- Observe mode forwards original input calls. Aggregates include instance/generation, acquisition/submission/fault counts, staging usage, observed reservations, maximum acquisition/copy duration, and copied bytes. Routine aggregates emit at most once per second per instance; teardown emits a final record. Existing stock logs retain exact codec error results. Counters are not physical-freeze counts.

Source: [native helper](../../extensions/decoder-input-buffering/src/decoder_buffering.cpp), [installer](../../patches/src/main/kotlin/app/template/patches/steamlink/binary/DecoderInputBufferingPatch.kt). Exact hashes, function sizes, addresses, relocations, and ABI reasoning: [layout audit](decoder-hook-layouts.json), [injection audit](decoder-injection-audit.md), [ownership trace](implementation-ownership.md).

## Validation and artifacts

The [validation receipt](decoder-staging-v1-validation.json) records source/payload hashes, every APK output hash, checks, and cleanup. Native host tests use the production pool and production bridge wrappers with a fake codec/FEC. Actual decoded-library and APK checks are separate from those simulations. No APK installation or SteamVR change was performed.

- **112 JUnit tests passed**, 0 skipped or failed.
- **12 production-bridge scenarios passed on each build** (24 executions), including a 2-thread packet-publication/recovery test; separate pool bounds/generation tests passed.
- **14 Morphe APK cases passed from the packaged MPP** using both signature-verified original APKs: 2 existing-bundle baselines plus standalone/bundle-first/decoder-first in Observe and Buffered modes on both bases. Apart from the decoder scene dependency and helper, all 113 standalone or 116 combined reference ZIP entries remained byte-identical; signature entries were excluded.
- The runtime loader's 8 function guards and all 11 relocation targets were independently checked against both stock libraries and all 14 APK results, including Visual Delay's header mapping. Both native helpers have 16 KiB load alignment and export only the protected configuration object.
- All 4 catalog regressions passed: existing compatibility, defaults, options and dependencies are unchanged; the stable catalog has no new entry. Each modern recommended bundle still contains exactly its original 6 patches.

Artifact: [`patches-1.17.0-dev.2-decoder-staging-v1-local.mpp`](../../patches/build/libs/patches-1.17.0-dev.2-decoder-staging-v1-local.mpp).

SHA-256: `158a009ab1ca6d01747763a09f9bd61d609216452996d07e7822eb8f193f5320`.

These are local native/Kotlin builds and offline APK checks. Android hook activation, freeze improvement, copy/mutex overhead, and reconnect behavior still require headset testing. The memory-staging cap is a code bound, not a measured headset memory result.

Rebuild entry points:

```powershell
extensions/decoder-input-buffering/Build-Native.ps1 -CopyResources
extensions/decoder-input-buffering/Test-Native.ps1
diagnostics/steamlink-hitches/Build-DecoderExperiment.ps1
```

The native helper is locally compiled with the available Android NDK. The Kotlin/package route uses cached dependencies because the existing Gradle plugin resolution problem remains separate from this patch.

## Runtime result to retain

Use a pristine source APK, select the matching recommended bundle and this standalone patch, and choose Buffered. Preserve a known-working APK for rollback. A newly patched APK is needed to switch modes; this is not a live settings toggle.

Rollback uses that known-working APK or a pristine APK patched without this experiment. Merely deselecting the patch while reusing an already-patched input does not remove its helper/dependency. An unrecognized older helper is rejected rather than silently overwritten.

Verify the `GxrDecoderBuffer` startup record says `installed`, the correct build, and `mode=buffered`. A disabled hook message means the experiment did not run and cannot count as an efficacy test. Compare the same scene and bitrate with equivalent light capture settings. Record visible freezes, decoded-output gaps, input failures, reset bursts, copy time, and memory plateau; fewer log messages alone are not success. Reconnect/stop/start must also be checked for native failures and retained allocations.

| Outcome field | Current value |
|---|---|
| Installed/tested APK SHA-256 | Pending |
| Activation log, build, mode | Pending |
| Same-scene baseline and test captures | Pending |
| User-observed freeze change | Pending |
| Decoded-output gap comparison | Pending |
| Input failures/reset comparison | Pending |
| Reconnect/teardown and memory result | Pending |
| Decision | Do not recommend by default before runtime evidence |

If the user reports no improvement or regression after verified activation, mark **decoder-staging-v1** failed/retired here, retain the tested artifact hash and observations, and keep it out of recommendations. Do not reintroduce the same mechanism under a new name without explaining new evidence or a substantive change. If activation failed, record that separately from an ineffective mechanism. If it helps, retain the evidence before considering any bundle change.

## Cleanup policy for this run

Keep source, tests, the final selectable `.mpp`, shipped native payloads, concise audit receipts, and this reasoning/outcome record. Remove temporary compilation trees, duplicate audit APKs, and temporary test executables once their checks and hashes have been captured. Preserve pre-existing raw hitch evidence and original/decoded source APKs for the still-open runtime comparison. ADB remains stopped; no device command is needed to build this experiment.

**Cleanup execution blocked:** automatic approval review rejected the recursive temporary-folder cleanup and an individually verified temporary APK deletion, stating only “blocked by policy.” Temporary outputs therefore remain. The [guarded cleanup script](Cleanup-DecoderExperiment.ps1) verifies the final package and audit APK hashes, checks all resolved paths/reparse points before deletion, and updates the receipt after success. Its syntax was checked; it was not executed. Run locally from the repository with `diagnostics/steamlink-hitches/Cleanup-DecoderExperiment.ps1` to finish cleanup. Do not describe the current temporary files as removed.

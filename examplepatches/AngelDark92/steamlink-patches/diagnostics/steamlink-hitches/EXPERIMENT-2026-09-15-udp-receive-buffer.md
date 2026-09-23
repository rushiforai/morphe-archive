# UDP receive buffer v1 — 2026-09-15

## Purpose and status

The user authorized a separate UDP buffer experiment after confirming that `asyncSend=true` did not solve the freezes. The [tried ledger](TRIED-EXPERIMENTS.md) also retains the unsuccessful decoder staging and bandwidth comparisons. A user-requested memory note records those outcomes for future chats.

**UDP receive buffer (experimental)** requests **8 MiB instead of 1 MiB** for `SVLDataLinkTransferUDP`'s VR receive socket. It is default-off, has no dependencies or options, and is not part of any recommended bundle. Supported exact pairs: **2.0.22/5002322** and **2.0.23/5002363**. Other builds retain their existing adaptations; this patch's mutation body returns unchanged on excluded builds before accessing the library.

Runtime outcome: **failed trial on exact 2.0.23/5002363; freezes became worse and longer**. Installed bytes and Observe v2 were verified. The new 120 s trace has 46 decoded gaps >50 ms (previously 12), maximum 3.065 s (previously 1.804 s), and 300 codec flushes (previously 10), despite 0 app receive-buffer drops throughout the trace. See [live findings and rollback guidance](UDP-RESULTS-2026-09-15.md). Do not recommend this increase again as an untried fix. The exact 2.0.22/5002322 runtime outcome remains untested.

## Historical trial selection; use the live report for rollback

Import the current UDP experiment MPP produced by [Build-UdpExperiment.ps1](Build-UdpExperiment.ps1). Select:

1. The existing recommended bundle matching the exact APK version/build.
2. **UDP receive buffer (experimental)** separately.
3. For a diagnostic capture, also select **Decoder input buffering (experimental)** and explicitly choose **Observe + pipeline telemetry**. That mode disables decoder staging; the patch entry is used only to access the existing telemetry.

Start from the verified original APK in the normal patching workflow. Omitting the UDP patch on a fresh rebuild restores its original behavior; merely deselecting it cannot undo bytes in an already-patched APK. No APK was installed, signed for deployment or launched by this build procedure.

Keep bitrate, host settings and other patches constant for the comparison. Measure app-socket drop deltas, decoded-output gap count/duration, reset recovery and any sustained latency increase. Log/trace capture should use the same instrumentation mode as the baseline, and the owning diagnostic session must stop ADB afterward.

## Exact mutation

Library: `lib/arm64-v8a/libvrlink_scene.so`. Function: `SVLDataLinkTransferUDP::Restart()`, size `0x49c`.

| Exact base | File size | Function start | Instruction file offset = VA | Actual changed byte |
|---|---:|---:|---:|---:|
| 2.0.22/5002322 | 2,283,400 | `0x1742d8` | `0x1745a8` | `0x1745a9`: `02`→`10` |
| 2.0.23/5002363 | 2,292,008 | `0x1754d8` | `0x1757a8` | `0x1757a9`: `02`→`10` |

The complete AArch64 instruction changes `08 02 a0 52` (`mov w8,#0x100000`) to `08 10 a0 52` (`mov w8,#0x800000`). The subsequent `setsockopt` arguments remain `SOL_SOCKET`, `SO_RCVBUF`, 4-byte integer. Send-buffer size, decoder waits, FEC behavior, rendering and host settings are untouched by this patch.

Guards include exact pair/file size, ELF64 little-endian AArch64 ET_DYN, the GNU build-ID note, a unique executable file-backed mapping, accepted stock/already-patched instruction bytes, and SHA-256 of the entire Restart function after normalizing only this instruction. All checks precede mutation of a copied byte array. Whole-file pristine hashes identify the audit inputs, while immutable function guards permit verified bundle changes elsewhere in the library.

| Base | Pristine scene SHA-256 | Normalized Restart SHA-256 |
|---|---|---|
| 5002322 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` | `7032a9e1d48cf855a0838bd36bfd129f1d2d3eab5a4fc3a0b0ad7e932f305777` |
| 5002363 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | `5c9d315b4d608e33a09c7fbec164e19dfdb9eaa4e7d2029673342ba516589351` |

No new native helper or resource payload is needed. Production code is `patches/src/main/kotlin/app/template/patches/steamlink/binary/UdpReceiveBufferPatch.kt`.

## Why this remains justified

Live Observe telemetry directly measured app-socket receive-buffer drops, including an interval without a decoder-input timeout. Android XR presentation continued through all 19 measured decoded-output gaps. The exact 2.0.20 library uses a legacy transport with a 24 MiB request; the newer transport requests 1 MiB. The working PC also uses the newer transport, so this is a buffer-tolerance/host interaction hypothesis, not a universal transport failure.

The measured Android `rmem_max` is 16 MiB. That permits an ordinary 8 MiB request under the observed limit; it does not prove the resulting socket capacity. The native path does not read capacity back. More buffering can absorb finite bursts/receive pauses but cannot fix an indefinitely stalled consumer. Post-flush decoder ownership/recovery and host packet timing remain separate unresolved leads.

## Reproduction and evidence

Run `diagnostics/steamlink-hitches/Build-UdpExperiment.ps1 -JavaHome F:/Runtimes/Java21` from the repository. It compiles current Kotlin with the cached compiler/dependencies, runs the repository tests, packages current resources, and executes 16 isolated Morphe cases against 2 signature-verified pristine source APKs: baselines, UDP alone, both bundle orders, both bundle/Observe telemetry orders, and reapplication. The tested MPP is first on the JVM classpath; no stale compiled-source directories participate in its APK tests.

Published MPP: `patches/build/libs/patches-1.18.0-dev.3-udp-receive-buffer-local.mpp` (1,844,476 bytes).

SHA-256: `10dea5f3cb501903f527a2fd31ebfce50c22fb4e14c40cb32f522a6238c30de6`.

**Validation passed:** 118 Kotlin tests, 0 failures/errors/skips; 16 actual Morphe APK cases from the packaged MPP using the 2 verified pristine APKs; 4 catalog regressions. Tests exercise original/already-patched code, corruption rejection, exact excluded builds, bundle/Observe composition and unchanged input buffers. Each new patch application changes only the expected 1 scene byte relative to its appropriate baseline. The remaining 113 standalone, 116 bundled or 117 bundled/Observe APK entries stay byte-identical, excluding signatures. Reapplication changes 0 scene bytes and preserves all APK entry contents.

All prior catalog entries, defaults, dependencies and compatibility remain logically unchanged; the stable catalog is entirely unchanged. The 2 supported recommended bundles retain their existing 6 dependencies. This is cached Kotlin/JUnit plus actual Morphe APK validation, not a standard Gradle release build or device validation.

The [machine-readable validation receipt](udp-receive-buffer-validation.json) preserves source/artifact/input/output hashes, every case and catalog checks. Existing captures/native maps remain under `build/live-hitch-20260915`; these are private diagnostic evidence, not generated source or installation artifacts. Cleanup ownership and measured results are recorded in [WORKSPACE_CLEANUP.md](../../WORKSPACE_CLEANUP.md).

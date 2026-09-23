# FEC duplicate reservation guard: implementation and trial record

Date: 2026-09-15. **Build and genuine-APK validation passed; headset outcome pending.**

Deliverable: `patches/build/libs/patches-1.18.0-dev.4-fec-duplicate-reservation-local.mpp`. SHA-256: `f3e249d76693f7d386087877de5f64ac97e2272361b267e587734b38f2855ee4`.

## Selection for the next trial

Use the current `fec-duplicate-reservation-local.mpp` with the **original APK** for exact **2.0.23/5002363** or **2.0.22/5002322**. Select:

1. The matching Galaxy XR recommended bundle.
2. **FEC duplicate reservation guard (experimental)**.
3. **Decoder input buffering (experimental)**, mode **Observe + pipeline telemetry**.

The decoder selection supplies diagnostics in this mode; it does not enable input staging. Leave **UDP receive buffer (experimental)** unselected to restore the stock 1 MiB request. The previous 8 MiB trial made freezes worse; buffered staging and host `asyncSend=true` did not solve them. Do not combine these failed experiments with this trial.

The FEC guard is default-off, has no dependencies/options, and belongs to no bundle. It can also run without a decoder helper. Plain Observe/Buffered use the preserved v1 helpers, whose native code guards do not accept this instruction change; selecting that combination fails before either patch writes its entries. Use this release's pipeline helper or omit the decoder patch. Rebuild from an original APK instead of layering this release onto an APK containing an older helper.

## What changed and why

The [proposal and native evidence](RECOVERY-PATCH-PROPOSAL-2026-09-15.md) identified a mismatch: recovery clears descriptor flags, permitting packet entry to skip duplicate checks and reserve decoder input, although the same frame is rejected later by unconditional accepted/submitted-ID checks. The patch removes only that conditional bypass. It uses existing equality checks and leaves descriptor clearing, flushes, fault signaling and keyframe recovery intact.

| Exact base | Library bytes | Instruction file offset / VA | Original → patched |
|---|---:|---|---|
| 2.0.22/5002322 | 2,283,400 | `0x167094` | `28 01 00 34` → `1f 20 03 d5` |
| 2.0.23/5002363 | 2,292,008 | `0x167f60` | `28 01 00 34` → `1f 20 03 d5` |

Each mutation validates the exact version/build pair, ELF architecture and executable mapping, file size, GNU build identity, original/already-patched instruction and entire `AcceptVideoPacket` function SHA-256. Hashing normalizes only these 4 bytes. Unknown instructions or neighboring code changes fail closed; excluded builds return unchanged. No offsets were inferred from a neighboring build.

The matching telemetry runtime applies the same single-instruction normalization before its whole-function FNV check. Its remaining hook guards are unchanged. Only the 2 pipeline telemetry payloads are rebuilt; original v1 resource binaries remain byte-identical. Kotlin validates the freshly built payload hashes and permits FEC/helper combinations only with exact configured current resources for the same base.

## Diagnostic observations

Pipeline modes add these Perfetto `GXR2` events:

| Event | Values |
|---|---|
| `fecDuplicateCandidate` | Frame ID, descriptor/accepted/submitted-match flags, accepted marker, attempted-submission marker. Snapshot after the original Periodic call at the verified packet-entry call site. |
| `fecPacketOutcome` | Candidate flags, number of acquisitions observed inside that packet context, candidate snapshot count. |
| `fecAcquireState` | Acquired frame ID, both native marker values, packet-context frame ID or `-1` for other/unclassified. |

Flags: bit 0 = descriptor present, bit 1 = accepted marker match, bit 2 = attempted-submission marker match. Thread-local context is restored across nested packets. Observe gains no new packet mutex. Events are diagnostic observations, **not an exact executed-branch counter**: a matching snapshot with no acquisition is consistent with early rejection, but does not uniquely prove it. Marker reads do not add synchronization with Valve's threads. The context identifies packet-driven activity, not every native caller. The other allocation route through `RerequestSkippedFrame` remains outside this 4-byte guard.

The new events add tracing overhead. Compare captures using this same telemetry revision on both control and guard APKs. The baseline build should select the matching bundle plus Observe pipeline only, with stock UDP. A trace without the new stage names cannot measure these added observations.

## What remains unresolved

This targets a possible recovery amplifier, not a proven cause of the initial disruption. PC-side throttle/reset timing and expired retransmission history remain plausible contributors on the 14900K/RTX 5090 system. No host settings or DLL bytes change here. Earlier findings, failed experiments and the separately proposed legacy transport comparison remain in the proposal and [tried ledger](TRIED-EXPERIMENTS.md).

Runtime acceptance requires fewer duplicate reservations, input timeouts, flushes and long decoded-output gaps while fresh frames, metadata cadence, reconnects and a full frame-ID cycle remain usable. A lower reset count alone is insufficient. If freezes persist, save whether remaining acquisitions had matching markers and whether they occurred outside the packet context before choosing another patch. Do not reclassify this as successful solely because it builds.

## Reproduction and evidence

Native build: `extensions/decoder-input-buffering/Build-Native.ps1 -CopyResources` (then pin the resulting telemetry hashes in `DecoderInputBufferingPatch.kt`). Native tests: `extensions/decoder-input-buffering/Test-Native.ps1`.

Archive and genuine-APK audit: `diagnostics/steamlink-hitches/Build-FecDuplicateExperiment.ps1 -JavaHome F:/Runtimes/Java21`. This uses the cached Kotlin/Morphe toolchain because the normal Gradle plugin resolution is unavailable; it is not a Gradle release build. Audit code loads from the produced MPP, not a loose classes directory.

Cleanup: inventory the affected workspace, then run `Cleanup-FecDuplicateExperiment.ps1 -AuditDirectory <successful-run> -Execute`. It preserves the published MPP, canonical payloads, exact inputs and compact receipts, removing only allowlisted generated copies.

Validation passed:

- **125 Kotlin tests**, 0 skipped/failed, including actual decoded-base mutation, exact compatibility, helper corruption, input immutability and supported helper-mode checks.
- **16 genuine-APK Morphe cases**: 8 for each exact base. Standalone, matching bundle in both orders, current Observe pipeline in both orders, baselines, and reapplication. Source APK signatures/hashes verified. The guard changes exactly 4 bytes in the scene compared with its corresponding baseline; other ZIP contents remain identical, excluding signing metadata. Stock UDP request preserved.
- **4 catalog regression checks**: every pre-existing metadata entry unchanged; stable catalog entirely unchanged. The new entry is default-off with no dependencies. Existing bundle dependencies remain the same 6 patches.
- **5 native test suites**: pool ownership/reset tests, pipeline wrapper tests, 15 bridge scenarios per build, and the runtime hash helper tested against both real decoded functions in stock/NOP form with neighboring-code and instruction corruption checks. ARM64 build inspection confirms that Periodic preserves the incoming return address before testing the exact native call site.
- Independent code review found no material remaining issues. No Gradle release, signed APK, installation, live hook activation or headset trial is claimed.

Evidence: [MPP, tests and all APK receipts](fec-duplicate-reservation-validation.json), [native source/payload hashes and test receipts](fec-duplicate-reservation-native-validation.json). Compact per-case logs, periodic disassembly and cleanup receipts remain under `build/fec-duplicate-reservation/`.

Removed 27 allowlisted generated targets totaling **672,446,774 bytes**; protected artifact, inputs and resource hashes verified. Automatic approval review blocked deletion of the native build directory (**2,297,538 bytes**) and the subagent's test EXE/PDB (**4,609,536 bytes**). Both remain documented; no rejected deletion was retried. Prior deferred cleanup targets and unresolved captures remain preserved.

No APK installation, ADB capture or live PC change occurred. Final read-only check found 0 ADB processes and 0 listeners on port 5037.

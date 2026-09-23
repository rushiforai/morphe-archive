# Next patch proposal: FEC duplicate reservation guard

Date: 2026-09-15. **Original proposal phase, retained as evidence.** The duplicate guard is now implemented separately: see the [implementation/trial record](EXPERIMENT-2026-09-15-fec-duplicate-reservation.md) for current build validation and selection. Headset effectiveness remains pending. The host and legacy-transport candidates below remain proposals. The failed UDP and decoder-buffering trials remain in the [tried ledger](TRIED-EXPERIMENTS.md).

## Recommendation

Make **FEC duplicate reservation guard (experimental)** the next small, separately selectable APK experiment for exact **2.0.22/5002322** and **2.0.23/5002363**. Keep it default-off and outside bundles. Test it with stock UDP buffering and Observe telemetry.

The patch would run Steam Link's existing duplicate-frame checks **before allocating a decoder input buffer**, including immediately after recovery. Today, those checks can be skipped at packet entry even though the same frame will be rejected by an unconditional check later. This is a concrete mismatch in native code, not another increase to buffer size or timeout.

This targets a recovery amplifier. **A PC-side delivery or recovery fault can still initiate the problem.** New host analysis found substantial throttle delays and failed retransmissions; it does not justify treating the PC as healthy or identifying the APK as the sole cause.

## New evidence behind the proposal

### APK changes and live relevance

1. The previous Observe APK and installed UDP-trial APK have identical ZIP entry sets. Apart from signing metadata, the only content change is the intended scene-library byte at `0x1757a9`. Manifest, DEX and telemetry helper contents match. This excludes an accidental additional APK patch as the observed trial difference, but not private settings lost during reinstall or other session conditions.
2. In 2.0.20, FEC recovery clears receive-frame IDs/pointers but retains a descriptor-present flag. In 2.0.22/5002322 and 2.0.23/5002363, recovery additionally clears that flag on all 16 receive-frame objects.
3. Packet entry checks the flag. When it is clear, it skips the accepted/submitted-ID duplicate checks and can allocate decoder input for an old frame again.
4. Later, `InternalAcceptFrameFromRX` applies those same ID checks **unconditionally**. A matching duplicate returns before decoder submission. Thus the earlier allocation can consume a scarce input buffer for work already destined for rejection. `CheckRetry` can also skip productive work for those marked frames once their descriptor is present.
5. Saved telemetry has **26 post-flush input-acquisition attempts for 12 IDs previously successfully queued**, including **22 successful acquisitions**. All 26 still match the last observed queued ID in their 128-entry ring slot. For example, frame 14528 queues at device 21:35:28.006186, then reserves input again after later flushes at .086030, .247245, .288241 and .329534.

The live trace does not directly record native marker-array contents or distinguish every allocation caller. This evidence is consistent with the audited mismatch; it is not a measurement that all 26 events would disappear under the proposed patch.

### Exact proposed change

Library: `lib/arm64-v8a/libvrlink_scene.so`. Function: `SVLFEC::AcceptVideoPacket(dataset*)`.

| Exact base | File size | Function start / size | Instruction VA = file offset |
|---|---:|---|---|
| 2.0.22/5002322 | 2,283,400 | `0x167050 / 0x294` | **`0x167094`** |
| 2.0.23/5002363 | 2,292,008 | `0x167f1c / 0x294` | **`0x167f60`** |

Replace `28 01 00 34` (`cbz w8, +0x24`, bypass when the descriptor flag is clear) with `1f 20 03 d5` (`nop`). The existing following code then always evaluates:

```text
frameId = uint16(packet + 2)
slot = frameId & 127
if accepted[slot] == frameId or submittedAttempt[slot] == frameId:
    return before Initialize/acquire
continue existing receive/assembly code
```

Use exact ID equality, not a new “older frame” comparison. Preserve descriptor invalidation itself; reverting it could revive stale metadata. Do not patch 2.0.20: its recovery behavior differs and it remains the compatibility control.

Full function hashes:

- 5002322: `e1c49caa38c49b97f2151263b39d9e7777a394bfda36faa1186c1119fae7bc14`
- 5002363: `22eb5623fd4bc06b3464dcadaf26c160cd4b460c3e0f428ebefeb72052700121`

The markers mean accepted work and **attempted submission**, not successful decoding. The submitted marker is written before calling the codec. Moving the existing rejection earlier does not newly reject a same-ID keyframe that would otherwise pass the later guard, assuming marker state remains unchanged. Recovery still needs a fresh usable frame.

### Scope and remaining validation

- `RerequestSkippedFrame` has another allocation route that bypasses packet entry. The 4-byte proposal does **not** cover that route. Before assessing effectiveness, record acquisition caller and both native marker values in Observe telemetry, plus the new early-return count. If that alternate route dominates, add a separately audited check there; do not treat no improvement as proof that the whole duplicate-reservation diagnosis was wrong.
- Retain genuine error signaling, flushes, keyframe recovery, current-frame retries, and host congestion control. Earlier rejection also skips duplicate metadata/timing callbacks, so validate their cadence and reconnect behavior.
- Constructor marker initialization is entry 0 = `0xffffffff`, remaining entries = 0. Full 16-bit equality and ordinary 128-slot turnover handle normal advancement; reconnect/object reuse and a full 65,536-ID cycle still need runtime coverage. The existing late guard shares stale-marker ambiguity; the model does not invent a connection epoch.
- Production code must add exact-pair, ELF mapping, build identity and original/already-patched whole-function guards, atomically validate the mutation and coexist with existing bundle/telemetry edits. Preserve every older adaptation.
- Required before delivery: actual pristine-APK Morphe patching in both bundle orders, idempotence/unrelated-byte checks, current telemetry resource compatibility, then a matched stock-UDP live trial. Success means fewer unnecessary reservations, input timeouts, flushes and long output gaps, with usable fresh-frame/reconnect recovery. Fewer log messages alone are insufficient.

## PC-side findings: why they remain part of the solution

Current host `driver_vrlink.dll` was re-read and matches SHA-256 `a4bc1ac8a0739c6dc53ea56a300b6332ec74c9fb850e260a483bab5ef1a7da85`, size 13,908,632. The following results concern the saved 180 s UDP-trial host window, not a new live benchmark:

- **199 host throttle intervals; 104 reach at least 300 ms**, maximum 311.214 ms. **115 of 133 encoder resets occur within 2 ms after throttle completion.** Static `PostPresent` code checks throttling before entering the encoder method that consumes pending reset state. That is a concrete place where host recovery can be delayed; it is not proof that every throttle interval is erroneous.
- **718/718 failed retransmission requests are exactly 16 IDs behind the message occupying their requested slot.** Native code and RTTI identify a **16-slot host SVLFEC transmit history**, indexed by `messageId & 15`, followed by a complete-ID check. The requested item has already been replaced. Delayed requests, fast sender advancement or repeated recovery can expose this limit; the logs do not establish which occurred first.
- This host history is shared FEC state, **not specifically TransferUDP**, and is different from the APK's 128-entry accepted/submitted rings. Selecting legacy client transport does not automatically enlarge or bypass it.
- Of 430 reset-counter changes, 416 advance by 1, 10 advance by 2, and 4 go backward by 1. The previously considered stale-pose/counter filter would miss the dominant forward recovery storm.

These findings keep a PC/client timing interaction plausible, consistent with the user's much better 5600X/3080 Ti experience on the same network/workload. They do not identify the 14900K silicon, RTX 5090 hardware, NVIDIA driver, or NIC driver as the initiating fault. Neither low overall CPU usage nor short NVENC reinitialization time rules out host pacing delays.

### Host patch candidate, with a clear prerequisite

**Expedite an already-pending recovery reset through ordinary FEC throttling, while preserving the separate outstanding-NVENC-buffer limit.** This is not ready for a byte patch: an accepted reset already clears FEC ACK state, which may itself release throttling. We need simultaneous pending severity, throttle reason/FEC distance, encoder-resource count and reset-consume timestamps to show that a pending reset is unnecessarily blocked. If that condition is observed, it provides a narrow PC-side patch target.

Do not reduce the 300 ms timer globally, disable recovery, or change a single `&15` to `&31`. History expansion requires auditing allocation, every index, reset clearing and ownership; 32 indices can alias adjacent state. These shortcuts could worsen recovery.

## Separate second APK experiment: legacy transport selection

A **Legacy UDP transport (experimental)** patch could select the retained legacy receiver in the newer APK while preserving its newer XR code. This changes the transport implementation rather than repeating the failed buffer-size edit. Keep it separate from the duplicate guard so each test has a clear interpretation.

`XrSceneStream::Focused` forces `LaunchOptions+0x58=1` before the shared client-construction paths. A guarded change to its single store would select 0:

| Exact base | Store VA/file offset | Original → proposed |
|---|---|---|
| 2.0.22/5002322 | `0x119af4` | `e8 23 02 39` → `ff 23 02 39` |
| 2.0.23/5002363 | `0x11a8bc` | `e8 23 02 39` → `ff 23 02 39` |

This writes `wzr` instead of `w8` to the launch flag. Patching only 1 root constructor branch would miss alternate setup paths. Both exact function hashes and call routes are retained in the transport audit.

The current PC has a native-read `driver_vrlink.disableUberLink` setting, but do not change it together with this APK trial. Supplied historical logs show an Uber host connecting to 2.0.20 legacy clients; inspected framing supports compatibility. The current host DLL differs from the archived one, so present-host connection/negotiation remains unproven. The newer retained legacy implementation is also not identical to reverting the entire APK to 2.0.20.

My priority is the smaller duplicate guard because it addresses a verified early/late rejection mismatch. The legacy selector is the next independent transport comparison, especially if the guard only shortens recovery while initial disruptions remain.

## Validation completed and evidence retained

- [Offline proposal model](recovery_duplicate_guard_model.py): **7 checks passed**, including all initial uint16 IDs, ordinary full wire-ID wrap, ring-slot reuse, descriptor/marker combinations, and existing late rejection. Deliberate lifecycle counterexamples remain explicit.
- **2 real decoded-base audits passed**: exact file/function identities, original instruction, 4-byte in-memory preview, unchanged surrounding bytes and idempotent preview. Neither decoded library was written. These are not production patch-helper or Morphe APK tests.
- Native lifecycle comparison covered **2.0.20/5001712**, **2.0.22/5002322**, and **2.0.23/5002363**. Host DLL identity, native caller/vtable paths, throttle/retransmit statistics and transport constructor routes were independently inspected.
- Local evidence: `build/live-hitch-20260915/recovery-proposal/`, including `client/REPORT.md`, `host/REPORT.md`, `transport/REPORT.md`, `installed-apk-comparison.json`, `replayed-submitted-frames-v2.json`, and `duplicate-guard-validation-v2.json`. The earlier model receipt remains historical; v2 adds the independently proven late duplicate check.
- No new APK/MPP/native compiler output, ADB session, host-setting edit, process restart or installation was performed. Preserve compact static/model evidence while these proposals are unresolved. Earlier cleanup rejections remain recorded; none was retried.

Platform context: Android documents that codec flush revokes previously dequeued buffers; this supports preserving ownership/reset validation but does not diagnose this app by itself. [Android MediaCodec API](https://developer.android.com/reference/android/media/MediaCodec#flush()). Microsoft documents that NIC interrupt moderation can defer packet interrupts; that makes host timing worth measuring, not a diagnosed reason to toggle the current NIC. [Microsoft interrupt moderation](https://learn.microsoft.com/en-us/windows-hardware/drivers/network/interrupt-moderation).

# Proposed experimental hitch patch

**Implementation update, 2026-09-15:** [decoder-staging-v1](EXPERIMENT-2026-09-15-decoder-staging-v1.md) implements bounded input staging as a separate default-off patch. Submission remains synchronous after deeper metadata-lifetime tracing; the worker design below is retained as proposal history, not a description of the shipped experiment. Headset outcome is pending.

## Recommendation

Implement a separately selectable **Decoder input buffering (experimental)** patch for exact **2.0.22/5002322** and **2.0.23/5002363**. Keep it default-off and preserve the existing 6-patch recommended bundles and every older adaptation.

The strongest new client-side finding is that network frame assembly borrows MediaCodec input buffers before all frame fragments arrive. When another input buffer is unavailable for 20 ms, the null return propagates into FEC recovery, a decoder flush, and an increased reset counter sent to the host. This can turn a temporary shortage into a much longer interruption.

The native ownership/recovery chain and live timeout/reset events are established. We have **not measured the exact number of input buffers held by incomplete frames during a timeout**. A busy decoder, incomplete network frames, and flush races remain possible contributors. This is an evidence-backed experiment, not a proven cure.

## Why this target

1. `SVLFECRXFrame::Initialize` acquires a decoder input buffer when a fragmented frame starts.
2. The FEC receiver writes incoming fragments directly into that buffer and retains it while waiting for the rest of the frame.
3. `QSVLCodecNDK::AcquireEncodedDataBuffer` calls `AMediaCodec_dequeueInputBuffer` with **20,000 microseconds** on the synchronous receive path.
4. A negative result returns no assembly buffer. In the observed `-1` case, this is an unavailable-input-buffer result, not proof of a permanently broken codec. Android documents this availability distinction. [MediaCodec API](https://developer.android.com/reference/android/media/MediaCodec#dequeueInputBuffer(long))
5. FEC initialization failure sets its unrecoverable flag; subsequent error processing increments the client's reset counter, flushes the codec, and clears in-flight frame state.

The client has a 16-slot frame ring. That does **not** establish that the hardware decoder has 16 input buffers. If incomplete frames hold the available decoder buffers, waiting on the same receive path can delay the fragments needed to complete them. Increasing the timeout alone could worsen this feedback loop.

The 150 Mbit/s test contained 5 reset-counter-first bursts aligned with input/FEC failures. At least 1 was entirely independent of a preceding stale-pose mismatch. A pose-feedback guard alone cannot address this path. See [event attribution](proposal-event-attribution.md) and [codec ownership evidence](proposal-codec.md).

## Proposed behavior

### Observe mode

Add bounded counters and sampled timing records at the existing native boundaries:

- frame ID, connection/flush generation, and assembly-slot owner;
- incomplete/complete frames and bytes retained;
- decoder input indices reserved versus submitted;
- input-dequeue duration and exact return code;
- submission/flush generation, reset cause, and output progress.

Emit aggregates at most once per second and retain a bounded event ring around failures. No per-packet formatted logging or unbounded allocation. This mode establishes whether incomplete-frame reservations actually exhaust the decoder pool on this headset.

### Buffered mode

- Assemble incomplete encoded frames in a bounded application-owned pool, rather than holding a MediaCodec input buffer across network assembly.
- Preserve the existing frame-ID/fragment/metadata association. Place completed frames on a bounded decoder submission queue.
- Acquire codec input buffers on a decoder worker, copy a complete encoded frame, and submit it through the verified native path. Temporary input unavailability retains the queued frame within a bounded progress deadline while packet reception continues.
- Preserve actual codec-error recovery. Do not suppress reset-counter changes, disable FEC retry, or discard compressed reference frames silently when capacity is exceeded.
- Keep original acknowledgment and decode-submission timing semantics: queued for later submission must not be falsely reported as already submitted or decoded.
- Give every staging slot and queued submission an explicit connection/flush generation. Flush, stop, disconnect, and reconnect invalidate stale work and release each allocation/index exactly once. No old pointer may be submitted after a codec flush.
- Enforce per-frame, total-byte, and frame-count budgets. Determine usable capacity from the actual negotiated input-size contract; 16 frame IDs must not become 16 unbounded allocations. Unsupported size/overflow follows a documented recovery path.

This requires a native helper and ownership changes, not merely replacing a timeout immediate or disabling a failure branch. It adds a compressed-data copy and worker scheduling; measure that cost and latency on the headset.

Rendering, decoder output images, OpenXR layers, calibration, the static Surface trigger, and 4-phase pose cadence retain their existing paths. This proposal is unrelated to the retired decoder-to-Surface experiment.

## Secondary candidate: host stale-feedback guard

The Windows handler can amplify an old pose-cycle ID into backward/forward reset bursts. Of 77 captured reset transactions, 56 start with stale-ID mismatches and 21 with client reset-counter changes. These counts do not predict how many freezes a patch would remove; some transactions include both causes.

A narrower default-off host model rejects only additional lags of 6–32 cycles with equal 16-bit reset counters and positive IDs, leaving other cases to stock handling. Its exact host DLL SHA-256, 40-byte entry prefix, and 8 offline test categories were checked. See [host analysis](proposal-host.md) and `stale_feedback_guard_model.py`.

**Do not enable that host behavior yet:** equal reset counters are not connection identities, and the model retains a reconnect counterexample. An early inner-handler return also skips HMD/controller pose and timing/activity updates; only the surrounding button/value dispatch continues. Observe mode and verified lifecycle handling are prerequisites. The decoder proposal therefore takes priority over blanket stale-packet suppression.

Client-side pose dropping is narrower still: it cannot fix reordering after transmission. The transport audit found copied FIFO transmission and outer-datagram deduplication, not an established successful-pose replay bug. Changing cadence, renumbering IDs, or disabling timed video retries is not justified. [Transport audit](proposal-client.md)

## Compatibility and validation contract

- Locate and verify every hook independently in each actual decoded native library. The codec evidence records the build-specific entry points; they are not transplanted between releases.
- Pin exact `(versionName, versionCode)`, native layout, recorded hashes, symbols, and original/already-patched byte preconditions. Unknown combinations remain unchanged or fail closed.
- Preserve the recommended 6-patch bundle, older defaults, and all unrelated mutation regions. The new experiment is a separate selectable patch.
- Before installation: exercise the real production mutation helper on both bases and their supported patch combinations; verify restricted diffs, idempotence, option transitions, ELF interfaces, native calling conventions, and teardown behavior.
- Test partial frames, reordered/missing fragments, a temporarily exhausted codec input pool, invalid input indices, flush during assembly/submission, stop/reconnect, frame-ID wrap, bounded-memory exhaustion, and fatal codec errors.
- For the first runtime comparison, use the same scene, 400 Mbit/s, and light diagnostics. Compare decoded-output gap duration, visible freezes, reset causes, assembly/codec ownership, queue depth, memory and input correctness. Fewer error messages alone are not success.
- Retain a rollback APK and stop ADB after the test. No install/restart/deployment was performed while preparing this proposal.

## Additional live check and status

The headset was queried again read-only. The same app PID 14379 remained running; PSS was 951,908 KiB, EGL accounting 801,616 KiB and GL 864 KiB. This still shows no accumulating process/graphics memory explanation. `dumpsys media.codec` returned no details, so codec pool occupancy remains unmeasured.

Artifacts are under `build/live-hitch-20260915/patch-proposal/`. ADB was killed immediately after these reads. Current work consists of analysis, an offline host predicate model, and this implementation proposal; it is not an installed or runtime-validated fix.

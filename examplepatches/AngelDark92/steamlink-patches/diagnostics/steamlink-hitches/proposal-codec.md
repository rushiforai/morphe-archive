# Client codec input ownership and reset proposal, 2026-09-15

## Finding and scope

The shipped client reserves a MediaCodec input buffer **before the corresponding fragmented video frame has finished arriving**. A failed 20 ms input-buffer acquisition returns null; FEC initialization then treats that null as an unrecoverable stream fault, increments the client reset counter and flushes the decoder. This is a confirmed stock code path in both exact bases, and its log sequence occurs during the live A/B capture.

**Held-buffer starvation remains a hypothesis.** The capture did not measure codec input capacity, reserved-buffer occupancy, individual buffer age, or whether unavailable input was caused by incomplete FEC assembly versus a busy decoder/output pipeline. This evidence identifies a stronger client-side investigation target than a host stale-pose guard; it does not establish a finished or verified fix.

No production patch, APK, device state, or ADB operation was changed by this investigation.

## Exact inputs

| Exact base | Native bytes | Stock SHA-256 |
|---|---:|---|
| 2.0.23 / 5002363 | 2292008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` |
| 2.0.22 / 5002322 | 2283400 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` |

Installed 5002363 native SHA-256: `377547082a561b7c1f9eb3cfe9314f94b2e57602f3dea917fa8a27526d626f5b`. Entire symbol ranges for AcquireEncodedDataBuffer, SubmitFrameForDecode, RXFrame::Initialize, SVLFEC::AcceptVideoPacket, PeriodicCheckForErrors and QSVLClient::HandleUnrecoverableError were freshly compared and are byte-identical to this stock 5002363 binary. Existing patch mutations are outside these inspected functions.

Addresses below are ELF virtual addresses, not transferable file offsets. Retained annotated disassembly is under `build/live-hitch-20260915/proposal-codec/<build>-<function-address>.asm`.

## 1. Input acquisition: timeout and error distinction

| Function or site | 5002363 | 5002322 |
|---|---|---|
| QSVLCodecNDK::AcquireEncodedDataBuffer start | `0xfded8` | `0xfd110` |
| Set timeout to 0x4e20 = 20000 microseconds | `0xfdf24` | `0xfd15c` |
| AMediaCodec_dequeueInputBuffer call | `0xfdf2c` | `0xfd164` |
| Store acquired index by frameID & 15 | `0xfdf54`, codec +0xd0 | `0xfd18c`, codec +0xc8 |
| Log negative acquisition result | `0xfdf7c` | `0xfd1b4` |
| Compare specifically with -10000 | `0xfdf80` | `0xfd1b8` |
| Stop, then Init calls for -10000 only | `0xfdfa8`, `0xfdfb8` | `0xfd1e0`, `0xfd1f0` |
| Return null after negative result | `0xfdfbc` | `0xfd1f4` |

The `-1` result does **not directly invoke Stop/Init** here. It logs the acquisition failure and returns null. The later FEC path makes it fatal. The 1000-microsecond output-buffer polling timeout is a different call and is irrelevant to this input timeout.

Android defines `AMEDIACODEC_INFO_TRY_AGAIN_LATER = -1`; the NDK bridge maps `-EAGAIN` to that value, including input dequeue. Sources: [Android NDK media reference](https://developer.android.com/ndk/reference/group/media) and [AOSP NdkMediaCodec.cpp, translate_error and dequeueInputBuffer](https://android.googlesource.com/platform/frameworks/av/%2B/e419d7c/media/ndk/NdkMediaCodec.cpp). This ordinary availability result does not itself identify the underlying reason that no input slot became available.

## 2. FEC owns codec input while packets are still arriving

| Function | 5002363 start | 5002322 start |
|---|---|---|
| SVLFEC::AcceptVideoPacket(dataset*) | `0x167f1c` | `0x167050` |
| SVLFECRXFrame::Initialize | `0x166e0c` | `0x165fd8` |
| SVLFECRXFrame::AcceptVideoPacket(dataset*, unsigned) | `0x1664e8` | `0x1656b4` |
| SVLFECRXFrame::AcceptVFD | `0x166884` | `0x165a50` |
| SVLFECRAID6RXFrame::CheckRXComplete | `0x168b5c` | `0x167c90` |
| SVLFEC::InternalAcceptFrameFromRX | `0x1677c8` | `0x166994` |
| QSVLCodecNDK::SubmitFrameForDecode | `0xfdfd0` | `0xfd208` |

Concrete 5002363 flow:

1. `AcceptVideoPacket` picks one of 16 RX frames using `frameID & 0xf`. A new type-3 data packet calls Initialize at `0x168040` with a 4 MiB maximum; a type-2 descriptor calls Initialize at `0x16807c` using its declared frame size. Both happen before accepting the current fragment/descriptor.
2. Initialize invalidates old renderer metadata under its mutex, then unlocks at `0x166ef0`. If RXFrame +0x30 is null, it calls codec AcquireEncodedDataBuffer at `0x166fcc` (5002322 `0x166198`) and stores the returned pointer at `0x166fd0` (5002322 `0x16619c`). Capacity is written to RXFrame +0x38. An existing non-null pointer can be reused when a ring slot is reinitialized; this is not evidence that each missing frame permanently leaks another buffer.
3. Fragment processing directly copies `packet +8` into `RXFrame.buffer + fragmentIndex*1024` at `0x166680..0x16668c`. This raw pointer is the dequeued codec input, not independently allocated compressed-frame staging.
4. AcceptVFD copies the 0x154-byte descriptor metadata from descriptor +0x28 to RXFrame +0x4270 under its mutex at `0x166974..0x1669a8`, with metadata readiness tracked separately.
5. CheckRXComplete tests reconstructed contiguous blocks against `ceil(frameBytes/1024)` at `0x168bac..0x168bbc`; complete data proceeds through InternalAcceptFrameFromRX at `0x168bc8`.
6. InternalAcceptFrameFromRX transfers the raw pointer into a 128-entry FEC pending array at `0x167900`, then clears the RXFrame pointer at `0x167908`. Ordered delivery can therefore retain acquired codec input after byte completion as well as before it.
7. Once selected for submission, codec SubmitFrameForDecode is called at `0x167a9c`. Its boolean return is not checked: the caller still invokes FrameSubmittedForDecode at `0x167ab8`, advances last-submitted at `0x167ac0`, and clears the pending pointer at `0x167ac4`.
8. SubmitFrameForDecode takes and invalidates the saved codec index at `0xfe00c..0xfe010`, queues it at `0xfe0e0`, records submission timing only on success, and clears the passed pointer at `0xfe218`. Queue failure instead signals ExperiencedAnUnrecoverableError at `0xfe124`.

The 16 bookkeeping entries are **not a measurement that the hardware codec exposes 16 input buffers**. Missing/reordered data can tie up available codec slots before decode begins. Independently, real decoder backpressure can prevent new input slots from becoming available. Current evidence cannot apportion those causes.

## 3. Ordinary input unavailability becomes stream recovery

For 5002363, null acquisition makes Initialize log `Could not acquire encoded data buffer from codec for frame: %i` at `0x167044`, set RX frame ID to -1, and return false. The caller's type-3 and type-2 failure branches converge at `0x168184`, which sets FEC +0xc50 = 1. This is the same field written by SVLFEC::ExperiencedAnUnrecoverableError (`0x166dec`; 5002322 `0x165fb8`).

The next error check performs:

| Action | 5002363 | 5002322 |
|---|---|---|
| PeriodicCheckForErrors start | `0x167d98` | `0x166ecc` |
| Log Fault, SVLFEC Received ExperiencedAnUnrecoverableError() | `0x167dbc` | `0x166ef0` |
| Client virtual HandleUnrecoverableError(-1) | `0x167dd4` | `0x166f08` |
| QSVLClient::HandleUnrecoverableError start | `0xf4c40` | `0xf3f60` |
| Codec virtual Flush call | `0x167df8` | `0x166f2c` |
| Clear 0x600 bytes of pending entries | `0x167e08` | `0x166f3c` |

Relocation-backed vtable resolution for both QSVLClient and QSVLClientXR confirms client slot +0x40 resolves to QSVLClient::HandleUnrecoverableError. That method increments the reset counter at client +0x7dd4. The error checker then clears all 16 RX buffer pointers, frame IDs and metadata-ready flags. In 5002363, QSVLCodecNDK::Flush starts at `0xfe5e4` and invokes AMediaCodec_flush at `0xfe640`.

Thus the confirmed chain is `dequeueInputBuffer(-1) -> null -> RX Initialize failure -> FEC error flag -> reset-counter increment + decoder flush`. It is indirect, not an immediate Stop/Init special case for -1.

## 4. Live association and remaining measurement gap

The A/B analysis found 5 counter-first bursts during 150 Mbps with no preceding pose mismatch inside the 1-second burst. All 5 align with input `-1` and subsequent FEC-error logs; 4 then develop pose mismatches. One counter-only burst has no pose-mismatch explanation. See [proposal-event-attribution.md](proposal-event-attribution.md), especially its counter-first event table and clock-alignment limits.

Nominal input errors precede host counter messages by roughly 29-36 ms after measured host/device clock alignment, but the baseline alignment uncertainty is about +/-60 ms. That nominal cross-device lead is smaller than the uncertainty and does not prove ordering. These are error/reset associations, not a count or duration of physical headset freezes. The native call chain supplies the direction of the recovery mechanism. Baseline traces also show decoder output gaps beginning before later host pose mismatches, so the host guard does not remove the initiating decoder/transport stall.

No live held-buffer occupancy or capacity was recovered. Stable memory and absence of the 4 stock import/leak error signatures do not exclude a small leak; they make the measured input/fault sequence a more immediate test target.

## 5. Safe next proposal: investigate client first

First instrument acquire/release ownership at low overhead: frame ID, reserved codec index, acquisition duration/result, outstanding count, oldest reservation age, missing fragment count, descriptor readiness, pending ordered-frame count, queue result, output progress and flush generation. Use bounded in-memory records/counters and sample output, not high-volume per-frame logging. Confirm whether the first 20 ms stall occurs with input buffers held by FEC, buffers already submitted to a busy decoder, or both.

A candidate redesign is a bounded application-owned compressed-frame pool for FEC assembly and a separate decoder worker that acquires input only for complete, ordered frames. It must preserve frame metadata, actual queue completion and acknowledgement timing, queue bounds, genuine-error recovery, reconnect/flush invalidation, and exclusive ownership of buffers across each generation. Pool exhaustion needs an explicit latency/recovery policy; unbounded buffering would increase latency and memory. This is a scoped implementation proposal, not an approved binary-offset patch or a verified remedy.

Simply increasing the current 20 ms timeout can block the synchronous receive path longer, delaying the missing fragments required to finish already-reserved frames. A short in-call retry retains the current packet lifetime but has the same coupling. Simply ignoring the FEC fault, returning fabricated success, clearing an index, or dropping metadata would violate existing ownership/acknowledgement contracts. The caller currently discards submission return status, so asynchronous queuing requires coordinated changes rather than replacing 1 call or 1 branch.

Keep the host stale-pose guard as a separately measured reset-amplification mitigation, with valid client recovery retained. Prioritize client input ownership instrumentation and a controlled client experiment before claiming the freeze is fixed. Preserve exact-build guards and all older supported bundles for any future implementation.

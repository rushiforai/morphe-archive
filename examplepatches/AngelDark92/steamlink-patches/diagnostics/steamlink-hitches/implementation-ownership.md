# Decoder staging: ABI and ownership evidence, 2026-09-15

## Current implementation boundary

The proposed first experiment now stages incomplete compressed frames in a bounded application pool, then performs **original acquisition, copy, and original submission synchronously on the existing submit caller**. It adds no decoder worker and changes no metadata getter, completion timestamp, or acknowledgement callback. This narrower design tests whether preassembly codec reservations contribute to unavailable input while preserving the existing ordering contract.

This document records static evidence and design constraints, not runtime acceptance. It uses the exact 2.0.23/5002363 and 2.0.22/5002322 binaries identified in [proposal-codec.md](proposal-codec.md). Annotated disassembly is retained under `build/live-hitch-20260915/implementation-ownership/` and `proposal-codec/`. No device operation or production implementation was performed by this investigation.

## Exact callable ABI

All prototypes include the implicit C++ `this` pointer in x0; ARM64 AAPCS passes the remaining arguments in x1-x4/w1-w4. `size_t` and pointers are 64-bit; `unsigned` and `int` are 32-bit; frame IDs declared `unsigned short` are 16-bit. Values must not be relabeled as pointers or nanosecond timestamps.

```cpp
uint8_t* AcquireEncodedDataBuffer(void* codec, unsigned frameID, size_t* capacity);
bool SubmitFrameForDecode(void* codec, uint8_t** buffer, int byteCount,
                          unsigned frameID, bool trackFrame);
void InternalAcceptFrameFromRX(void* fec, unsigned byteCount,
                               uint8_t** buffer, unsigned short frameID);
void FrameSubmittedForDecode(void* link, unsigned short frameID, unsigned timeUS);
void FrameHasBeenAccepted(void* link, unsigned short frameID,
                         unsigned timeUS, unsigned long realtimeUS);
bool Init(void* codec);
void Flush(void* codec);
void Stop(void* codec);
void ClearPendingFrameList(void* codec);
```

| Function start | 5002363 | 5002322 |
|---|---|---|
| AcquireEncodedDataBuffer | `0xfded8` | `0xfd110` |
| SubmitFrameForDecode | `0xfdfd0` | `0xfd208` |
| InternalAcceptFrameFromRX | `0x1677c8` (0x324 bytes) | `0x166994` (0x28c bytes) |
| FrameSubmittedForDecode | `0x1628c8` | `0x161a94` |
| FrameHasBeenAccepted | `0x162740` | `0x16190c` |
| Init | `0xfd6f0` | `0xfc928` |
| Flush | `0xfe5e4` | `0xfd81c` |
| Stop | `0xfe724` | `0xfd95c` |
| ClearPendingFrameList | `0xfde30` | `0xfd068` |
| PeriodicCheckForErrors | `0x167d98` | `0x166ecc` |
| ExperiencedAnUnrecoverableError | `0x166dec` | `0x165fb8` |

`InternalAcceptFrameFromRX` differs structurally between the bases; do not derive its internal sites by adding a fixed address delta. Its original Submit call is at `0x167a9c` / `0x166bbc`, with `trackFrame=true`. The subsequent timestamp callback is at `0x167ab8` / `0x166bd8`.

## Completion and acknowledgement semantics

1. InternalAcceptFrameFromRX calls FrameHasBeenAccepted before transferring the raw buffer into its 128-entry pending table. This queues frame ID, receive-acceptance time and realtime under the data-link queue mutex.
2. It selects complete frames in order, marks the submitted-ID table, and calls SubmitFrameForDecode synchronously. It **does not check the boolean return**. It then records the submission timestamp, advances last-submitted ID, and clears the pending pointer.
3. FrameSubmittedForDecode is only a plain aligned 32-bit store to `link +0x198 +4*(frameID &63)`. It does not itself send a network acknowledgement. The later SendLastRXID reads that timestamp for its latest decoded frame and includes it in the transport report.
4. SendLastRXID is `0x162f80` / `0x16214c`; its timestamp read is at `0x163230` / `0x1623fc`. Its queue mutex has already been unlocked at this read. A direct call from QSVLClient::SendPoses is at `0xf5228` in 5002363. Stock therefore already publishes/reads this field across transport/render work without locking the timestamp ring itself.
5. Original SubmitFrameForDecode queues the codec input, inserts a submission marker when trackFrame is true, calls GotNetworkFrame and clears the passed pointer on success. Calling the original synchronously preserves these timings and the subsequent FEC timestamp callback.

**False is not a discard flag.** With a valid codec index, `trackFrame=false` still queues input and calls GotNetworkFrame; it only omits the tracking marker. With a missing index, false returns false quietly, whereas true signals a stream error. The identified scene FEC call passes true. Other callers must retain the original false behavior.

## Capacity and pointer ownership

- Codec capacity is `+0x150` in 5002363, `+0x148` in 5002322. The constructor initializes it to 0; Init does not populate it. Successful original Acquire calls AMediaCodec_getInputBuffer and writes its actual returned capacity. Reading capacity before that first acquisition is invalid as a staging-allocation policy.
- FEC accepts at most 4 MiB per compressed frame and can initialize from a fragment before the descriptor arrives. A staging buffer must advertise its own real allocated capacity; verify the final byte count against both that capacity and the capacity returned by the subsequent real acquisition before copying.
- A proposed 24 by 4 MiB pool has a 96 MiB allocation ceiling. Keep allocation/reuse bounded and report its measured memory cost separately. Never substitute a pool pointer for a MediaCodec pointer in the unmodified queue path.
- Original Acquire stores a native input index at codec `+0xd0 +8*(frameID&15)` / old `+0xc8 +8*(frameID&15)`. Original Submit consumes and sets that entry to -1. Real Acquire immediately followed by original Submit on the same caller preserves this pairing; new concurrent acquisition/submission would require separate synchronization.
- RXFrame keeps a raw buffer at +0x30. Initialize reuses a non-null pointer when a ring slot is reused; therefore a pool ledger cannot assume its originally assigned frame ID stays unchanged. Validate ownership primarily by exact slot pointer and current owner/generation, and account for FEC slot reuse.
- Completion moves the pointer from RXFrame to FEC's 128-entry pending array, before eventual synchronous Submit. Do not reclaim storage merely because it has left the 16-entry RX array.
- The caller's `uint8_t**` refers to a FEC table slot. Do not retain that pointer-to-pointer after returning, and never pass staging bytes to original Submit without obtaining/copying into its true MediaCodec input.

## Required failure behavior in the synchronous experiment

**Moving acquisition into Submit bypasses the stock Initialize-failure handler.** If delayed original Acquire returns null, returning false from the hook alone is insufficient: InternalAcceptFrameFromRX ignores it and advances. Signal the original FEC ExperiencedAnUnrecoverableError, preserve the stock recovery request, and release/quarantine staging only at a valid ownership boundary. Do the same for pool exhaustion or an impossible final size/capacity contract. Do not fabricate a successful submission or silently drop the fault.

An acquired input that cannot be queued because of a later validation failure remains codec-owned until real recovery; it must not be reused as if released. Original queue failure already signals the FEC fault. Avoid a second independent retry loop that queues later frames after this fault has invalidated the intended sequence.

Observe mode must call the original functions and collect bounded counters without changing pointer, capacity, return or error behavior. Buffered mode's valid-pointer classification must be exact; unexpected pointers should follow an explicitly defined original/pass-through or fail-closed path, not be treated as pool offsets.

## Flush, Stop and ClearPendingFrameList

### ClearPendingFrameList

`0xfde30` / `0xfd068` takes only the submission-marker deque mutex and clears that deque. It does **not** flush MediaCodec, reset its 16 saved input indices, clear FEC pending pointers, or invalidate RX buffer ownership. A helper must not reclaim its pool on this callback.

### Flush boundary

Original Flush acquires codec shared_mutex exclusively, calls AMediaCodec_flush, then clears the marker deque under its separate mutex. It does not itself clear FEC's references to compressed storage.

PeriodicCheckForErrors first increments the client reset counter and calls codec Flush. Only **after Flush returns** does it clear 0x600 bytes covering FEC pending pointers/sizes and reset the 16 RX raw pointers, IDs and metadata-ready flags. Therefore storage freed or reissued inside the Flush hook can still be referenced by its caller's FEC objects. Retain pool allocations across this interval and quarantine old-generation slots until the full FEC reset boundary, or independently prove no RX/pending reference remains before reuse. Stable addresses alone do not permit overwriting bytes still referenced by FEC.

### Stop/Init re-entry from Acquire

Input dequeue uses 20000 microseconds. Any negative result returns null. The special `-10000` result additionally calls virtual Stop then Init before returning null; `-1` does not. In buffered mode, this nested lifecycle sequence now occurs *inside* the Submit hook after it has obtained a staging pointer.

The hook must distinguish nested reinitialization from final teardown, keep the current staging allocation pinned until the outer Submit unwinds, avoid recursively acquiring a nonrecursive helper mutex, and never let nested Stop free/reissue buffers still referenced by FEC. Original Stop/Init does not clear FEC RX/pending references; genuine FEC reset must still follow the failed acquisition. A generation change invalidates future use, not the physical allocation while a caller still holds it.

### Lock order

| Lock or field | 5002363 codec offset | 5002322 codec offset |
|---|---|---|
| codec shared_mutex | `+0x158` | `+0x150` |
| submission-marker mutex | `+0x88` | `+0x80` |
| output thread object | `+0xb0` | `+0xa8` |
| output-thread running byte | `+0xb8` | `+0xb0` |
| codec started byte | `+0xb9` | `+0xb1` |

Init holds codec exclusive lock, starts the media/output thread, clears marker state under its mutex, then releases the exclusive lock. Stop clears the output-thread running flag and joins that thread **before** acquiring codec exclusive lock; it clears the started flag, removes the AImageReader listener, then stops/deletes codec and reader and clears markers. Destructor calls Stop before destroying the lock, deque and frame-server reference.

Original Acquire has no shared-lock wrapper. Submit, MediaThread and HandleOnImageAvailable use the shared codec lock. Flush/Init/Stop use exclusive codec lock followed, where needed, by marker mutex. Any helper locking must respect this order and its re-entry exception; no waiting for work while holding a lock that work needs.

## Review of the narrowed pool lifecycle

The proposed implementation keeps all leases and backing allocations quarantined when Flush/Stop increments a generation. After the original PeriodicCheckForErrors finishes, it scans all 16 RX pointers and 128 pending pointers only when the generation changed, and releases only absent, unpinned slots. Ordinary packet checks perform no scan or diagnostic-clock work; normal successful Submit releases its staging slot. Abandoned current-generation slots remain bounded until a genuine recovery/generation change. This matches the observed reset order and avoids reissuing memory before FEC clears it. An old-generation staging pointer reused by FEC after nested Stop/Init must fail submission and request genuine recovery, not be copied as a new-generation frame.

A recursive helper mutex can permit same-thread Acquire -> Stop -> Init re-entry. Both inspected MediaThread bodies and image callbacks contain no calls to the planned Acquire, Init, Flush, Stop or ClearPendingFrameList hooks. MediaThread's failure path calls BIsStuck, which only reads the marker queue and checks elapsed time, then inlines marker clearing and sets the FEC error flag. It does not run recovery on that output thread. With metadata interception excluded, there is no demonstrated stock output-thread -> helper-lock cycle while Stop joins it. This requires the forwarded media API functions and diagnostic logging not to acquire that helper mutex themselves.

Backing allocation release after the original codec D2 destructor follows the stock shutdown ordering, provided parent teardown has already quiesced receive processing. Do not release backing during ordinary Stop, because Stop also occurs within failed acquisition. Validate nested lifecycle, failed delayed acquisition, old-generation FEC references, post-reset reuse, repeated Stop/Init and final destruction with local ownership tests; live stop/reconnect testing remains separate.

## Receive and timeout concurrency: full packet guard required

The relevant receive paths are not all protected by a common stock lock:

| Path | 5002363 | 5002322 |
|---|---|---|
| SVLDataLinkUber::AcceptFromTransferer | `0x170ce8` | `0x16fce0` |
| SVLDataLinkUber::DataLinkTransferFault | `0x17223c` | `0x171234` |
| SVLDataLinkTransferUDP::RXThread | `0x175ac8` | `0x1748c8` |
| SVLDataLink::ReceiveTimedOut | `0x1614cc` | `0x160698` |
| SVLFEC::AcceptVideoPacket | `0x167f1c` | `0x167050` |

AcceptFromTransferer takes the data-link +0x3ac mutex at `0x170db4`, holds it through HandleReceivedDatasets (`0x171030`) and reconstruction delivery, then unlocks at `0x171110`. Uber Tick's reconstruction processing uses that same lock at `0x16fb60..0x16fb80`.

In contrast, a transfer RXThread recvfrom failure calls DataLinkTransferFault at `0x175e50`. That function invokes ReceiveTimedOut at `0x172278` without acquiring the +0x3ac mutex. ReceiveTimedOut dispatches NoPacketReceived, whose tail call reaches PeriodicCheckForErrors. Separate transfer objects have separate receive threads sharing an Uber link. The inspected code therefore does not justify assuming that packet processing and fault recovery always share a thread or lock.

A lock held only inside the Acquire wrapper ends before Initialize stores the returned pointer at RXFrame +0x30. Recovery can interleave in that publication gap; an Initialize-only hook would still leave the later fragment memcpy outside protection. The narrowed bridge consequently wraps the **entire SVLFEC::AcceptVideoPacket(void*, dataset*) call** in its recursive helper mutex. PeriodicCheckForErrors uses the same mutex in buffered mode, including the no-fault case. It can avoid redundant recursive locking with a thread-local receive-depth guard while inside that packet call.

Do not pre-read the fault byte and then invoke original Periodic unlocked: the output thread can set the flag between those 2 reads, allowing the original call to run recovery unexpectedly. Generation comparison after the serialized original call limits reclamation work without relying on that racy pre-read.

FEC Tick reaches UnguidedCheckRetry (`0x1669dc`) and CheckRetry (`0x1669ec`): the inspected retry body checks whether the input pointer is null, updates retry masks/timestamps, submits retry requests and can set the FEC fault flag. It performs no copy into raw staging storage and makes no codec Submit call. This does not claim that all stock bookkeeping is race-free; the new guard protects the staging publication, byte-write and reclamation boundary it introduces.

The bridge host test now pauses a real wrapped packet call after inner Acquire returns but before simulated RX publication. It confirms that the helper mutex remains held across that gap, starts another thread's fault/Periodic call, and checks that original recovery enters only after publication. Both threads are released/joined before reporting assertions. This is a deterministic simulated ownership test, not live proof of the Android transport implementation.

## Parent object lifetime

Verified pointer chain:

- codec +0x28 / old +0x20 -> renderer;
- renderer +0x18 -> SVLRoot/QSVLClient;
- root +0x140 -> active data link; data link +0x10 -> FEC;
- FEC +0xc30 -> root; root +0x138 -> renderer; renderer +0x10 -> codec;
- FEC +0x98 +8*(frameID&15) -> RXFrame.

The root owns data links in a vector and its renderer separately. Data-link destructor destroys FEC; renderer destructor destroys codec. SVLRoot::Shutdown joins its events thread then shuts down data links; SVLRoot destructor stops data links before deleting the renderer, then destroys the links. QSVLRendererXR destructor clears renderer +0x10 before invoking codec destructor. Helper state needs a codec-lifetime/generation identity; pointer equality alone after destruction/address reuse is insufficient.

GotNetworkFrame (`0xf7924` / `0xf6b70`) reads the current stats bucket at client +0x7de0 and increments the counter at +0x8de8 +4*bucket with ordinary load/add/store. FrameSwap changes the current bucket and clears subsequent counter slots. This is existing cross-thread statistics, not a thread-safe new worker API. Keeping original Submit on its original caller preserves its prior use.

## Deferred-worker evidence retained for future work

A decoder worker was deliberately excluded from the current experiment because these additional contracts require independent implementation:

- GetMetadataForFrameId (`0x167aec` / `0x166c20`) locks RXFrame +0x4248, checks exact frame ID and ready byte, and returns its +0x4270 metadata pointer **after unlocking**. Metadata is 0x154 bytes in a 16-slot ring; compressed byte staging alone does not retain it.
- Its 3 identified 5002363 consumers are HandleOnImageAvailable at `0xfe514` (reads metadata[0] immediately), ServeBestHardwareBuffer at `0x103310` (reads +0xe0 immediately while frame-server mutex is held), and FlipFrame at `0x10d00c` (keeps the pointer and reads it throughout GL/swapchain/render work). Returning a mutable shared cache slot would not preserve the last consumer's lifetime.
- A future getter could copy an exact tagged record under a cache lock into thread-local 0x154-byte storage. No inspected consumer needs its returned pointer across its next same-thread getter call. Cache retention and frame-ID/generation collision handling remain separate requirements.
- Descriptors can arrive after Submit. Snapshotting only at enqueue misses late metadata; snapshotting the outgoing RX slot before Initialize invalidates it can capture that later update. Calling original getter while manually holding its RX mutex deadlocks; copying its returned pointer after it unlocks is not an atomic snapshot.
- HandleOnImageAvailable calls the getter while holding codec shared lock. A helper getter lock plus a Flush hook holding that same helper lock while waiting for codec exclusive creates a lock inversion. Do not add such a cache casually.
- A queue limit of 6 or 8 and a 300 ms stuck check do not prove that metadata survives output/render backlog. A 64-entry cache is bounded storage, not proof of correct retirement for still-referenced images.

## Verification boundary

All ABI, pointer, branch and locking claims above were checked against retained disassembly. Neither actual pool behavior, live allocation overhead, device codec capacity nor reduced hitch frequency has been established by these static checks. The synchronous experiment intentionally retains the 20 ms blocking dequeue and genuine recovery; it isolates preassembly reservation rather than proving that all decoder backpressure is solved.

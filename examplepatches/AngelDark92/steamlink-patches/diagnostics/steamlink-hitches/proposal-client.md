# Client stale-pose proposal and transport audit

Status: evidence-backed proposal; no APK, DLL, transport setting, or running process changed. Investigation used the captured installed 5002363 APK and actual decoded 5002322/5002363 libraries. It establishes mitigation boundaries, not the original cause of every delayed packet.

## Recommendation

Prefer an optional, measured stale-pose guard over changing cadence, disabling video retry, or changing the meaning of the pose ID. A client guard can prevent old queued pose cycles being transmitted after newer cycles. It cannot prevent packets from being reordered after transmission. A host guard at the already identified pose-ID receiver covers both cases and is the broader mitigation, provided genuine reset-counter changes and forward discontinuities still work.

The first client variant should log stale events before dropping them. Record event generation/deadline, actual send time, phase, pose-cycle ID, and reset counter. Change behavior only when that record shows decreasing IDs at send. The trace collected so far proves host-side stale-ID resets; it does not contain the client's actual send-ID sequence.

## Exact libraries

| Exact base | Library size | SHA-256 |
|---|---:|---|
| 2.0.22 / 5002322 stock decoded | 2,283,400 | `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f` |
| 2.0.23 / 5002363 stock decoded | 2,292,008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` |
| Captured installed 5002363 | 2,292,008 | `377547082a561b7c1f9eb3cfe9314f94b2e57602f3dea917fa8a27526d626f5b` |

All 16 selected 5002363 transport/pose functions are byte-for-byte identical in installed and stock libraries. The 5002322 functions were located independently by ELF symbols and disassembled; addresses were not transplanted. Detailed hashes, virtual addresses, file offsets, vtable relocation resolution, and `.asm` extracts are under `build/live-hitch-20260915/reset-analysis/transport-two-base-audit.json` and `transport-<build>-<address>.asm`.

## Function map

Addresses are ELF virtual addresses; these selected code sites also have the same raw file offset in their respective ELF mappings. This coincidence must not be generalized to other segments or builds.

| Function | 5002322 | 5002363 |
|---|---:|---:|
| `QSVLClient::HandleEvent` | `0xf3f74` | `0xf4c54` |
| `QSVLClient::SendPoses(int,int)` | `0xf40c4` | `0xf4da4` |
| `SVLDataLink::SubmitMessage(dataset*,bool,bool)` | `0x160458` | `0x16128c` |
| `SVLDataLinkUber::XMITData(dataset*,bool,bool)` | `0x16f63c` | `0x170644` |
| `SVLDataLinkUDP::XMITData(dataset*,bool,bool)` | `0x1771b0` | `0x1783ac` |
| `SVLDataLinkUber::InternalTX(int)` | `0x16f764` | `0x17076c` |
| `SVLDataLinkTransferUDP::Transmit(unsigned char const*,int,unsigned long)` | `0x175158` | `0x176354` |
| `SVLDataLinkTransferUDP::ProcessTransmitQueue()` | `0x174ce4` | `0x175ee0` |
| `SVLDataLinkTransferUDP::FlushOldMessages(unsigned long,bool)` | `0x1752c8` | `0x1764c4` |
| `SVLDataLinkUber::AddSequenceToWindow` | `0x170470` | `0x171478` |
| `SVLDataLinkUber::HandleReceivedDatasets` | `0x170b40` | `0x171b48` |
| `SVLFEC::Tick()` | `0x167448` | `0x168314` |
| `SVLFECRXFrame::UnguidedCheckRetry()` | `0x165ba8` | `0x1669dc` |
| `SVLFECRXFrame::CheckRetry(int)` | `0x165bb8` | `0x1669ec` |

## What `SubmitMessage(..., false, true)` means

These booleans do not select reliable versus unreliable delivery.

- The first boolean controls whether to `free` the original dataset after processing. For example, installed 5002363 `XMITData` copies argument `w2` into `w21` at `0x1706a8`, then tests `w21` and conditionally frees the caller pointer at `0x17072c`–`0x170734`.
- The second boolean forces immediate transmit/flush after copying the dataset. Argument `w3` becomes `w25`; `0x170704` tests it and calls `InternalTX` at `0x170720`. The legacy UDP implementation has the same ownership/flush contract at `0x178500`–`0x178534`.
- `SubmitMessage` itself is a virtual dispatch through slot `+0x50`. ELF vtable relocations resolve that slot to the concrete `XMITData` functions above, in both bases.
- Pose data is built on the caller's stack. `XMITData` holds its TX mutex, copies the complete header plus payload (`length + 8`) with `memcpy`, then flushes. The downstream UDP transfer copies the encoded datagram into its own ring before returning. The audited path does not retain a pointer into the returned `SendPoses` stack frame.

The pose ID is copied from the queued event and remains that same ID throughout packet construction. Pose samples, timestamps, and the reset counter are obtained later during construction, so they need not describe the same instant as event generation. No write that silently replaces the packet ID with a current decoded/displayed frame ID was found.

## Active Uber path, queues, and duplicates

The captured host session identifies Uber transport with a UDP transfer and a primary link; the parent investigation located `Uber link enabled`, identical `m_pLink`/UDP-link pointers, and `nTimedRetryOption=1`. The generic legacy UDP implementation was checked to disambiguate the boolean contract, not asserted to be the active path. Client startup text sufficient to prove the exact number of simultaneously eligible outgoing transfers was not recovered from the initial logcat excerpt.

`SVLDataLinkUber::InternalTX` increments its outer datagram sequence, encodes the packet, and calls `Transmit` for each eligible transfer. This supports multi-link duplication in the implementation, but the current logs do not prove that multiple active client links caused this session's errors.

In the UDP transfer, `Transmit` copies datagram bytes and enqueue timestamp into a ring. `ProcessTransmitQueue` processes the ring in FIFO order. On a full successful `sendto`, it advances to the next item. On `EAGAIN` (`errno 11`), it retains the unsent head for a later attempt; it does not deliberately send a newer queued datagram first. `FlushOldMessages` advances an age cutoff; processing skips records older than that cutoff. No acknowledgement-based replay of successfully sent pose datagrams was found in this path.

The Uber reconstruction code admits previously unseen datagrams out of sequence. In 5002363, `AddSequenceToWindow` computes signed 16-bit `incoming_outer_sequence - last_sequence - 1` at `0x171498`–`0x1714a4`; values below `-1023` return. An already populated sequence slot is marked for the additional link and returned without redispatch at `0x171714`–`0x171730`. This is deduplication by outer datagram sequence, not by pose-cycle ID.

For an out-of-order but newly seen datagram, dataset header `0x0103` (pose/control packet) is explicitly selected for immediate delivery at `0x1717d8`–`0x1717dc`, calling `ReceivedData` at `0x171788`. Its low header byte is then cleared at `0x17178c`–`0x171794`, so later reconstruction-window draining does not deliver that same stored dataset again. `HandleReceivedDatasets` contains the corresponding selection and consumed-marker handling. Thus a late first copy can still carry an old pose-cycle ID to the application even though duplicate datagrams are suppressed.

These receive-side observations are from the actual Android native libraries, which include the shared Uber transport implementation. The Windows receiver's exact instructions must be independently traced before claiming every receive detail is byte-identical on the host. The already traced Windows application handler demonstrably accepts sufficiently old pose IDs far enough to trigger its reset path.

## Timed retry does not establish stale-pose replay

The audited timed FEC retry path operates on video receive frames:

1. `SVLFEC::Tick` queries remote value ID `0x1a` at `0x168350`; if enabled/defaulted, it visits in-flight receive frames.
2. `UnguidedCheckRetry` invokes `CheckRetry(-1)`.
3. `CheckRetry(-1)` checks missing video blocks and a 4,000 us interval at `0x166b9c`–`0x166bac`, then constructs header `0x0504` at `0x166cd8`–`0x166cfc`. It submits a list of requested video-block IDs, not a copied `0x0103` pose packet.

The exact startup-field `nTimedRetryOption` to remote-ID `0x1a` mapping was not independently established in this bounded investigation. The existence of `nTimedRetryOption=1` is therefore not evidence that pose/control datagrams are retained and replayed. Disabling video retry is not justified by the stale-pose evidence and could worsen visible freezes on packet loss.

## Proposed client guard

Create a separately selectable experimental patch, default off, for exact `(2.0.22,5002322)` and `(2.0.23,5002363)` only. Preserve the 4-phase cadence, event deadlines, pose-query offset, reset-counter semantics, and all older existing adaptations.

Suggested interception: the type-0 `HandleEvent` path immediately before the verified `SendPoses` call, or a narrow `SendPoses` wrapper shared by that path. Add a per-client, per-connection last-successfully-submitted cycle record with explicit initialization/teardown. Do not repurpose an unproven spare field.

Behavior:

1. Log cycle, phase, event deadline, submit time, current reset counter, and last submitted cycle in bounded counters/ring storage.
2. Permit all phases of the same cycle and all newer cycles. Do not reduce the send rate.
3. Drop an older cycle only after a newer cycle was successfully submitted in the same connection/reset epoch. Do not compare solely with the latest generated cycle: generation can run ahead of transmission during a stall.
4. Preserve the original ID. Renumbering would falsify timing metadata and hide the disagreement.
5. Reset guard state on a real connection/session change; preserve the 2 initialization calls that send ID 0. Handle the actual packed sequence width, signed conversion, and wrap explicitly.
6. Keep genuine reset-counter changes on an intact control path; do not discard a necessary reset request merely because it accompanied an old scheduled event.

This candidate directly addresses pre-transmit stale-event ordering only. If outgoing IDs are monotonic but host receive IDs go backward, this client guard will not fix the fault. A host-side stale-ID guard can address both pre-send and in-flight reordering, using the already existing last-ID state, while keeping genuine reset/forward-gap detection.

## Required evidence before enabling behavior

- Actual decoded-library mutation checks independently for both exact bases: hash/size and original-byte preconditions, intended-only byte changes, ELF mapping integrity, idempotence, transitions, and preserved older layouts/defaults.
- Replay cases: phases 0–3 of 1 ID, forward progress, old ID after new ID, duplicate phase, send failure, initialization ID 0, connection restart, reset-counter transition, and sequence wrap. A pure threshold-widening test is insufficient.
- Same-scene runtime comparison with sender IDs, receiver IDs, stream resets, decoder-output gaps, and memory counts. Separate measurement overhead from the original hitch stream.

No deployment or runtime success is claimed. The currently proven defect mechanism is that stale pose IDs can provoke repeated host stream resets; the original location of the delay/reordering remains unmeasured.

# Shared warning contract and transport implementation plan

> Execute inline using `superpowers:executing-plans` and test-driven implementation. Continue under the user's existing implementation authorization.

**Goal:** Carry complete native semantic warnings through a bounded authenticated event channel, alongside existing schema-1 telemetry.

**Spec:** [Native warnings design](../specs/2026-11-02-flitsmeister-native-warnings-design.md), sections 6–9, 12–14.

**Architecture:** Share immutable primitive warning values and state machines between FM, Maps and Vela. Keep Android Bundle/Binder adaptation separate from plain Java policy. Preserve STARTUP_V1 and schema 1; expose only optional capability discovery until provider and receiver integration passes the native gates.

## Constraints and rulings

- Preserve native type/subtype, original text/language/origin, native phases/repeats, optional geometry and separate state/announcement deadlines.
- Enforce 4 KiB UTF-8 messages, 24 KiB encoded events, eight events/128 KiB per batch, 128 events/thirty seconds per journal, four authenticated registrations, sixteen pending announcements.
- Keep plain Java policy free of host classes. Include the new source set only in FM, Maps and Vela.
- Treat missing geometry as unknown. Never add speed/distance/cooldown gates to native ANNOUNCE.
- Authenticate every Binder request and callback; do not substitute registration tokens for UID authentication.
- Persist grants before replying; retain uncertain-output fencing across process death. Never persist replayable warning messages/coordinates in the durable grant ledger.
- Keep provider audio silent during the existing managed lease. Do not claim engine readiness, event readiness and playback completion are equivalent.
- Native capture/speech acceptance remains open in the [binding plan](2026-11-02-native-warning-bindings.md). Shared protocol implementation can proceed independently; rollout remains gated on all native and end-to-end tests.
- Ruling: use exact Bundle scalar types (Integer/Long/Double/Boolean/String), preserve unknown scalar fields for minor-compatible round trips, and reject custom Parcelable/nested event fields. Measure actual Parcel size, including unknown fields, rather than character count or estimates.
- Ruling: do not couple state expiry to announcement expiry. CLEAR needs identity/clock fields but must not invent a spoken payload. Expired but structurally valid events retain their original clocks so policy can report EXPIRED.

## Task 1: Immutable event codec and bounded batching

Files: `support/navigation-alerts/src/main/java/nl/johninnl/navigation/alerts/WarningEvent.java`, `WarningCodec.java`; the three extension source sets; shared JUnit tests hosted by the FM extension.

Interfaces: `WarningCodec.decode(Bundle,long) -> WarningEvent`, `encode(WarningEvent) -> Bundle`, `encodeBatch(List<WarningEvent>) -> Bundle`, `decodeBatch(Bundle,long) -> List<WarningEvent>`, `splitBatches(List<WarningEvent>) -> List<Bundle>`.

- [x] Write failing tests for native emergency-behind text without geometry/speed; strict types and clocks; UTF-8/binary limits; immutable copies; unknown primitive fields and protocol versions; independent deadlines; minimal CLEAR; ordered, bounded batching.
- [x] Implement the codec and event values; run the FM unit task and verify real Parcel round trips.
- [x] Compile/test the shared source set in Maps and Vela; run Waze compatibility checks and required repository checks.

## Task 2: Journal, cancellation and explicit recovery

Files: shared `WarningJournal.java` and policy tests.

Interfaces: process-session-bound append, immutable current-state snapshot and resume result with head/retained range, explicit RESYNC_REQUIRED/OVERFLOW, expired/cancelled announcements filtered without inventing new warning identity or observation clocks.

Ruling: retain original transport records while either their state or announcement is valid (CLEAR tombstones last thirty seconds). Resume declares any sequence gap explicitly and returns a data-only current-state snapshot plus still-eligible native authorities. A replay candidate pairs its original ANNOUNCE authority/deadline with a later same-phase/index state revision; it never rewrites the original transport record or grants playback. Source BEGIN_ATTEMPT must query this authority lookup, so CLEAR/expiry can reject playback even if a receiver missed the cancellation. Bound both retained history and latest warning/tombstone state to 128 records; report overflow explicitly and latch degraded status rather than evicting a valid ANNOUNCE/CLEAR silently.

- [x] Test native ordering, duplicates, conflicts, deliberate repeats, revisions, CLEAR, expiry, bounded retention/overflow and session restart.
- [x] Define explicit recovery across coalesced/expired sequence gaps; a cursor may advance only through validated contiguous acceptance or a declared state-resynchronization boundary.
- [x] Implement and verify the journal without treating replay as permission to play.

## Task 3: Durable grants and audio ownership

Files: plain Java `WarningCapabilities`, `PlaybackGrant`, `PlaybackStore`, `WarningAudioOwner`; Android `AtomicPlaybackStore`; policy/file/probe tests.

Rulings: permit one outstanding warning-output grant globally; the receiving scheduler must establish quiescence before preemption/retry. Bind grants to UID, per-live-consumer nonce, provider session, owner token/epoch, semantic-key hash, payload revision and attempt nonce. Persist only those opaque identities, boot identity and disposition/started state; never warning IDs/text/coordinates. Keep at most 128 in-memory attempt dispositions while their source records are relevant. Lease expiry/restart never clears a possibly playing grant. NOT_STARTED requires explicit quiescence from the same live consumer nonce and is invalid after known STARTED. Terminal/quiescent old-grant reports remain valid after epoch revocation; stale STARTED never does. Unknown-but-quiescent output permits future warnings but never automatic replay of that same uncertain event.

Use a checksummed bounded binary private file with fsync + atomic rename + directory sync. Treat load/write ambiguity as fenced uncertainty. Reset a corrupt/uncertain ledger only through provider-internal verified parked recovery; do not expose an arbitrary receiver reset. Read Android boot count as the stable same-device boot identity; unavailable identity blocks grants instead of guessing from wall time.

- [x] Implement first-ready ownership, two-second renewals/six-second lease, epochs, readiness/capability checks and conservative UNCERTAIN fencing.
- [x] Test lost grant replies, owner death, provider restart, old authenticated terminal reports, nonce idempotency, NOT_STARTED evidence, stale callbacks and boot identity.
- [x] Persist only the small opaque uncertainty ledger atomically before grants; fail closed on persistence failures.

## Task 4: Authenticated Binder transport and startup discovery

- [x] Add optional authenticated STATUS discovery with an unchanged default for Waze.
- [x] Add endpoint/client, four-registration bound, callback UID/descriptor validation, death handling and bounded dedicated delivery workers.
- [x] Establish callback/cursor before cold startup and inspect capabilities before the existing running-state return.
- [ ] Test caller mismatch, partial capability clients, hung receiver isolation, replay gaps, source switches and legacy compatibility publication policy.

## Task 5: Integration and full goal acceptance

- [ ] Wire native FM capture and both receivers/schedulers/adapters/settings/UI to this channel.
- [ ] Preserve existing telemetry/source choices and independent Flock behavior.
- [ ] Complete original-artifact rebuild/install, source-to-output timing, physical phone/car acceptance, bilingual documentation, review and CI. Stable promotion requires separate authorization.

## Execution record

- Starting state: clean isolated design worktree at `8c33424`. Previous goal turn made progress through native runtime evidence and a private selective pending-speech fence.
- No event implementation, journal, owner ledger or Binder event endpoint existed at task start. This plan preserves the full three-app objective; codec tests alone do not establish complete delivery or spoken warning support.
- Tasks 1–2: implemented `WarningEvent`, `WarningCodec` and `WarningJournal`; 25 shared regression tests (12 codec, 13 journal) cover the specified core boundaries. Actual API-34 Parcel instrumentation preserved eight large events in 121,940-byte and 40,708-byte batches. Shared classes are defined in all three rebuilt MPE payloads and absent from Waze's payload.
- Review fixes: cancellation sequence floors persist across later state/repeats and overflow; revision floors outlive expired display state while old records remain; accepted unsaid text revisions remain attached to their original live authority through display expiry/new repeats. Original transport records/deadlines are immutable. Each defect had observed red/green regression coverage and reviewer recheck.
- Ruling: source emission time is nondecreasing in sequence order, preventing a CLEAR tombstone from expiring before an earlier authority. Original native observation time may be older and is never refreshed. Each retained authority may reference one accepted payload revision (at most 128), pruned on cancellation/authority expiry separately from visible state.
- Build verification uses the existing johninnl credential only in the Gradle process environment; no credential or generated version/catalog was changed. The patch Android build, patch tests and FM/Maps/Vela/Waze unit tasks passed. Tasks 4–5 and the native binding/phone/car acceptance gates remain incomplete.
- Task 3: implemented capability negotiation policy, one-owner leases, one durable outstanding grant, bounded attempt dispositions and a private checksummed/file-locked no-backup store. Positive quiescence is required to retire possible output; stale/new-consumer reports cannot clear it. Readiness/mute/mode/revision changes never issue a mismatched retry grant. Pre-grant filtered/muted outcomes do not require output permission or displace another active warning.
- Independent review caught descriptor ownership, death fencing and changed-revision retries. Observed red/green regressions fixed each. Real Android 100-write FD counts changed from 72→175 before explicit closure to 72→75 after; the latter includes unrelated app initialization drift rather than one FD per write. A fresh-process native fixture reloaded the durable grant, refused new ownership as AUDIO_UNCERTAIN and rejected stale-consumer/STARTED reports. The fixture never invoked audio and used explicit test-only parked cleanup; it does not establish real receiver stop or Binder authentication.
- Task 4 implementation: authenticated `WarningEndpoint`/`WarningConnection`, bounded source actor and four isolated delivery workers, reverse callback challenge, frozen paged views and explicit cursor ACK. `WarningSession` prepares callback/replay before STARTUP_V1 can start the provider or return running. Maps/Vela consume semantic display state before ACK and coalesce UI rendering. Same-process reconnects preserve the consumer nonce; each provider retains one bounded control worker even if an old IPC hangs.
- Actual API-34 cross-process fixture: source UID 10198, allowed client UID 10199, unauthorized client UID 10200. Remote Binder descriptor discovery and wrong-UID callback rejection passed. Handshake took 11 ms; synthetic live event age was 3 ms after the initial snapshot. Claim, durable BEGIN, positively quiescent NOT_STARTED and RELEASE succeeded; the unauthorized registration was rejected. No speaker was created and readiness was explicitly simulated. These observations prove this transport fixture, not FM native capture, warning playback or car routing.
- FM now supplies guarded regular/early/CITS capture and endpoint discovery. The production patch applied and rebuilt successfully from the pinned original split set. Native source coverage remains `complete=false`; ownership therefore refuses exclusive playback. Maps/Vela receive/display native text, but receiving scheduling, full category/priority acceptance, settings and native phone/car audio acceptance remain open. Vela system/Tone and Maps guidance/speech adapters are implementation candidates awaiting those integration gates.

- Latest validation: 235 extension tests passed (FM 78, Maps 52, Vela 48, Waze 57); 41 patch tests ran: 35 passed and six skipped, including executed pinned-original Maps/Vela warning-hook tests. Python: 439 tests ran, with 394 passed and 45 skipped. All three patch selections applied and rebuilt against the supplied original artifacts; these are rebuild checks, not installed native audio acceptance. An authenticated health PING now retains idle registrations without recreating snapshots or extending output leases. The cross-process fixture passed again with that PING and refreshed source/build hashes.

- Receiving implementation checkpoint: `WarningScheduler` is wired into both apps with a sixteen-entry priority/deadline queue, source grants, two-second renewals, native repeats, unsaid revision updates, positive-quiescence preemption and actual outcome ACKs. Lost-grant/revision/reconnect tests use the genuine owner/ledger; process-local opaque no-submission facts can retire only their own known-unused grant. Unknown output remains fenced.
- First-use category/output review and explicit legacy preference origins are implemented. FM event negotiation latches off duplicate legacy heuristic audio; FM telemetry no longer masks independent Flock settings. A bounded authenticated legacy-control registry gates full claims and revokes pending new output conservatively. Phone/car compact code supports multiple native messages; native surface inspection and parked preview/recovery remain pending.
- Current checks: 302 extension tests passed (FM 124, Maps 64, Vela 57, Waze 57). Patch suite: 44 tests, 38 passed and six skipped; exact-original FM/Maps/Vela transform guards ran. Python: 439 tests, 394 passed and 45 skipped. Markdown: 306 files / 1412 links passed before this execution-record update. Separate runtime evidence remains bounded; the full [acceptance matrix](../../research/2026-11-03-native-warning-acceptance.md) records unresolved R1-R8 gates.

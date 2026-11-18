# Native warning protocol core

This source set implements the event codec/journal, authenticated Binder transport, receiving scheduler and durable ownership core for the [native warning design](../../docs/superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md). FM, Maps and Vela compile these sources. Native capture, receiver display, settings and speech integrations exist; complete native capture/speech/phone/car acceptance remains pending. FM producer coverage has passed the pinned capture audit; integrated receiving/routing/UI acceptance remains separate and incomplete.

## Codec

`WarningCodec.decode(Bundle, now)` validates and copies the event into `WarningEvent`. `encode(event)` returns a new Bundle. Only String, Integer, Long, Double and Boolean fields are accepted; unknown scalar fields survive minor-compatible round trips. Nested/custom Parcelable event values, arrays, wrong scalar types, malformed Unicode and future observation/emission clocks are rejected. Version 1 remains independent of navigation schema 1 and STARTUP_V1.

Messages are limited to 4 KiB UTF-8 without truncation. Events are limited to 24 KiB measured through actual `Parcel.writeBundle`, including unknown fields. `encodeBatch`/`decodeBatch` enforce at most eight events and 128 KiB. `splitBatches` partitions by whichever limit is reached first, preserving every event. Batches require increasing sequence numbers from one provider session; detecting missing contiguous sequences belongs to the journal/client cursor policy, not successful codec parsing.

Keep native family/subtype, message/language/origin, phase, category/priority and relationship distinct. Native emergency-behind events require neither speed nor coordinates. Geometry is optional; when present, distance/trigger/position include their own observation timestamp and explicit estimated flag. Zero distance remains valid. No receiver camera-distance or cooldown heuristic is part of this contract.

Fallback announcement deadlines are at most five seconds after emission for P0/moving-emergency events and ten seconds otherwise. An audited native deadline can be marked `deadline_native=true`; its provenance remains the provider adapter's responsibility. State validity is at most thirty seconds from the actual observation. Announcement and state deadlines are independent, and decoding/replay never changes either clock. CLEAR needs identity and observation/emission fields but invents no spoken payload.

## Journal and replay

`WarningJournal` belongs to one provider-process UUID. Append requires the next sequence and nondecreasing emission time; native observation times may be older. Exact retained transport duplicates are idempotent, conflicting payloads/semantic ANNOUNCE identities are rejected, and new native repeats require distinct announcement indexes.

The journal retains at most 128 original transport records for at most thirty seconds, while their state or announcement remains valid. CLEAR tombstones remain for thirty seconds. Another bounded map holds at most 128 latest warning/revision/cancellation records; each retained ANNOUNCE may reference one accepted same-phase/index payload revision. These references are bounded by the 128 retained authorities and disappear on cancellation/authority expiry. No journal data is persisted.

Revision and cancellation metadata outlive an expired/replaced display payload while older records remain. A later UPSERT or native repeat cannot resurrect an authority cancelled by CLEAR. Likewise, a newer unsaid instruction does not revert to its original text when display state expires or a later native repeat arrives. The replay candidate keeps its original ANNOUNCE identity and deadline separately from the revised payload.

Superseded UPSERTs are coalesced before exhausting history capacity. Valid ANNOUNCE/CLEAR records are not silently evicted. Overflow advances the transport head, explicitly reports loss and latches degraded status. Even an unretained CLEAR updates the cancellation floor, so the source lookup cannot grant playback of an older danger.

`resume(session, afterSequence, now)` returns original retained records, data-only current state, eligible native announcement candidates, head sequence, overflow and explicit resynchronization status. Any missing sequence—including coalescing/expiry/overflow—is a declared resynchronization boundary. A current-state snapshot is authoritative at that head: older replay records must not overwrite it as newer display state. A different session invalidates the old cursor; an impossible future cursor in the same session is rejected.

Replay candidates are **not playback grants**. Authenticated BEGIN_ATTEMPT calls `announcement(warningId, phase, index, now)` against current source state and applies ownership/capability/durable-grant checks. This rejects CLEAR/expiry even when a consumer missed a cancellation. Scheduling and passage checks remain separate work.

## Ownership and durable grants

`WarningAudioOwner` coordinates one ready audio owner with a six-second lease and a two-second renewal interval. Silent mode intentionally retains ownership without a voice engine. Source coverage, the negotiated capability digest, all enabled semantics, supported output mode and current readiness are separate checks. An unavailable repeated claim/renewal removes readiness without extending the old lease. A second receiver cannot steal an active lease.

At most one output grant is outstanding globally. `begin` queries current source announcement authority, checks its payload revision and owner binding, and persists the grant before returning `GRANTED`. Idempotent nonce retries return the same attempt; they never authorize a second local speaker start. A changed revision or output mode refuses the old permission while retaining its uncertainty fence. After known STARTED, retrying BEGIN returns `ALREADY_HANDLED`. Receiving code still needs a local one-shot attempt fence and final generation/lease/mute checks.

Each attempt binds UID, live-process consumer nonce, provider session, owner token/epoch, semantic-key hash, payload revision and attempt nonce. Receiver restart must generate a new consumer nonce; do not persist/reuse it. A granted record means output **may** have played, not that it started or completed. Native adapter callbacks supply those observations. The 128-entry in-memory disposition bound reports overload explicitly rather than evicting active uncertainty.

Death/restart/lease expiry never proves output stopped. Pending grants fence failover as `AUDIO_UNCERTAIN`; stale STARTED is rejected, but authenticated terminal/quiescent old-grant reports remain acceptable. NOT_STARTED requires positive quiescence from the same live consumer and is invalid after known STARTED. Unknown-but-quiescent output permits future warnings while suppressing replay of that uncertain event. Intentionally muted/filtered decisions can be recorded without issuing playback grants; decisions for other warnings do not alter an active output grant.

`AtomicPlaybackStore` holds an exclusive writer lock for the provider actor lifetime and writes a checksummed, bounded binary file in provider-private no-backup storage. It syncs file content, atomically renames, then syncs the parent directory. Explicit descriptor closure is required for Android's non-owning `FileOutputStream(FileDescriptor)` wrapper. All file operations require the dedicated worker, never the native/main thread. Only opaque grant identities/hashes, boot identity and disposition/started state are stored; there is no warning ID, message, coordinate or replayable prompt. Boot identity comes from Android boot count, not wall-clock estimates.

Load corruption, ambiguous writes and failed clears stay fenced. A different verified boot clears old output uncertainty; arbitrary receiver-supplied reset flags must not. Provider-internal parked recovery is permitted only after verifying previous output stopped. Phone parked preview/recovery controls are implemented; their UI/runtime acceptance remains pending. Preview is synthetic and grant-backed. Source-owned manual recovery revokes previous announcement authority so a reset cannot replay it.

## Binder and startup integration

`WarningEndpoint` authenticates the UID before decoding every request. Registration binds the verified package/UID, consumer process nonce and callback binder through a reverse challenge. Four registrations use separate fixed delivery workers; remote callbacks never run on the source actor or UI. Token redaction includes the registration/consumer identity. Native capture enqueues with its original observation/deadlines and an ingress emission time; actor backlog cannot refresh a warning.

`WarningConnection` checks the actual source callback UID and validates events before advancing its bounded acceptance cursor. Frozen snapshot pages keep one head and require an explicit ACK before live delivery. `WarningSession` runs that handshake on the existing startup health path before cold engine startup and before the running-state early return. Later authenticated health PINGs retain quiet registrations without renewing audio-owner leases. Provider changes fence old connections; Maps/Vela keep bounded semantic display state and one coalesced UI render. Source capture overflow blocks new exclusive grants and requires resynchronization.

The owned API-34 fixture exercised actual distinct source/client/unauthorized UIDs, remote descriptor discovery, callback authentication, snapshot-before-live ordering, a durable grant and a no-output NOT_STARTED/release. Speaker readiness was simulated, and no speaker was constructed. The fixture does not establish native FM capture or audible playback.

## Verification

Shared protocol regression tests live in the FM extension's `nl.johninnl.navigation.alerts` test package. Run the FM, Maps-extension and Vela unit tasks plus Waze compatibility checks. The full patch build verifies source-set integration; it does not prove complete spoken warnings.

The test-only native probe's `scenario=codec` compiles these production sources into instrumentation and exercises the codec against real Android Parcel. It preserves eight large synthetic events by splitting them into 121,940-byte and 40,708-byte batches on the controlled API-34 emulator. This is codec evidence, not proof of native FM capture, cross-UID event authentication, audio or car routing. See the active [transport implementation plan](../../docs/superpowers/plans/2026-11-02-warning-contract-transport.md) for remaining work.

An actual start remains reportable after cancellation was requested. The source never grants the same authority again after a started, interrupted, failed or uncertain attempt. Automatic retries require positive evidence of no output; a terminal stop alone proves quiescence, not that playback never began. Identical state/geometry revisions retain the accepted immutable speech payload and original grant/deadline; a changed unsaid message still requires confirmed cancellation before replacement.

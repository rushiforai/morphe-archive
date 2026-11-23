# Deezer ordinary session queue selection

Source candidate on `6559e264b429bb95ece5df910bb714ca5a289cee`. First-party implementation; no third-party patch source copied. Source reviewed with Astra, thread `01a20061-61c8-7242-a992-ccf2fa0f20c8`. This is a source handoff, not a runtime acceptance receipt. No physical device or emulator was accessed by this worker. Builds remain assigned to the combined validation worker.

## Owner acceptance baseline

The owner confirmed native phone Up next works across 80 tracks. The ordinary MediaSession exposes a 31-row window, and action mask `257330` (`0x3ed32`) omits `ACTION_SKIP_TO_QUEUE_ITEM` (`0x1000`), including after login. Preserve native phone selection. Export only the provider's actual visible window in its original order, rather than expanding it to the phone queue.

## Real inputs and native trace

| Input | APKM SHA-256 | Original base APK SHA-256 |
| --- | --- | --- |
| 9.0.26.3, owner Desktop/music archive | `da064bfb8391b4a2f2ae60b158f76ea08b439b534156e2ec694e633ccf568807` | `201570558ff8248e6d0b5052391ebfe4b8908d86fae8986c8437b99c0cf40f0c` |
| 9.0.27.3, owner Downloads archive | `ca4c9662e18f49d11b234c1c21437767d7afe1551aa28abf9dbabdaa1be7d83e` | `55cdfca29e654f32486e0ff714fe6de76bdcb7d2ead43ac9092345a6a72dbba7` |

Exact archive paths are retained in `.tools/artifacts/deezer-queue-20261122/inputs.json`. The 26 decoded cache was reused from the previously hash-verified original. Additional instruction evidence was read directly from both original base DEX sets. The 27 targeted JADX service/callback/state exports reported errors; their output is supporting navigation only, not authoritative executable evidence. The native DEX inspections exited successfully.

On 26, `llIIIIIIIlIlIll.invoke` constructs each QueueItem with `IllIIllIllIlII.lIllllIIIIII(track)`, which returns `track.getPosition()`. `IlIIIlIllIIlllIl.invoke` case 22 computes current minus 10 through current plus 20, adjusts boundaries and returns `List.subList`. `IlllIllIIIIIlIII.invoke` maps that view in order. These are absolute native positions, not local window indices.

`lIlIlllIIIIllll.onSkipToQueueItem(long)` already exists. It posts the native remote-command event, asks `IlIIIIllIIIllIll.lIllllIIIIII(long)` to resolve the native position, builds the ordinary GoToTrack command and calls `JukeboxService.IIIIlIIIIIIIIlll`. The service checks existing context/account masks 1, 2 or 8 before the normal playback path. The native player wrapper retains its interruption/queued-ad decision. No callback implementation needs to be invented.

The command synchronously reaches `IlIIIIIllIlIIlI.IlIIIllIIllIll(String,int,int,boolean)`, then its native position-selection method and `IIIIlIIIIIIIIlll(boolean,int,request,boolean,int)`. In the latter, original DEX instructions 10–11 read the selected row; instruction 12 rejects null; instructions 13–15 replace current playback data. The added consumption guard sits immediately after the selected-row read and before these stores. The shared cursor getter and neighbor reads are unchanged.

On 27, `IIIlIlIIIIIl.onSkipToQueueItem` also resolves through the native queue before calling its native GoToTrack path. The queue resolver compares the requested ID with `IIIllIlllllIlll.lllIllIlllllIIl(track)`. That helper computes a 32-bit `Objects.hash` of three native getters (`lIIlIlllIlIllI`, `getId`, `lllllIIllIlllI`) and widens it to long. It is not the 26 positional protocol. This work does not advertise or implement 27 support. Protected startup and that distinct ABI require a separate supported-target batch.

## Controlled identity boundary

The independent Kotlin patch and `extensions/deezer-queue` implement the ordinary session choice `Enable queue item selection`. Its only patch dependency is original-input validation. It does not depend on or change entitlement, streaming, host or phone-menu patches.

The native mapper carries its full source-list identity and generation captured before retrieval, plus the actual objects used for each published QueueItem. The existing 31-row mapper still chooses the window. Only that window is passed through the session boundary. Each published row receives a monotonic, process/session-scoped opaque handle, allocated for one actual occurrence. Every publication allocates fresh handles, including same-content reloads. No handle is reused for another occurrence. Native positions, descriptions, extras, phone queue order and GoToTrack data remain native outside this boundary.

The bridge checks each emitted raw position against one direct native cursor read and native occurrence equality (media ID, audio-context ID, native position and original position). A song ID alone is never an occurrence ID. Duplicate songs remain separate occurrences. The apparent native long key is `AUDIO_CONTEXT_ID`, so it is deliberately not treated as a stable row key. New snapshot work is O(window size), capped at 10,000 rows; the real mapper window is at most 31. The unchanged native callback performs one existing queue scan per accepted command, rather than one scan per published row.

The exported playback state copies the native state and changes only the queue-selection bit and active queue-item ID. Active IDs use the same live handle map; an item outside the window or an unresolved transition uses unknown `-1`. A publication first removes selection and active identity, publishes the mapped queue, then restores a coherent state. Null, unsupported or failed mapping invalidates all handles while preserving the original raw queue/null. Failed queue publication invalidates the map before state restoration. Other action bits and native internal states remain unchanged.

Incoming IDs are checked before the native event or playback side effects. The original callback's actual GoToTrack invocation binds its exact command object to a scoped request. Unrelated/reentrant native commands have no selection guard; command/request state is restored in `finally`. At authoritative selected-row consumption, the handle must still be live and mapped to the same entry, generations must match and native eligibility must still permit selection. A replacement/reorder/reload, unknown ID or same-source republish cannot retarget an old request. Added validation failures deny selection; original native command exceptions remain native.

If a queue changes reentrantly after a valid request entered the native callback, the later consumption check prevents wrong-track dispatch. The native event/pause or preference effects that already occurred before that race are not claimed to be reversible. No native lock is held across EventBus, pause, Binder publication or other external callbacks.

## Provider mutations and cursor stamps

Cursor-assignment epochs alone were insufficient: SQL can change a row before loader replacement, including an indistinguishable duplicate in the same slot. The source and playback cursor holders now increment separate volatile epochs on actual assignments, and the provider boundary additionally fences identity-changing writes before native SQL and until its original method returns or throws. Overlapping writes never expose a stable generation; rollback/failure also retires the prior generation.

The original `AudioQueueProvider` bodies and SQL remain verbatim behind typed wrappers. The queue DB helper `llllIllllll` (`audio_queue_v2.db`) is constructed by this provider. `IIlIIIlIIl` names `QUEUE_TRACKS`; the original update matcher 300 passes supplied ContentValues directly to that table. Inserts, bulk inserts and deletes on track/context paths are fenced. Track updates fence all keys except proven `BOOKMARK` and `HEARD_STATUS` metadata; unknown keys, SQLite rowid aliases and case variants are fenced. Native clear/reorder/shuffle calls are fenced. `set_position_from_origin_position` selects a row's POSITION by ORIGINAL_POSITION, then writes the current pointer to INFO.POSITION; it does not reorder or replace rows and remains excluded.

Queries receive a delegating CursorWrapper with a namespaced generation extra. Existing extras and every row operation are preserved. A query overlapping any active write is permanently unselectable. Requery permanently invalidates its stamp. Missing/malformed/failed extras reads yield `-1`, never valid epoch zero. Both concrete loader cursors must carry the source generation and match the current stable provider epoch at mapping and consumption; a new mapper cannot relabel an old cursor as fresh. Provider and service have no distinct process override in the original manifest. Missing stamp propagation fails closed.

Teardown retires every handle, clears native owner/session/state references and clears the publisher's bridge field before native release. No static map retains a service or cursor. Only monotonic counters and scoped ThreadLocals remain, with the latter restored or removed on every dispatch exit.

## Required checkpoint and runtime acceptance

The source tests cover native 26 field descriptors and branch targets, unchanged SQL/dispatch/shared reads, generation assignments, source sealing, duplicate `[A,X,A]` occurrences, same-slot replacement, reorder, stale/unknown/denied IDs, A→B→A, delayed publications, republish during dispatch, reentrancy, teardown, validation exceptions, overlapping provider writes, linear snapshot work and a 31-row window within 80 native rows. They are authored but not run by this worker. The validation owner must set `DEEZER_QUEUE_26_APK` to the real original base so native integration tests do not skip.

The final combined checkpoint must run the authoritative verifier and actual original-APKM application, including queue-only and combined choices. Inspect the emitted DEX, dependency closure, exact native field/method references and unchanged resources. Do not count another candidate's earlier passing evidence as queue evidence.

After the grouped build, an explicitly owned runtime session must verify eligible ordinary-controller selection of a non-next row and the second duplicate occurrence; exact provider window/order; native phone selection outside the window; active ID inside/outside the window; shifted windows; stale taps after replacement/reorder and queued across mutation; denied accounts/interruption states; source-query cursor extras through the actual resolver; malformed/failed stamp handling; lifecycle teardown/rebind. Use genuine playback/account data. No physical-device installation or instrumentation is authorized by this source task. Runtime acceptance remains open.

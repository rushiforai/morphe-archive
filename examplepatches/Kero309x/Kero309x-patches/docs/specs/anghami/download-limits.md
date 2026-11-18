# Expand download limits

- **Id:** `anghami.downloads.limits`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Account and entitlements

## Observable behaviour

The application restricts how many tracks can be kept offline, and refuses some
downloads for accounts on a limited plan. After patching, the client no longer
enforces those local limits, so downloads that the client itself would have
allowed proceed.

The client repeats the offline count in four places rather than in one: an
upfront validator, a per-item counter inside the download loop, a service-side
check before a queued record is handed to the download helper, and a post-sign-in
cleanup that trims the library back to the cached allowance. All four are
answered in their "no limit" form; patching only the first would still refuse or
delete the same download one step later.

## Preconditions

A signed-in account that is allowed to download at all.

## Acceptance criteria

- [ ] The download counter does not block a new download when the previous limit
      was reached, including the counter inside the download loop.
- [ ] A track that was refused only because of a client-side limit downloads.
- [ ] A download accepted by the patched client is not deleted by the next
      post-sign-in cleanup.
- [ ] Already downloaded content remains playable offline.
- [ ] Deleting a download still works.

## Out of scope

Anything the server refuses. If the server rejects a download request, the patch
does not fabricate a successful download, and it must not be described as doing
so.

## Open questions

- Which of the limits are enforced from a locally cached plan object, and which
  come from a server response that must not be overridden? Answered for the local
  limits: the plan check, the limited-plan collection restriction and the offline
  count are all read from the locally cached account and the local object box.
  Whether the server independently refuses a download has not been observed.

## Known limitation

The stock validator also refuses every download when the local database is flagged
as potentially corrupted. That branch protects the stored library rather than
limiting the plan, so the patch re-implements it in its own instructions instead of
dropping it.

The post-sign-in cleanup does two unrelated jobs: it deletes records above the
cached allowance, and it reconciles the download directory against the records
that still exist. Only the first is a limit, so the patched body calls the
directory reconciliation and returns, leaving orphaned files handled exactly as
the stock build handles them.

## Verification

1. Download until the previous limit is reached.
2. Attempt one more download and confirm it starts and completes.
3. Sign out and back in, then confirm the newly downloaded track is still in the
   library.
4. Go offline and play the newly downloaded track.
5. Confirm the library still lists the download correctly.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived code points (stock 8.0.28):
  - `Lcom/anghami/ghost/downloads/DownloadManager;->assertDownloadRestrictions(Lcom/anghami/ghost/local/Account;ILcom/anghami/ghost/objectbox/models/downloads/SongDownloadReason;)V`
    — upfront validator; replaced with a body that only re-throws the
    database-corruption reason.
  - `Lcom/anghami/ghost/downloads/DownloadManager;->assertDownloadLimitReached(Lcom/anghami/ghost/local/Account;I)V`
    — per-record counter in the download loop; returns immediately.
  - `Lcom/anghami/ghost/downloads/DownloadService;->canDownloadRecordWithMaxOfflineCount(Lcom/anghami/ghost/objectbox/models/downloads/SongDownloadRecord;)Z`
    — service-side counter; answers true.
  - `Lcom/anghami/ghost/downloads/SimpleDownloadActions;->cleanDownloads${'$'}lambda${'$'}2()V`
    — post-sign-in trim; body reduced to `cleanDownloadDirectory$default(false, 1, null)`.
- Fingerprints are derived from the stock APK; no external patch source was used.
- Verification run: `gradlew.bat build verifyPatches`, patch reported `PASS`, edits
  confirmed by decompiling the patched APK.

# NuvioTV merged tracking progress

Latest device feedback (2026-10-24): the user reports that the current build now
seems to work correctly after the cached episode-marker change. Provider-side
watched receipts, particularly MDBList, remain to be checked on the next episode.
Playback writes still target only the configured main tracker; included services
are merge read sources, not a broadcast list for watched updates. This feedback
does not establish successful writes to every provider or eliminate rate limits.

## Restore episode markers without per-show tracker reads (beta.8, 2026-10-24)

The 10:07-10:11 capture confirms the Home CW pause at 10:08:30.266 and merge
cancellation at 10:08:30.318, yet application jank and GC continue during playback.
The previous pause is therefore not a demonstrated fix for the reported frame loss.
The capture also contains native Trakt refresh work after cancellation, subtitle
render delays, and rebuffering; it cannot establish one exclusive playback cause.

Quick sync had explicitly disabled compact membership restoration and reported
membershipDeferred=true. Episode details delegated to one provider's native
episodeProgress flow, or exposed only paused CW entries while playing. Native
Trakt observeEpisodeProgress starts ensureEpisodeProgressSnapshot in its service
scope from onStart, which outlives cancellation of the caller's collector.

Quick sync now restores the compact episode membership cache, without decoding
full WatchedItem history. Membership publication notifies existing episode-detail
collectors. Episode details project completed WatchProgress records only for the
requested show's cached membership, together with current progress. This projection
runs off Main, reuses completed records while membership is unchanged, handles
unmarks, and suppresses output after profile changes. It does not collect native
per-show tracker flows. These read-only records never become CW seeds, persisted
playback progress, or tracker writes. Local membership additions are persisted.
Remote freshness still depends on a successful provider update; the cache does not
invent watched entries that were never synced.

Original DEX evidence: ../.inspect-nuvio-beta8/cached-episode-model-contract.txt.
WatchProgress's public 26-argument constructor and SOURCE_REMOTE_HISTORY String
field are verified against the original beta.8 APK. Host checks exercise cached
markers, ongoing progress, removal of watched entries, immutable prior snapshots
and reuse of completed records. Device validation is still required for episode
markers and playback frame loss; no claim that all playback stalls are resolved.

## Pause the native Home CW pipeline during playback (beta.8, 2026-10-24)

The 09:50-09:52 capture shows merge cancellation at 09:51:10, roughly 47s before
playback starts. It does not prove the merge worker ran through playback. During
the first ~20s there are 41 MetaRepository messages for other CW shows, 13 native
SimklCwDiag messages and repeated application GC/jank. The native Home CW job is
separate from the merge worker and remains active while its back-stack Home exists.
The ASS renderer's late=159 counter is not a decoded-video drop counter; this
capture confirms rendering stalls, without independently measuring the reported
159 dropped video frames or proving one exclusive cause.

The merge patch now observes the assigned native CW pipeline Job, cancels that
specific job on player entry, and resumes it once on return to Home. It preserves
the existing UI snapshot, does not cancel the Home ViewModel scope or unrelated
native library/player jobs, and leaves the disabled path untouched. A pipeline
created during playback is cancelled immediately. A stale/different Home owner
cannot be resumed. This targets verified overlapping work; frame loss is not
claimed resolved without a device retest.

Latest input: original com.nuvio.tv 1.1.0-beta.8/code1071, SHA256
7aeae6f64e9128be2c7545c50061376839e20a88d47722ac220ba40be7c182f8.
Evidence: ../.inspect-nuvio-beta8/playback-home-job-contracts.txt,
playback-home-coroutine-contracts.txt and playback-home-pipeline-contracts.txt.
Native static Lxa/s3;->b(Lxa/s3;)V has 14 registers and fingerprint
c91895ea981a1f76696b7f0330b625787b3a08630e274a9e6bc53a2b2f6ddf81.
It starts the IO cache restore, cancels previous i1, launches xa.x4 (the native
combined progress/seed/settings/watched-items collectLatest pipeline), and assigns
the resulting Job to i1 at instruction 28. The new callback follows that assignment,
before instruction 29 RETURN_VOID, using v13 (the Home argument). There are no
register-count, branch or try-region changes. Original missing/ambiguous/changed/
already-patched inputs reject; older-version patch mappings are not extended.

Host checks cover child metadata cancellation, preserved cards, one restart,
already cancelled jobs and changed Home owners. Original-DEX hook rejection and
standalone/combined packaged DEX reload, native library isolation and cross-DEX
checks passed through `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8 :patches:verifyNuvioBeta8Bundle --offline`.
No APK rebuild/signing, installation, device test, commit or push ran. Use the
canonical `patches/build/libs/patches-0.13.0.mpp`. Device checks: pause/resume log
markers, no unrelated CW metadata traversal during playback, preserved CW on
return and reduced rendering stalls.

## Avoid repeated local work and stale live banners (beta.8, 2026-10-24)

The 09:37-09:38 device capture has refresh=false provider reads, not an explicit
manual/full refresh after playback. It does show extra local quick passes (4s and
6s) after the initial 9.5s pass; the initial local publish/save alone takes 7.2s.
Live mergeSnapshot changed the shared syncSteps to six, then its finally block
refreshed the banner after clearing liveMerge, allowing old status to reappear.

Live work now leaves the visible stage count/banner alone, including its terminal
callback. Quick startup consistently uses three stages, including preparation.
A coalesced local-store dirty marker avoids replaying local cache work for
provider-only notifications. Interrupted local work returns its claim for retry.
Unchanged quick progress/seeds skip startup-cache serialization, and unchanged
live progress/seeds/membership/aliases skip publication and persistence entirely.

The patch releases its native provider observers when entering the player and
reattaches them once on Home after playback. Local changes can still be marked
while playing, but merge work waits for Home. This does not stop independent
native tracker jobs. Ordinary Home visits do not start another catch-up pass.
Automatic Continue Watching updates still require event-driven work in the app
process; this is not a separate Android background service or periodic sync loop.

Host/runtime checks cover local work coalescing, provider-only notifications,
interruption retry, the native banner bridge, existing startup/session gating and
provider/cancellation handling. Device checks remain: absence of x/6 on stream
exit, reduced cache-write time, and prompt next-episode updates after playback.
Verification passed via `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioSyncBannerRuntime :patches:verifyNuvioBeta8Bundle --offline`.
The final three-stage preparation change passed another build/bundle verification;
standalone/combined DEX reload, native library isolation and cross-DEX checks passed.
Canonical MPP rebuilt at 09:46:16. No APK rebuild/signing, installation, device test,
commit or push was performed.

## Cache-only startup and lightweight live updates (beta.8, 2026-10-24)

The box log at 09:17-09:23 shows the previous quick path spending 27-36s decoding
membership, then entering the full snapshot reader with refresh=false. Trakt is
not yet history-ready, while Simkl and MDBList repeatedly exceed the imposed
five-second limit. These are cold-load/read deadlines, not evidence of disconnected
accounts. Reconciliation and full history persistence then increase total time to
90-120s. The menu's explicit full sync subsequently completes in 21.4s.

Quick startup now finishes after saved CW/local progress changes. It does not
decode full membership, await provider snapshots or call mergeSnapshot. It then
attaches progress/seed/readiness observers, allowing native cold hydration and
later data changes to request a silent update. It preserves membership-ready=false
until complete membership is available; it never publishes an empty history as
loaded just because the lightweight startup cache was restored.

Live updates use a 45-second provider bound instead of five seconds, skip unready
Trakt canonical history, and do not collect full watched-model flows or serialize
full WatchedItem caches. They persist CW plus compact membership and leave full
model readiness/cache ownership to manual full sync. An unselected native local
watched store is no longer collected. Observers collect q/f/p, not d.

If no remote provider produces a fresh snapshot and local tracking is unselected,
the merge retains the existing CW/history without a new publication or cache
rewrite. A valid empty selection can still remove entries. Startup does not show
provider-unavailable stages; real manual provider failures remain isolated.

Runtime checks cover readiness emissions without watched-model reads and an
all-unavailable attempt leaving the saved flow and persistence untouched, alongside
existing cancellation, cache, playback, and provider-isolation checks. Build,
original beta.8 DEX validation and standalone/combined packaged verification passed
via `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8 :patches:verifyNuvioBeta8Bundle --offline`.
No APK rebuild/signing, installation, device test, commit or push ran. Delivery is
only the usual `patches/build/libs/patches-0.13.0.mpp`; box timing and live episode
updates still require device testing.
Final canonical rebuild completed at 09:33:19. The completion-label adjustment
was rebuilt and runtime/packaged verification passed again in
`.inspect-nuvio-beta8/quick-startup-separation-final.log`.

## Provider failure isolation (beta.8, 2026-10-24)

The 09:04-09:06 log shows native Trakt snapshot fetches ending with
ChildCancelledException/IOException and increasing poll backoff. The merge's
new canonical-history gate then waited until the 45-second provider deadline;
its exception escaped the provider loop, preventing Simkl/MDBList reads and
triggering the whole-merge fallback. The first attempt was cancelled at 21s;
the second process ended without completion; the third hit that deadline.
The native cancellation trace alone does not prove an HTTP 429 or its root cause.

Provider reads now isolate failures, including cancellation of a native child
while the merge Job remains active. Actual parent/user/lifecycle cancellation
still stops the request. Quick/live reads have a five-second provider deadline
and skip Trakt immediately when canonical history is unready. Manual reads retain
the 45-second provider bound, but wait at most ten seconds for canonical history.
No unready optimistic-only Trakt history is accepted as complete.

Other services continue after a failure. Their fresh show snapshots take priority;
cached progress/seeds attributed to failed sources survive for shows without
fresh coverage. Relevant cached watched membership/items/aliases are carried with
those retained entries. Successful empty sources can still remove their entries.
Partial completion explicitly names unavailable services. It does not enter the
whole-merge fallback just because one provider failed or force native retries.
Full watched-model readiness is not asserted after a partial initial snapshot.

Host checks cover Trakt timeout followed by successful Simkl/MDBList reads,
native-child versus parent cancellation, cached exclusive entries, overlapping
fresh entries, and successful-source removals. No native network implementation,
library provider, application label or output-location metadata was changed.
The canonical delivery remains `patches/build/libs/patches-0.13.0.mpp`.
Build/runtime/original DEX verification passed via `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8 :patches:verifyNuvioBeta8Bundle --offline`;
after adding native-child cancellation coverage, the final build/runtime/bundle
tasks passed again. Standalone/combined DEX reload and native-library isolation
passed with no new cross-DEX findings. Canonical MPP rebuilt at 09:11:55.
No APK rebuild/signing, installation, device test, commit or push was performed.

## Canonical Trakt history and silent live updates (beta.8, 2026-10-24)

The 08:51/08:52 log proves partial Trakt publication: initial progress is ready
with 10 seeds, no watched history and Tower of God S1E13. Later it has 271 seeds,
872 watched-history entries and Tower of God S2E26. Playback readiness alone is
insufficient. After collecting the seed flow (which starts native hydration), the
merge now waits for the canonical watched-show loaded flag within the existing
45-second provider deadline. A successfully loaded empty account remains valid.

Original beta.8 DEX evidence: `.inspect-nuvio-beta8/trakt-ready-contracts.txt`,
`Lba/pc;->a:Lba/jb;`, `Lba/jb;->T:Z`. Native static f(), fingerprint
a09333ae5d18eeebbec1a32ba12d457bcbbbdf98a177c95d06c7252f020d99a4,
installs the watched maps u/v/w (instructions 666-668), seed flow q (669-670),
timestamp R (673), then loaded flag T (675). No new native bytecode hook is added.
Latest-only DEX verification validates the provider field and loaded flag.

Old playback entries covered by the winning provider's watched membership and a
newer/equal canonical seed timestamp are removed. Newer intentional rewatches and
episodes without that membership or timestamp remain valid. Provider selection
and the user's highest/recent strategy remain unchanged.

Startup/manual sync retains its visible progress. Subsequent provider/local-store
changes reconcile silently without explicit provider refresh or another startup
request. Entering Home alone no longer marks data dirty. Observers stay attached
across internal navigation so playback changes are not missed; activity pause
still disposes native provider observers. Foreground catch-up uses silent updates.
Live updates do not overwrite the manual sync summary or reset startup completion.

Host checks cover delayed/empty canonical readiness, cancellation, stale paused
sessions, newer rewatches and the existing once-per-session Home gate. Device
retesting is required for Tower of God after startup and playback-to-Home updates.
The supported delivery is the canonical `patches/build/libs/patches-0.13.0.mpp`.
Verification passed: `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8 :patches:verifyNuvioBeta8Bundle --offline`.
Standalone/combined packaged application, native library isolation and DEX reload
passed with no new cross-DEX findings. Canonical bundle rebuilt at 08:57:23.
No APK rebuild/signing, installation, device test, commit or push ran for this change.

## Live quick reconciliation and cancellation (beta.8, 2026-10-24)

Delivery correction: Desktop's 08:42 patch run loaded the current MPP (SHA256
2ffb3b5dc3fdb2cdce9c1ce75cf9faaf7aa3849a781744a58673c72c28928716)
and wrote the updated APK to `Apps/com.nuvio.tv/`. The usual
`Apps/NuvioTV/NuvioTV-1.1.0-beta.8-patches-0.13.0.apk` was stale. That copy is
now replaced with Desktop's actual output; `Apps/NuvioTV/patches-0.13.0.mpp`
matches the build bundle exactly. Both contain quick reconciliation, Cancel sync
and quick_info; the old cache-only completion string is absent. Signature and
alignment passed. File size alone did not distinguish the APK implementations.

The new device log shows quick sync retaining a stale Undead Unluck seed, while
manual full sync later reconciles the tracker snapshots in 2.1s. An earlier full
sync remains at Fetching Trakt from 08:13:45 until the process is restarted around
08:16:26. Native Trakt logs cancelled snapshot fetches and increasing backoff;
the capture does not establish the exact network/add-on failure behind them.

Quick sync now restores saved progress/local playback first, then runs the same
coherent progress/seed/history selection against the native tracker snapshots.
It skips the explicit provider refresh call, so it does not force a bulk remote
refresh or bypass native schedules/backoff. Provider-flow changes schedule a
coalesced reconciliation on Home; updates during a merge are reconciled after it
finishes. Trakt's refresh method signals background work, so observing its later
publication matters even after a manual sync. This is snapshot reconciliation,
not a new remote delta API. Native library providers remain untouched.

Each provider's refresh, hydration and history reads share a 45-second deadline.
Failure retains the previously published snapshot and releases the merge UI.
Cancel sync is available in the settings section/dialog and the Home progress
banner's close control. It cancels the merge, invalidates work before its Job is
assigned, clears queued manual requests and suppresses automatic reconciliation
for the cancelled profile until the user starts another sync. It does not stop
independent native tracker polling. Closing the settings dialog alone does not
cancel. A completed/cancelled dialog offers Sync now for retry.

The Quick startup sync info action opens an explanation. Its supplied callback
was previously also masked out by the native row's default-argument bit 32.

Latest original: ../OriginalApps/NuvioTV-1.1.0-beta8.apk, com.nuvio.tv,
1.1.0-beta.8/code1071, SHA256
7aeae6f64e9128be2c7545c50061376839e20a88d47722ac220ba40be7c182f8.
Original DEX evidence under ../.inspect-nuvio-beta8:
sync-cancel-banner-contracts.txt and sync-info-row-contracts.txt. The existing
Lmb/a;->b(... )V fingerprint is
50512aec1d322f8645869c4d99221fdccfb518d08abfdd302b73198a0d49ef9b,
74 registers. Native d:Z (isDownloading) is cached in v34; instruction 728's
IF_NEZ v34 guards only the close control. The sync-only hook allows it while
preserving the native progress drawing and ordinary updater behavior. Instruction
731's IF_EQZ v66 selects the ordinary close control for sync, avoiding the native
timed auto-dismiss control and its callback. Existing
provider/readiness/continuation contracts are reused unchanged.

Device checks still required: Undead Unluck updates without pressing Sync now;
late Trakt updates reconcile on Home; cancel via remote focus in Home and settings;
retry after cancellation; info dialog focus; service rate limiting/backoff.

Validation passed with Java 21/platform 36 via
`powershell -NoProfile -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioSyncBannerRuntime :patches:verifyNuvioBeta8 :patches:verifyNuvioRemainingSyncRuntime :patches:verifyNuvioBeta8Bundle --offline`.
Checks cover deadlines, cancellation, late completions, retry, native banner
callbacks/close guards, unchanged native updater precedence, real DEX mutation
and reload, standalone/combined application and native library isolation. There
are no new cross-DEX findings beyond the original 36 optional-library findings.
CLI 1.19.0 rebuilt and signed all 16 selected patches from the original beta.8 APK.
`build-local.ps1 :patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-quick-reconcile-cancel-signed.apk -PnuvioRequireStability=true --offline`
also passed. Android build-tools 36 `apksigner verify --verbose --print-certs`
and `zipalign -c -P 16 4` passed. No installation/device test, commit or push ran.
Deliveries: `E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-quick-reconcile-cancel-signed.apk`
and `E:/Morphe/Apps/NuvioTV/patches-0.13.0-quick-reconcile-cancel.mpp`.

## Native library isolation correction (beta.8, 2026-10-23)

The latest log shows the merge-added library call at 18:29:26 receiving HTTP 429
at 18:30:05 and increasing quick-sync time to 67.5s. That added call was the wrong
fix and is removed, together with its runtime helper and feature-specific tests.
Quick sync is back to three progress-only steps. Native Nuvio retains library
ownership through Tracking settings; the remaining-count/cache-publication fixes
are retained. This does not guarantee native library requests cannot be rate limited.

Packaged beta.8 verification now compares method fingerprints and field layouts
of nine native library classes against the original APK in every standalone and
combined patch selection: repository ba.e1, interface/registry q9.i/q9.j, provider
adapters ba.lc/ca.h3/u9.g6, and backing repositories ba.q8/ca.f7/u9.b3. This guards
against future changes to library behavior through the merge. Combined selection
allows only the already existing, independent launcher-channels constructor
observation hook; all remaining library method bodies and fields must match.

Build/runtime checks passed via `build-local.ps1`: `:patches:buildAndroid`,
`:patches:verifyNuvioProviderRefreshRuntime`, `:patches:verifyNuvioRemainingSyncRuntime`
and, after adjusting the guard for that existing launcher hook,
`:patches:verifyNuvioBeta8Bundle --offline`. The rebuilt APK passed
`:patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-native-library-isolation-signed.apk -PnuvioRequireStability=true --offline`.
All 16 selected patches applied against original `com.nuvio.tv` beta.8/code1071;
signature/alignment passed with the existing signer and no new cross-DEX findings.
Delivery: `E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-native-library-isolation-signed.apk`
and `E:/Morphe/Apps/NuvioTV/patches-0.13.0-native-library-isolation.mpp`; source
bundle remains `patches/build/libs/patches-0.13.0.mpp`. No installation/device test ran.

## Startup resume counts (beta.8, 2026-10-23)

The device log shows Undead Unluck composed with no registered ID at 18:01:18,
then its native NextUpInfo registered at 18:02:21. First registration did not
invalidate the already displayed card. Cached resume progress now registers
remaining-count identities before Home consumes the restored cache. Late first
registration also invalidates composition and associates recently visible titles
with the arriving ID. Native NextUpInfo remains authoritative over a synthetic
resume seed. The counter retains dirty notifications arriving during an active
count pass, preventing restored membership from being dropped by coalescing.

Quick sync's membership-ready state now exposes complete cached history to the
remaining-count patch. It explicitly publishes restored history to visible-card
counts and already cached badge metadata. It does not claim full WatchedItem
models are loaded or initiate the full-library badge metadata scan.

The temporary selected-library refresh added to merge startup was removed.
Library selection, refresh scheduling, cache and errors belong to native Nuvio.
The merge must not call library providers or the library source-setting action.

The log's termination is an input-dispatch ANR, with repeated GC stalls and high
CPU; no Java fatal exception stack is available. Native MDBList library refresh
also logs HTTP 429. These fixes address concrete startup omissions and count
publication races; resolution of the ANR and remote rate limiting needs device
retesting. Do not describe the ANR as a proven fixed Java crash.

Original DEX evidence is in `.inspect-nuvio-beta8/startup-library-contracts.txt`,
`library-provider-contracts.txt`, and `library-refresh-implementations.txt` under
the workspace root. All three native library implementations actually suspend
until their backing refresh returns. Remaining runtime verification covers a
resume card displayed before registration, membership arriving later, completion
clearing the count and the existing stale-request/seed protections. Provider
verification covers the exact erased continuation ABI, awaited completion,
failure propagation and cancellation; beta.8 verifies the actual native symbols.

Verification passed through `build-local.ps1` with the existing Gradle cache:
`:patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioRemainingSyncRuntime :patches:verifyNuvioRemainingCounts :patches:verifyNuvioBeta8 :patches:verifyNuvioBeta8Bundle --offline`,
then `:patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-startup-library-counts-signed.apk -PnuvioRequireStability=true --offline`.
CLI applied all 16 selected patches and rebuilt/signed beta.8/code1071 from the
original `com.nuvio.tv` APK. Signature, ZIP alignment and rebuilt-APK checks passed;
there are no new cross-DEX findings. Delivery files are
`E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-startup-library-counts-signed.apk` and
`E:/Morphe/Apps/NuvioTV/patches-0.13.0-startup-library-counts.mpp`; source bundle
remains `patches/build/libs/patches-0.13.0.mpp`. No installation/device test ran.

## Buffered restoration; startup watermark versus remote refresh (beta.8, 2026-10-23)

The latest cached launches take 30.0/30.3s: 27.25/27.41s decoding an existing
NMC1 membership cache, about 0.5s applying local changes and 2s publishing/saving.
No remote provider refresh runs in this path. `savedAt` already persists the
local reconciliation watermark; `quickProgress` applies newer local progress,
retaining remote entries. Completed episode memberships replay since the saved
full-history timestamp so repeated quick launches cannot lose completion badges.
The menu's Sync now still performs a full provider refresh.

The proven beta.8 provider interface exposes refresh intent plus continuation,
and snapshot flows; it does not provide a uniform `since` argument to the patch.
This is a statement about the native interface, not a claim that the services'
HTTP APIs lack incremental endpoints. A remote incremental integration would need
separate provider contracts and removal/completion handling. Quick sync does not
fetch changes made on other devices.

NMC1 reader/writer now buffer decompressed/uncompressed bytes between Data streams
and GZIP. Previously small primitive reads/writes repeatedly entered the inflater/
deflater. The persisted format is unchanged: no cache migration or full sync is
needed. A desktop synthetic comparison of the previous and current production
reader (401,641-character cache, 3,173 histories, 7,501 alias entries, 10 measured
iterations after warmup) measured 37.1ms versus 19.1ms average, with identical maps
and timestamps. This desktop result does not predict the TV's actual duration.
Runtime verification also reads an independently written old-format fixture and
retains corruption/cancellation checks. Device performance remains to be measured.

Verification passed via `build-local.ps1` using the existing Gradle cache:
`:patches:buildAndroid :patches:verifyNuvioWatchedSnapshotRuntime :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8Bundle --offline`,
then `:patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-buffered-membership-signed.apk -PnuvioRequireStability=true --offline`.
All 16 selected patches rebuilt/signed successfully against original
`com.nuvio.tv` beta.8/code1071; signature and ZIP alignment passed. The APK adds
no cross-DEX findings above the original baseline. Nothing was installed or
device-tested. Delivery files: `E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-buffered-membership-signed.apk`
and `E:/Morphe/Apps/NuvioTV/patches-0.13.0-buffered-membership.mpp`; source bundle
remains `patches/build/libs/patches-0.13.0.mpp`.

## Shared-set membership cache (beta.8, 2026-10-23)

The next device log confirms cached sync totals of 88.2s, 69.1s and 76.0s.
Membership restoration alone takes 83.4s, 64.8s and 70.1s; preparation is under
120ms. Splitting the previous JSON file did not adequately solve the problem.

The new `NuvioMembershipCache` stores a string dictionary and distinct episode/
alias sets with ID-to-set references, then compresses the payload. Restoration
shares immutable sets and episode values instead of allocating a full copy per
catalog ID. The timestamp, empty sets, special episodes and ambiguous-alias marker
are preserved. Local playback updates replace map entries without mutating shared
sets. Versioned `membership_v2` preferences avoid opening the previous JSON XML
after migration. Existing JSON migrates once after Home; full history remains a
failure fallback. No provider refresh is added to quick sync.

Logs now separate store opening, decoding and migration saving, and report the
cache format, encoded size and restored map counts. Host verification exercises
six million expanded memberships backed by only 2,000 distinct episodes, asserts
exact map equality and shared-set identity, and checks malformed/truncated caches,
cancellation, empty snapshots and ambiguity. Actual TV timings still need testing.

Verification passed using `build-local.ps1` with `GRADLE_USER_HOME=C:/Users/Danny/.gradle`:
`:patches:buildAndroid :patches:verifyNuvioWatchedSnapshotRuntime :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8Bundle --offline`,
then `:patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-grouped-membership-signed.apk -PnuvioRequireStability=true --offline`.
CLI rebuilt/signed all 16 patches against original `com.nuvio.tv` beta.8/code1071;
APK signature/alignment passed with the existing signer. There are no new
cross-DEX findings above the original baseline. Nothing was installed or tested
on a device. Delivery: `E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-grouped-membership-signed.apk`
and `E:/Morphe/Apps/NuvioTV/patches-0.13.0-grouped-membership.mpp` (source bundle
`patches/build/libs/patches-0.13.0.mpp`).

## Cached sync timing and separate membership storage (beta.8, 2026-10-23)

The latest device log shows a 120.7s full sync (97.6s provider reads), followed
by cached syncs taking about 75s and 82s from Home presentation. Those cached
runs explicitly made no provider refresh requests. Exact local stage costs were
not logged, so the cache hydration contribution still needs device measurement.

Quick completion now reports total elapsed time including preparation, in both
the native banner and saved menu summary. Full completion uses the same total;
errors and deferrals also show elapsed time. Logs include preparation, membership
restore, local changes, and publication/save durations.

Full sync saves a separate per-profile membership store containing episode
membership, aliases and the full-history timestamp. Cached launches read this
store without opening the full history SharedPreferences XML or scanning its
WatchedItem section. Existing installs migrate once during cached sync; subsequent
launches use the separate store. Legacy settings migration opens full history
preferences only if there are actual legacy snapshots to migrate. Full history
remains available for fallback. Cancellation/profile checks remain in place.

This reduces avoidable disk/cache work; the actual speed improvement needs a
device run, particularly the first migration versus the subsequent cached launch.

Verification passed with `GRADLE_USER_HOME=C:/Users/Danny/.gradle` via
`powershell -NoProfile -ExecutionPolicy Bypass -File .\build-local.ps1`:

- `:patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioWatchedSnapshotRuntime :patches:verifyNuvioBeta8Bundle --offline`
- `:patches:verifyNuvioSyncBannerRuntime --offline` (earlier build in this change)
- `:patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-sync-timing-cache-signed.apk -PnuvioRequireStability=true --offline`

Original input remains `com.nuvio.tv` 1.1.0-beta.8/code1071. The CLI applied all
16 selected Nuvio patches and rebuilt/signed the APK as `com.nuvio.santodan`.
APK signature verification and ZIP alignment passed; the signer matches prior
test builds. Bundle combinations and the rebuilt APK add no cross-DEX findings
above the original optional-library baseline. `git diff --check` passed.
The APK was not installed or tested on a device. Source bundle is
`patches/build/libs/patches-0.13.0.mpp`; delivery copies are
`E:/Morphe/Apps/NuvioTV/patches-0.13.0-sync-timing-cache.mpp` and the APK above.

## Early full splash before MainActivity (beta.8, 2026-10-23)

Launcher entry now goes through a lightweight `NuvioStartupActivity` before
constructing the native Hilt-backed MainActivity. It draws the full splash layout:
the native 48dp wordmark, profile gradient or cached local background, 32dp gap,
and a 48dp animated loading indicator. This is a framework View renderer of the
native splash design, avoiding Compose and MainActivity dependencies at this stage.
MainActivity and its normal Compose splash then take over.

The initial Android launch window uses the gradient and wordmark too, replacing
the previous square app icon. Framework/Application creation still precedes any
Activity drawing; the patch does not move Android lifecycle or Hilt initialization
to an arbitrary background thread. Native startup work continues while the early
splash is visible. Main-thread native initialization can briefly pause animation.

Original beta.8 manifest/DEX evidence differs from the upstream source: six
`com.nuvio.tv.launcher.AppIcon*` entries are real Activity subclasses of
`com.nuvio.tv.MainActivity`, each with a constructor only. Their manifest entries
become aliases of the early entry, preserving names, enabled state, icons,
banners, labels and intent filters. The original MainActivity and VIEW filters
remain intact. The early target is non-exported and has no history. It forwards
the incoming intent's data, categories, extras, ClipData and URI grants to the
native class in the installed package. Single-top/clear-top handoff reuses an
existing native Activity and avoids an extra Back destination or second task.

Splash appearance uses native `startup_splash` preferences (`color_<profile>`,
`theme_<profile>`, `bg_url_<profile>`). The active profile is supplied by the existing
repository hook and remembered on the cache IO path. Background decoding runs on
a bounded worker and is limited to app-owned local cached files, sampled to a
maximum 1920px dimension. It makes no network requests; missing, remote-only,
expired or slow backgrounds fall back to the gradient until the native splash
loads them. Cache preparation has a 1.5s deadline. After the prepared splash has
drawn, handoff is posted after a renderer frame and only while resumed. Pause,
destruction and repeated callbacks cannot start a duplicate Activity.

`SantodanStartup` logs early creation, appearance preparation and frame submission
before native MainActivity starts. Measure total startup from process creation to
the native Home-presented marker: Android's Displayed/fully-drawn timings now refer
to separate Activities rather than one continuous launcher Activity.

Verification passed: `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioBeta8
:patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8Bundle`.
Tests cover manifest preservation/rejection, prepared-frame and resume gating,
duplicate/destruction handling, original native contracts, compiled resources,
packaged classes and exact inherited Android SDK method resolution. The bundle
verifier applies merge alone, merge plus side-by-side, and all runtime patches
together. All outputs have no new cross-DEX findings beyond the original's 36
optional-library findings. No installable APK was rebuilt, signed or installed;
the transition, selected background, Back/resume, icon selection and TV-launcher
task behavior still require device tests. Artifact: `patches/build/libs/patches-0.13.0.mpp`.

## Native launch logo and initialization timings (beta.8, 2026-10-23)

The merge patch includes an unnamed resource dependency that replaces the solid
native launch drawable with the same background plus the original Nuvio logo,
centered at 160dp. This is the Android launch window shown before Compose can
render the in-app splash. It requires no runtime disk reads or network requests.
The native Android 12+ splash configuration remains in place.

Original beta.8 resources prove `drawable/splash_screen_background` (0x7f08011f)
is `res/0n.xml`: a rectangle with `color/splash_background` (0x7f06005d).
`drawable/app_logo_mark` (0x7f08004f) points to the existing `res/sR.png`.
The resource transformation rejects changed or already-layered input and keeps the
original background shape. Compiled resource checks inspect the merge-only and
combined resource APKs for the native logo reference.

Logcat has paired `Startup begin` / `Startup end` messages for merge repository,
settings store/component, activity resume, stream-preload component, launcher
component, and IntroDB activity setup. They report the calling thread at entry
and elapsed milliseconds at exit. Use the timestamps alongside process creation,
activity creation, first frame and fully-drawn events to distinguish patch work
from the intervals between hooks. Method timings exclude class initialization
that happens before method entry.

Verification commands: `build-local.ps1 :patches:buildAndroid
:patches:verifyNuvioBeta8 :patches:verifyNuvioProviderRefreshRuntime
:patches:verifyNuvioBeta8Bundle :patches:verifyNuvioIntroDbRuntime
:patches:verifyNuvioStreamPreloadRuntime`.
All passed, including logo inspection in the compiled merge-only/combined resource
APKs, resource rejection tests, runtime regressions and cross-DEX checks with no
new findings beyond the original's optional-library references.
`generatePatchesList` records the new unnamed resource dependency; the Android
bundle was rebuilt after generation and its packaged checks rerun.
The artifact remains `patches/build/libs/patches-0.13.0.mpp`; the visual transition
and logo size still require a device cold-launch check. No installable APK was
rebuilt, signed or installed.

## Separate history from startup settings (beta.8, 2026-10-23)

The next device capture showed two cold launches with first-frame times of
16.896s/16.834s and fully-drawn times of 22.520s/22.312s. Lightweight cache
restoration improved from 5.165s on legacy migration to 1.776s on the next launch,
but both processes spent about 12s before activity creation completed. Thus the
remaining pre-splash delay precedes the Continue Watching restoration stage.

The merge settings and full history still shared one SharedPreferences XML file;
the first synchronous settings read can wait for Android to load all its large
snapshot strings. Full snapshots now persist in a separate history preferences
file. After Home appears, migration copies existing profile snapshots durably
before removing only their large values from the settings file. Settings, source
choices, summaries and cached records are retained. Failed copy writes never
remove the source; retries preserve any newer destination history.

The first launch after this update can still pay the old settings-file load cost.
Allow `History storage migration: complete=true` to appear before restarting; the
next cold launch uses the smaller settings file. `Merge settings first read`
reports its elapsed milliseconds so a new capture can confirm how much of the
pre-splash delay belongs to this path. Exact attribution and the speed improvement
remain device checks, rather than conclusions established by host tests.

The same build, beta.8 DEX, provider-refresh runtime and standalone/combined bundle
commands listed below passed for this change with no new cross-DEX findings.
Migration checks cover multiple profiles,
failed writes/cleanup, retry safety, newer destination data and retained settings.

## Split startup cache and defer history (beta.8, 2026-10-23)

Continue Watching restoration no longer waits for full watched history, sibling
aliases, or watched-item model construction. Progress, next-up seeds and origins
have a separate small preferences file. Existing installations migrate their
previous snapshot by streaming past history fields without constructing their JSON
trees. No cache reset is needed. The current Continue Watching entries remain
visible until a complete refresh applies additions, updates and removals.

Automatic merge waits for the owning activity's native fully-drawn reporter.
Saved full history is now restored only as a cancellable failure fallback;
successful syncs read fresh provider history directly. Manual sync runs on request,
including a queued handoff from a cancelling automatic worker. See
[the latest device-log fixes](NuvioBeta8.md) for phase budgets and verification.
The original beta.8
`Lc/j;->getFullyDrawnReporter()Lc/m;` exposes the reporter; `Lc/m;->a()V` sets
`f:Z` and invokes callbacks in `g:ArrayList` under lock `c:Object`. The listener
uses that same lock, handles an already-reported activity, and ignores an obsolete
activity's callback. Navigation, foreground, profile and stale-publication guards
continue to apply. No additional bytecode hooks were needed.

Logcat now includes `Startup CW cache loading`, `Startup CW cache ready`
(JSON-read/parse and total milliseconds, entry counts, legacy migration flag),
`Startup Home presented`, and `Deferred watched cache loading/ready` (history
counts and elapsed milliseconds). These distinguish the first legacy migration
from subsequent launches and separate cache work from rendering and remote sync.

`build-local.ps1 :patches:buildAndroid :patches:verifyNuvioBeta8
:patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta8Bundle`
passed. Host tests exercise cache publication before presentation, deferred-work
release, already-reported activities and separate activity reporters, together
with the existing cache retention/cancellation regressions. Original DEX contract
checks and standalone/combined bundle assembly passed with no new cross-DEX
findings. Bundle: `patches/build/libs/patches-0.13.0.mpp`. No installable APK was
rebuilt, signed, installed or tested on a device. Startup speed, legacy migration
and card/focus retention still require device checks on the first and subsequent
launches.

## Startup cache retention (beta.8, 2026-10-23)

The current target is original `com.nuvio.tv` `1.1.0-beta.8` (1071),
`../OriginalApps/NuvioTV-1.1.0-beta8.apk`; see [NuvioBeta8.md](NuvioBeta8.md).
The historical implementation notes below describe earlier versions.

Progress and next-up readers now await profile cache restoration on the IO
dispatcher before their first emission. Repository registration no longer marks
an empty startup snapshot as ready, and starting a sync no longer clears a native
snapshot seeded during launch. Cache loading is independent of the Home sync gate.
Subsequent syncs retain the current snapshot until a complete result is ready;
unchanged records remain equal, while additions, updates and removals are published
together. An empty completed result remains valid. Profile changes still invalidate
the previous profile's data. Restore failures retain the saved cache for diagnosis
and retain any usable in-memory startup data.

The provider-refresh host verifier covers delayed restoration without an initial
empty publication, retained entries during refresh, additions/updates/removals,
unchanged-result suppression, cancellation, and valid empty snapshots. A device
relaunch check remains necessary to confirm card visibility and focus throughout
startup and sync.

Verification passed with `build-local.ps1 :patches:buildAndroid
:patches:verifyNuvioBeta8 :patches:verifyNuvioProviderRefreshRuntime
:patches:verifyNuvioBeta8Bundle`. Standalone and combined packaged DEX checks
added no cross-DEX findings beyond the original's 36 optional-library findings.
Bundle: `patches/build/libs/patches-0.13.0.mpp`. No installable APK was rebuilt,
signed, installed, or tested on a device.

Target: original `com.nuvio.tv` `1.1.0-beta.6` (1069),
`../OriginalApps/NuvioTV-1.1.0-beta6.apk`. Input provenance is recorded in
[NuvioBeta6.md](NuvioBeta6.md).

Under Layout → Santodan-Patches → Continue Watching → Tracking progress:

- Enable merged progress and choose highest progress or most recent update.
- Choose the main service: Nuvio Sync, Trakt, Simkl, or MDBList. The previous
  pre-merge source supplies the initial main choice when available; otherwise
  Nuvio Sync is the default. This is the playback write target and failure fallback.
- Select services to merge. All supported services are selected by default;
  disconnected services are skipped. The main service is always included.
- Sync now opens a dialog with a stage progress bar, per-service record counts,
  merged/updated/removed progress counts, Continue Watching and watched-item
  counts, elapsed time, or the failed stage. Closing the dialog allows the sync
  to finish. The last completed summary is saved per profile.

Main-service and included-service choices are profile-specific. Sync combines
snapshots inside NuvioTV; it does not copy progress between remote services.

## Scheduling and playback

### Cache-first sync after Home, with the native update banner (beta.8, 2026-10-23)

The previous startup projection experiment is superseded. The latest device log
showed `Startup CW cache ready` taking 46,658 ms and 51,173 ms, with fully drawn
Home at approximately 57 seconds. Loading watched membership on the launch path
was the source of that added delay. Do not restore full history or membership
projections before Home presentation.

The launch path now reads only progress, next-up seeds and origins from the new
`santodan_nuvio_merged_progress_startup_light` preferences file. Full watched
history and aliases stay in the separate history cache. The previous oversized
startup file is never opened before Home; its CW-only contents can be migrated
by the post-Home worker. On the first update, cached CW cards may populate after
Home is already visible. Subsequent launches use the migrated lightweight file.

Once the owning Activity's native FullyDrawnReporter has presented Home and the
real route is Home, one sync starts per active profile/session. **Quick startup
sync** is enabled by default in Tracking progress. With a validated saved snapshot
it restores episode membership/aliases after Home, skips all provider refreshes
and full WatchedItem decoding, and applies newer local playback changes. Cached
remote entries are retained when the local list is empty; local completion removes
only its matching resume entry. The lightweight cache is updated without rewriting
the full history. Changes from other devices/services require **Sync now**, which
always performs a full USER_INITIATED refresh. Disabling Quick startup sync also
makes startup perform that full refresh. This is an explicit freshness/speed tradeoff.

An old cache without the validated-provider marker, a configuration change, or no
saved cache requires one full refresh before quick startup can be used. The previous
log accepted Trakt's unready empty progress, so its saved snapshot cannot be treated
as authoritative. Full refresh now triggers provider projections, waits for native
p() readiness, and re-reads progress/history before publishing. A temporary empty
value cannot replace CW; a genuinely ready empty snapshot still applies removals.
Incomplete/failed/cancelled refreshes retain the prior snapshot. One startup request
runs per active profile, not on every Home return or provider emission. Interrupted
requests retry on Home; failed/completed requests do not loop. The full-refresh
budget remains 180 seconds, with preparation budgeted separately.

The sync can continue while browsing details/settings, but entering the player,
backgrounding, or changing profile cancels it and rejects stale publication.
There is no periodic timer. Native provider work already launched in its own
scope may finish independently; its completion cannot publish through a cancelled
merge. Playback entry also invalidates the worker's playback revision, including
rapid player entry/exit.

The custom Android-view banner has been removed. Sync status is fed through the
actual native updater host `fb.uj.i` and native banner `mb.a.b`, inside the app's
existing Compose tree/theme. Native drawing, theme colors, 180 ms
`updateBannerProgress` animation, layout and enter/exit animations are reused.
Synthetic updater state is scoped to sync; it never enters the native updater
repository. Download/install callbacks are inert for sync, the native installed-
feedback branch suppresses download actions, and only scoped status text changes.
Real update/permission/feedback state takes precedence and retains all callbacks.
Status expires after six seconds on completion or fifteen on error; the merge
menu retains the result. Progress counts sync stages, not network bytes.

Original beta.8 evidence is in `native-sync-progress-contracts.txt`,
`native-banner-host-contracts.txt`, `native-banner-mount-contracts.txt`, and
`provider-incremental-contracts.txt` under `E:/Morphe/.inspect-nuvio-beta8/`.
Root `q8.l.invoke` fingerprint is
`b9bcb00e932f362e8bd4d632b937371b65ebae2e4f019c0064c69f9db0ebaf86`:
its sole native host call uses v2..v11 (ten arguments). Native banner
`mb.a.b` fingerprint is
`50512aec1d322f8645869c4d99221fdccfb518d08abfdd302b73198a0d49ef9b`:
74 registers, parameters v64..v73, four grouped text lookups, one formatted
progress lookup and one return. Hooks preserve registers/drawing code and scope
text/action adaptation on every invocation, including native recomposition.
`lb.a` has seven constructor parameters; `kb.k0` has sixteen. Native host/drawing
references and these constructors are proven against the original DEX.

Host checks cover cache preservation, newer local progress, ready versus unready
empty providers, request/lifecycle gates, and native-hook changed/missing/ambiguous/
already-patched rejection. Standalone/combined bundles write/reload the new hooks,
check the exact call counts and resolve extension signatures. Actual banner
appearance/focus, sync duration, and playback still require device tests.

Quick-cache eligibility is published only after its matching full history is
durably committed. Interrupted/failed saves leave the CW cache usable but
unvalidated; the next sync repairs it rather than trusting partial history. Cache
save failures are reported through sync status. The local overlay replays
completions since the full-history timestamp on every launch, so a completion
survives multiple quick-sync restarts without a remote refresh.

Validation uses `:patches:buildAndroid`, `:patches:verifyNuvioSyncBannerRuntime`,
`:patches:verifyNuvioProviderRefreshRuntime`, `:patches:verifyNuvioWatchedSnapshotRuntime`,
`:patches:verifyNuvioBeta8`, and `:patches:verifyNuvioBeta8Bundle`. The production
banner bridge is executed against native-ABI fixtures with Android scheduling
stubbed; real update/permission priority, native preference flags, callback/content
preservation, scoped labels/grouping, errors and hiding are covered. These tests
do not establish on-device rendering or performance.

The checks above passed, including a repeat after the cache durability change.
The final quick-to-full button handoff was rebuilt and the runtime checks passed.
The CLI applied all 16 patches to the original beta.8 input, rebuilt and signed
`E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-native-banner-quick-sync-signed.apk`.
`:patches:verifyNuvioPlaybackApk -PnuvioRequireStability=true` passed against this
artifact with no additional cross-DEX findings beyond the original 36 optional
library findings. Signature and ZIP alignment passed; package is
`com.nuvio.santodan`, beta.8/code 1071, and all 108 native libraries are unchanged.
Signer SHA-256 matches the existing app:
`c6f46fdf215e35e421ce61153b7fa671a485c3e266ccf03eabfe1d59c900a0d5`.
APK SHA-256 is `407836e46297f21d593b0653eaa138fdb6f9d043aa17b4eaf1455d6840811052`.
Evidence is under `E:/Morphe/.inspect-nuvio-beta8/native-banner-quick-sync-*`;
`native-banner-patched-tail.txt` confirms scope cleanup before the nullable
restart-scope branch. The build has not been installed or device-tested. The
previous unvalidated cache needs one guarded full refresh before quick startup
is eligible. No release version bump, commit, or push was made.

With merging enabled, native scrobbling is filtered to the main connected remote
service. Choosing Nuvio Sync suppresses remote-service scrobbles. Choosing a remote
service suppresses Nuvio Sync remote progress writes through both native
single-progress save routes. Local progress and completed-item persistence remain
available for resuming playback. Native authentication, scrobble failures, seeks,
and completion handling are preserved. Disabling merging restores native routing.

The previous merged snapshot remains visible during a sync and on failure. If no
usable snapshot exists, the patch attempts a bounded main-service snapshot fallback.
Failure does not publish a partially collected combination of services. Native
provider APIs can serve cached data; record counts describe the snapshots read,
not a guarantee that a remote server accepted a new write.

## Proven beta.6 hooks

- `Lp8/m;->invoke(Object,Object,Object)Object`: the unique
  `Lio/sentry/o;->V([Ll5/b1;Lg1/p;)Ll5/n0;` result is the remembered root
  NavController. The bridge observes inherited `Ll5/y;->F:SharedFlow`; entries
  have `Ll5/m;->e:Ll5/g0;` and destination route `Ll5/g0;->o:String`.
- `MainActivity.onResume/onPause/onDestroy`: zero-argument instance lifecycle
  methods with verified native super calls. They own foreground gating, dialog
  activity ownership, and navigation observation cleanup.
- `Lo9/h0;->a()ArrayList`: unique connected-scrobbler result, containing
  `Lo9/e0;->a()Lo9/s0;`. Each scrobbler exposes `Lo9/s0;->a()Lo9/g0;` identity.
- `Lz9/zc;->C` and `s`, both `(I,WatchProgress,ContinuationImpl,Z)Object`:
  save locally through `local/cc.C` and queue remote mutations through `k9/d6.o`.
  The last Boolean parameter is filtered before native parameter moves.
- Both returns of the selected-provider mapper `Lz9/sb;->invokeSuspend` install
  the merged proxy, including Nuvio Sync and disconnected-main null-provider paths.
- Native settings section/button contracts are `Lxa/bd;->a` (11 parameters)
  and `d` (6 parameters). Tracking popups use Nuvio's Compose dialogs as described
  below, inheriting the active app theme.

## Verification and device checks

Run `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioBeta6
:patches:verifyNuvioBeta6Bundle :patches:verifyNuvioProviderRefreshRuntime`.
The native verifier exercises the production navigation/write policy and checks
original DEX contracts, invalid/ambiguous/missing/already-patched rejection, and
DEX write/reload. The bundle verifier applies merged progress alone and all nine
runtime patches together, checking merged hooks and native coroutine resolution.

Device checks remain: TV remote focus in the submenu/dialogs, connected and
disconnected main choices, manual progress/error display, profile changes,
Home → player → source/episode switching → detail/stream → Home, external-player
backgrounding, and remote-service receipts proving only the main service receives
playback writes. Host verification does not establish these device behaviors.

The build and all three verification tasks above passed for this change.
Standalone merge and combined bundles
have the same 36 optional-library hierarchy findings as the original, with no
new findings. The bundle is `../patches/build/libs/patches-0.10.1.mpp`.
No installable APK was assembled, signed, installed, or device-tested for this change.

## Playback progress-read regression (2026-10-16)

MDBList as main service with Nuvio Sync excluded is a supported configuration.
Excluding Nuvio Sync does not require enabling stream preloading.

The aggregate's old progress/next-up reader treated an empty completed snapshot
as missing data. It raced a collection of the main provider's native flow against
the snapshot-ready signal. Original beta.6 MDBList `Ls9/c6;` wraps its progress
and seed flows in `A(Flow)Flow`, which installs an `onStart` loader. Merely
collecting such a flow can start provider loading/refreshing. Racing against an
already-ready signal does not prevent those side effects, and `first()` must
wait for cancellation of its competing collection. This is unsafe on the saved
progress read that precedes starting a new episode.

`NuvioProviderRefresh.retainedSnapshot` now emits the cached merged flow directly
when its snapshot is ready (including an empty list) or native startup fallback
is disallowed by the Home gate. The unready Home startup fallback remains intact.
The production reader is shared with the host regression verifier. The new test
failed on the prior behavior because playback collected a refresh-on-start flow;
it covers empty ready/unready playback reads, completed empty Home reads,
subsequent snapshot publication, and unready Home fallback.

The supplied `logcat_all_allPreloadDisabled.txt` capture has expired application
events and no retained merge exception proving the exact frozen-frame cause.
The merge-disabled capture also contains a recoverable ExoPlayer error, so that
error alone cannot establish the merge regression's cause. The fix addresses a
reproduced invalid read path; the reported episode transition still needs a
device retest with the same MDBList/excluded-Nuvio-Sync settings.

Verification passed with `build-local.ps1 :patches:buildAndroid
:patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioBeta6
:patches:verifyNuvioBeta6Bundle`. The regression fails with the prior reader and
passes with the fix. Standalone and combined bundle checks add no cross-DEX
hierarchy findings to the original's 36 optional-library references. The current
bundle is `../patches/build/libs/patches-0.11.0.mpp`; no version was bumped for this
fix. No installable APK was assembled, signed, installed, or device-tested.

## Native tracking dialogs (2026-10-16)

Main-service selection uses the same native single-choice picker as the date-label
settings. Service inclusion uses Nuvio's scrolling multi-choice picker with its
Clear/Save actions. The mandatory main service is named in the subtitle and
excluded from the optional choices; saving or clearing always preserves it.
Back/dismiss discards unsaved service choices. Dialogs close when navigating away
or switching profiles. Closing the sync dialog allows the sync to finish.

Sync status and the disabled-feature message use NuvioDialog's themed surface,
border, corners, typography and native Close button. The progress bar uses the
current app theme's secondary/surface-variant colors, rounded shape and native
layout primitives; it does not use Android's platform ProgressBar. Rendering reads
the active theme through the Composer and updates the dialog's sync status through
the existing Compose revision state.

Additional original beta.6 contracts:

- `Lxa/ub;->j` (11 parameters), `g` (12 parameters), and `Lxa/cc;`'s six-parameter
  constructor supply the native single/multi-choice pickers and option models.
  Width and list height are supplied explicitly because R8 removes some defaults.
- `Lfa/j3;->z` (19 parameters) is the original NuvioDialog. Its defaults are taken
  from the original native picker call: `16336`, explicit width, and second
  changed flags `24576`. Colors, border, radius and spacing remain native defaults.
- `Lxa/ub;->e` (5 parameters) and `d` (7 parameters) render the native dialog action
  row and button. `Lxa/bd;->b` (6 parameters) supplies wrapping SettingsNote text.
- Theme local `Lab/z0;->a` supplies `Lab/e;`: `h:J` is Secondary (from palette
  `Lab/u0;->a`), and `e:J` is SurfaceVariant. Progress uses the original horizontal
  fill `layout/b.e`, height `layout/b.g`, shape `Ll0/g;->b`, background `Ly/l;->g`,
  and Box primitives `Le0/b;->a` / `Le0/q;->a`.

Run `:patches:verifyNuvioTrackingDialogs` alongside the build, beta.6 native/bundle
checks and provider-refresh regression task. The renderer verifier exercises the
production Java helper against host fixtures: picker selection and dismissal,
multi-choice Save/Clear protection of the main service, dialog/button callbacks,
visible dimensions, progress fractions, and live theme changes. Original DEX
verification checks the actual native contracts. TV focus, clipping on smaller
screens, popup appearance and live sync progress still require device testing.

The final `build-local.ps1 :patches:buildAndroid :patches:verifyNuvioTrackingDialogs
:patches:verifyNuvioBeta6 :patches:verifyNuvioProviderRefreshRuntime
:patches:verifyNuvioBeta6Bundle` run passed. Standalone and combined outputs add no
cross-DEX findings. The updated `patches-0.11.0.mpp` contains the playback-read fix, native-dialog
changes, and sync-bar recomposition fix described below. No APK was assembled, signed, installed or
device-tested.

## Sync bar recomposition regression (2026-10-16)

Original beta.6 `Le0/b;->a` remembers its BoxWithConstraints content using only
the track modifier; R8 treats the content argument as static. The full-width
track stays equal across stages, so its remembered fill can retain the initial
fraction while the stage label advances. Scope this native layout in a replaceable
Composer group keyed by the fraction and accent color, and always close the group.
The track remains full width. The host fixture reproduces native content retention
and checks every stage from 1/5 through 5/5 with unchanged colors, repeated completion,
zero progress, and theme changes. Device confirmation of the rendered bar remains required.

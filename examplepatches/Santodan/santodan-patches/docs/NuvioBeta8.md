# NuvioTV 1.1.0-beta.8

All sixteen public NuvioTV patches target `com.nuvio.tv` version `1.1.0-beta.8`,
version code `1071`. No older-version mappings or dispatch branches were added.
The historical beta.7 fixtures remain on disk.

The independent startup exception guard is documented in
[NuvioPlayerStability.md](NuvioPlayerStability.md).

## Current validation status (2026-10-23)

The user reports that the native-library-isolation build is working almost
perfectly. Preserve its cached startup behavior and remaining-count fixes.
Library contents and refresh scheduling remain owned by native Tracking settings;
the temporary merge-triggered library refresh has been removed. Remote incremental
API work is deferred, and frame drops/rate limits are not claimed to be eliminated.

Final pre-commit verification passed:
`build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest --offline`.
This runs original-DEX, runtime and standalone/combined packaged-bundle checks for
the latest target. The delivered signed APK also passed signature, alignment and
cross-DEX verification described in [NuvioMergedProgress.md](NuvioMergedProgress.md).
No device installation was performed by the agent. Version remains 0.13.0 until
the normal release process; these changes are committed with `[skip ci]`.

The optional [GitHub APK updates patch](NuvioApkUpdates.md) uses the native
updater with `Santodan/santodan-patches` release assets. Set `releaseVersion`
for each APK build. Its focused original-APK verifier and standalone/combined
bundle checks passed; a final all-fifteen-patch unsigned APK was rebuilt and
verified. Earlier validation records below describe their original selections.

Native symbols now come from a shared generated contract, with structural
insertion anchors and direct runtime accessors. See [maintenance workflow](NuvioMaintenance.md)
for the read-only update report and the `verifyNuvioLatest` verification command.

Original: `../OriginalApps/NuvioTV-1.1.0-beta8.apk`.
SHA-256: `7aeae6f64e9128be2c7545c50061376839e20a88d47722ac220ba40be7c182f8`.
The package and version were read with Android SDK aapt. All six original DEX
files were extracted to `../.inspect-nuvio-beta8/`; normalized comparisons,
method candidates, instruction/register dumps and verification logs are there.

## Proven native contracts

| Contract | Beta.8 original DEX |
| --- | --- |
| Progress repository | `Lba/re;`, 14-parameter constructor, registry `k:Lq9/a0;`, profile `j:Lg9/f;` |
| Local progress writes | `Lba/re;->E` and `s`, `(int,WatchProgress,ContinuationImpl,boolean):Object` |
| Provider selection | `Lba/ad;->invokeSuspend`; hook only its final provider return, preserving the first watch-party return |
| Hilt providers | `Lq8/e;->B:Lac/c;` supplies profile, `e3` supplies `Lba/a5;`, `R3` supplies `Lq9/a1;`; proven through `Lq8/f;->get()` |
| Stream search | `Lba/a5;->l(String,String,Integer,Integer,boolean):Flow`; pause field `l:MutableStateFlow` |
| Detail resolver | static `Lwa/p0;->D(Meta,NextToWatch,List):Video` |
| Player/controller | `Lab/qm;` (53 constructor parameters), controller `Y:Lab/mc;`, request `Lab/mc;->T:String` |
| Player state accessor | `Lab/qm;->e()StateFlow` reads `Y` then controller `F0`; `f()V` cancels the controls timer and changes UI state |
| Player state | `Lab/nm;`: current season `A0:Integer`, episode `B0:Integer`, video `C0:String`, next `v1:Lab/s4;`, error `j1:String` |
| Next-episode routes | `Lab/fh;->E(Lab/mc;Video;Z)V`, three callers exclusively `Lab/xg;->invokeSuspend`; threshold `x(Lab/mc;)V` reads `r2:Z`, has 13 registers |
| Home/library | `Lxa/s3;`, helper `Lxa/h5;`, library `Lba/e1;`; item lambdas `Lab/nt;`, `Lma/x;`, `Lma/l0;` |
| Poster image | `Lg0/t;->b`, 15 parameters; Composer at invoke-range start + 11 |
| Date cards | library `Lma/u1;` (36 registers), collection `Lma/k0;` (63 registers) |
| Layout menu | `Lab/tr;->invoke` constructs `Lfb/z6;`; native row anchor `Lg0/j;->q` |
| Shared settings | rows `Lfb/nd;`, section `Lfb/ve;`, picker `Lfb/wd;`, style controls `Lfb/mc;` |
| Compose | state factory `Lh1/h;->t(Object)Lh1/r1;`, Composer `Lh1/k0;`, empty remembered-slot sentinel `Lh1/m;->a`; focus initializer `Lg/e;->g(Lh1/k0;)Lc2/z;` |
| Playback customization | main `Lab/cj;->invoke(Object,Object)` has 59 registers; More `Lab/ij;->invoke(Object,Object,Object)` has 58; More constructor adds remembered state, 13 parameters plus receiver |
| Native controls | `Lab/pl;->c` renders standard controls, `M` renders report; nine main controls and five More controls |
| Current stream | `Lab/bp;->h(Stream,FocusRequester,ZZZZ,...):void`, 39 registers; structural label hook after the remembered-title cast; title and session-flag registers derived from DEX |

Named PlayerUiState `toString()` labels prove the episode/video/error field shifts.
Runtime provider identities are checked through the original provider's returned
cast, rather than the presence of a field with a generic provider type.

Beta.8 introduces Chapters in the main row and moves player-engine selection to
More. The customization patch collects Chapters independently, retains native
availability/callbacks, and defaults engine selection to More. Existing saved
button preferences retain their selected IDs and order.

## Verification

Run from the repository with Java 21 and Android SDK platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioBeta8 :patches:verifyNuvioBeta8Launcher :patches:verifyNuvioBeta8Player
.\build-local.ps1 :patches:verifyNuvioCurrentStream :patches:verifyNuvioPreferredAddon :patches:verifyNuvioPlaybackButtons :patches:verifyNuvioIntroDb
.\build-local.ps1 :patches:verifyNuvioBeta8DateStyleRuntime :patches:verifyNuvioBeta8SettingsMenuRuntime :patches:verifyNuvioBeta8TrackingDialogs
.\build-local.ps1 :patches:verifyNuvioCurrentStreamRuntime :patches:verifyNuvioPreferredAddonRuntime :patches:verifyNuvioPlaybackButtonsRuntime :patches:verifyNuvioIntroDbRuntime
.\build-local.ps1 :patches:verifyNuvioStreamPreloadRuntime :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioSettingsStoreRuntime
.\build-local.ps1 :patches:verifyNuvioBeta8Bundle
```

Run Gradle invocations sequentially: a concurrent resource rebuild can remove
extension resources while a packaged-bundle verifier is using them on Windows.
Verifiers check missing/changed/ambiguous/duplicate rejection, original input
mutation scope, both IntroDB/customization patch orders, and DEX write/reload.
Host runtime fixtures cover disabled behavior, settings callbacks/persistence,
remembered focus slots, errors, cancellation, profile isolation and playback delay.
Device checks remain for remote focus/navigation, playback, profile changes,
opt-in features, and Android TV channel publication. No device installation is
part of this update.

## Completed validation and artifacts

`buildAndroid` and `generatePatchesList` succeeded. The beta.8 DEX, launcher,
player, settings/date-style, tracking dialogs, current-stream, preferred-add-on,
playback customization, IntroDB, provider refresh and preload verifiers passed.
The lazy settings-store fixture was updated to the proven `R3` provider and
passed separately after the main verification run. The preload check includes
the production 30-second playback delay. Playback tests also exercise Chapters
in the main row and engine selection in More, with native availability retained.

`verifyNuvioBeta8Bundle` passed all six standalone selections and all thirteen
behavior patches together. Cross-DEX verification found the same 36 optional
library issues in the original and every patched selection, with no new finding.

The Morphe CLI rebuilt the original APK with all fourteen patches, including
side-by-side installation, with no failed patches. The resulting APK is
`com.nuvio.santodan`, `1.1.0-beta.8` / `1071`. `verifyNuvioPlaybackApk` passed
with all 17 native playback hooks, resolved extension signatures and unchanged
cross-DEX findings. Alignment passed. All 108 native libraries are byte-identical
to the original. Owned permissions, provider authorities and launcher labels
were checked, including `com.nuvio.santodan.santodan.launcher.artwork`.
`apksigner verify` confirms the expected unsigned output (missing signature
manifest); the CLI was explicitly run with `--unsigned`.

- Bundle: `patches/build/libs/patches-0.12.0.mpp`.
- Unsigned APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-menu-fix-unsigned.apk`.
- CLI report: `../.inspect-nuvio-beta8/rebuild-result.json`.
- Verification logs: `../.inspect-nuvio-beta8/bundle-final.log`,
  `final-verification.log`, and `settings-store-final.log`.

The APK was rebuilt, but was not signed, installed, or tested on a device.

```powershell
.\build-local.ps1 :patches:verifyNuvioPlaybackApk '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-menu-fix-unsigned.apk'
```

## Device log: missing menu

`logs_patch.log` exposed an obsolete `h1.h.s(Object)` reflection call in the
shared menu. Beta.8 defines `t(Object):h1.r1`; `s(long):h1.p1` is incompatible.
All affected menu and badge state creators now use the shared
`STATE_FACTORY_METHOD` contract, including current-stream, preferred-add-on,
date appearance, remaining episodes, airing, finale and movie release controls. Their host fixtures use the actual beta.8
names, including the incompatible `s(long)` overload.

The corrected `patches-0.12.0.mpp` passed `:patches:buildAndroid` and
`:patches:verifyNuvioLatest`. The CLI applied all 14 patches without failures
and rebuilt `../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-menu-fix-unsigned.apk`.
The output passes APK DEX verification and alignment. Logs are in
`../.inspect-nuvio-beta8/menu-fix-latest.log`, `menu-fix-apk-verification.log`
and `menu-fix-result.json`. Device confirmation remains pending.

## Device log: playback stutter

The October 23 `logs_patch.log` shows long player UI frames, allocation-blocked
threads, repeated garbage collection and audio underruns, including an underrun
with roughly 23 seconds of video buffered. These establish playback stalls but
do not attribute all allocations to a particular patch.

The next-episode observer incorrectly invoked `qm.f()V` as a state getter. That
action cancels the native controls timer and updates player UI state, then returns
null to reflection, causing the logged `StateFlow` cast failure. The runtime now
uses `qm.e()StateFlow`; the active generated contract names the getter, and patch
application validates its signature and original body before installing the hook.
The runtime fixture includes the real void-action trap instead of modeling `f()`
as a getter.

Playback customization and IntroDB now cache resolved native methods by class,
name and parameter count. Rendering controls previously scanned and allocated a
complete declared-method array on every lookup, including Composer group calls
and native button rendering. The cache retains reflection metadata only, preserves
missing/ambiguous-method rejection, and avoids retaining player or Composer
instances. Host checks exercise repeated lookup reuse and the existing native
rendering, focus, failure and lifecycle behaviors. On-device startup and
pause/resume playback still need confirmation; these changes do not establish
that every source of stutter has been eliminated.

Verification passed using `build-local.ps1` with these tasks (and `--offline`):

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyNuvioBeta8 :patches:verifyNuvioStreamPreloadRuntime :patches:verifyNuvioPlaybackButtonsRuntime :patches:verifyNuvioIntroDbRuntime --offline
.\build-local.ps1 :patches:verifyNuvioBeta8Bundle --offline
.\build-local.ps1 :patches:verifyNuvioPlaybackApk '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-playback-fix-unsigned.apk' --offline
```

The rebuilt-APK verifier initially reported inherited Android `View`/`Activity`
methods as missing extension methods. It now walks the actual superclass chain
and checks exact framework signatures against SDK platform 36, replacing its
single provider-specific exception. The APK then passed all 17 playback hooks,
extension-signature resolution and cross-DEX checks, with the same 36 original
optional-library findings. Standalone and combined bundle selections passed.

Bundle: `patches/build/libs/patches-0.13.0.mpp`. The Morphe Desktop 1.19.0 CLI
rebuilt all fifteen patches into
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-playback-fix-unsigned.apk` with no failed
patches. Its identity is `com.nuvio.santodan`, beta.8 / 1071; alignment passed,
all 108 native libraries match the original, and `apksigner verify` confirms the
expected unsigned state. It was not signed, installed, or tested on a device.
Build, bundle, APK verification and CLI logs use the `playback-stutter-` prefix
under `../.inspect-nuvio-beta8/`.

## Follow-up: merge history restoration during playback

The updated device log records 480 and 319 skipped UI frames while the player
opens, overlapping a 56-second watched-cache restore (3,178 shows / 10,321 items).
These UI counts are separate from the player's video-drop counter. The preload
observer now starts correctly, but the previous fixes did not resolve the stalls.

The merge worker previously restored history before registering `mergeJob`, so
navigation could not cancel that work. The job now covers preparation, cache
restore, provider reads, projection and persistence, with cooperative checkpoints
in CPU work. Native suspend getters use cancellable completions. Automatic work
waits a cancellable 1.5 seconds before starting; manual sync keeps its immediate
start. Navigation/profile revisions prevent stale work from publishing, including
in the main-tracker fallback. Interrupted work retains the cached snapshot and
can restart on Home.

`NuvioWatchedSnapshot` streams the saved history through Android `JsonReader`
directly into final episode/alias/model collections instead of building a complete
`JSONObject`/`JSONArray` tree first. Cancellation is checked while decoding and
while skipping legacy sections, including during input-buffer refills. Watched
history publication is serialized with navigation on Main and happens only after
the whole decode succeeds. Storage format, saved history, provider selection and
episode numbering are preserved.

Runtime checks cover a 10,321-item fixture, nulls/long timestamps, duplicate
episodes/aliases, malformed input, cancellation while skipping/decoding,
navigation to streams/player, backgrounding, profile changes, Job cancellation,
and retry on Home. Queued Main publication is also checked after worker cancellation, and snapshot
comparison uses indexed keys instead of repeatedly scanning the published list.
The JVM parser fixture uses Gson behind Android's reader API;
actual Android reader signatures and merged classes are checked by the bundle.
The parser verifier is included in `verifyNuvioLatest`.

Passed:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioWatchedSnapshotRuntime :patches:verifyNuvioWatchedHistory :patches:verifyNuvioBeta8Bundle --offline
```

All standalone/combined bundle selections passed with no new cross-DEX findings.
The updated bundle remains `patches/build/libs/patches-0.13.0.mpp`; no release
version was bumped. Device playback confirmation is still required.

The final all-fifteen-patch APK is
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-merge-playback-fix-unsigned.apk`.
The CLI reported zero failed patches. The final APK passed:

```powershell
.\build-local.ps1 :patches:verifyNuvioPlaybackApk '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-merge-playback-fix-unsigned.apk' --offline
```

All 17 playback hooks and extension signatures resolve, with no new cross-DEX
findings. Alignment passed; all 108 native libraries match the original. Manifest
identity remains `com.nuvio.santodan`, beta.8 / 1071. Signature verification reports
the expected missing signature for the deliberately unsigned output. SHA-256:
`1a04a83bdf30282d9b10dff8e5aa39e740b5c737d0c14d7a1cb331359f1d5b80`.
Logs use `../.inspect-nuvio-beta8/merge-playback-*.log`. The APK was rebuilt, but
was not signed, installed, or tested on a device.

## Follow-up: first sync timeout and stale Continue Watching

The next device log (`12:50`–`12:58`) confirms cache restoration cancels on
navigation. Startup restored 7 progress entries / 292 seeds; a successful manual
sync later published 6 / 294. The user identified Tower of God as an unwanted card
that disappeared after syncing, consistent with retaining an older startup
snapshot until fresh data is successfully published. No title-specific filter
or saved-history deletion was introduced.

The first completed cache restore took about 19 seconds, then the original
combined 90-second budget expired during MDBList refresh. Retries read all three
providers successfully. Cache preparation now has a separate 60-second budget;
provider refresh has 90 seconds for automatic work and 180 seconds for an explicit
manual sync. The expensive saved watched-history restore is now a failure
fallback: successful syncs read fresh provider history without first decoding
10,321 cached watched models. Lightweight Continue Watching startup hydration
remains in place.

A manual sync requested while an automatic worker is cancelling is coalesced by
profile and starts after cleanup, rather than merely opening the progress dialog.
Preparation/cache fallback display named stages and item counts. Manual provider
refresh now passes `USER_INITIATED`; automatic work retains `AUTOMATIC`. Original
DEX confirms `q9.z.v(q9.k0,ContinuationImpl)` and the enum names/identities:
`q9.k0.c = AUTOMATIC`, `e = USER_INITIATED`, `i = INVALIDATED`.

The new tests cover queued manual requests, profile isolation, separate phase
budgets and both native refresh intents. `buildAndroid`, provider-refresh,
watched-snapshot and watched-history runtime checks, and `verifyNuvioBeta8Bundle`
passed (`merge-sync-followup-verification.log`). The bundle remains version
`0.13.0`. The remaining playback issue is not proven fixed: the log also contains
a native ExoPlayer `MediaPeriodHolder.info` null-pointer exception at `12:51:32`,
after merge cancellation at `12:51:00`. Device startup/playback and first-sync
confirmation remain necessary.

Final APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-merge-sync-fix-unsigned.apk`,
rebuilt with all fifteen patches and no patch failures. Validation commands:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyNuvioProviderRefreshRuntime :patches:verifyNuvioWatchedSnapshotRuntime :patches:verifyNuvioWatchedHistory :patches:verifyNuvioBeta8Bundle --offline
.\build-local.ps1 :patches:verifyNuvioPlaybackApk '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-merge-sync-fix-unsigned.apk' --offline
```

Both passed. The APK resolves all 17 playback hooks and extension signatures,
adds no cross-DEX findings, passes alignment, and retains all 108 original native
libraries. Package/version remain `com.nuvio.santodan`, beta.8 / 1071.
SHA-256: `c83a5b5181427be401455e68b6bce798330cc413d4e59010beaf15c6943cce0a`.
It is unsigned (signature verification reports the expected missing manifest),
was not installed, and has not been tested on a device. Logs use
`../.inspect-nuvio-beta8/merge-sync-followup-*.log`.

## Playback cooldown and startup seek guard

The next log shows the same next-episode target being preloaded at `13:33:36`,
`13:33:48` and `13:34:38`, with pauses/buffering between them. The scheduler
previously cleared `retryAt` and its target whenever playback stopped. It now
keeps successful (60-second) and failed (15-second) cooldowns for the same
profile/current episode/next target across pause and buffering, while revoking
scraper permission. Completed results are consumed even if pause arrives before
the next scheduler tick. An unfinished fetch is cancelled with a 15-second
backoff. Profile/current/next changes and disabling still invalidate the state;
the initial 30 seconds of actual playback are preserved.

The log also records a startup null-pointer exception at `13:32:32` in
`ExoPlayerImplInternal.seekToCurrentPosition`, called from
`reselectTracksInternalAndSeek`. The original beta.8 DEX proves:

- Owner: `Landroidx/media3/exoplayer/ExoPlayerImplInternal;`.
- Private instance method `seekToCurrentPosition(Z)V`: 13 registers, no try
  blocks, 25 instructions. Receiver is v11, Boolean parameter v12.
- `queue.getPlayingPeriod()` returns into v0, immediately followed by
  `iget-object v0,v0,MediaPeriodHolder.info` without a null check.
- `reselectTracksInternalAndSeek()V` first calls `reselectTracksInternal()V`,
  whose original loop already checks the playing period for null, then calls
  this seek with `false`.
- Original seek body fingerprint:
  `f51fed0d7a4e3a69e442b555c69750c12119900c61b61413513360d16b203b69`.

The new independent, disabled-by-default **NuvioTV - Fix startup track
reselection** patch inserts only `if-eqz v0` after the existing result read,
branching to the original final `return-void`. No registers, original calls,
active-period seek/discontinuity behavior, UI, or native libraries are replaced.
The guard is selectable separately from next-episode preloading; it has no
runtime toggle or extension dependency and targets only the reviewed beta.8 APK.

The new latest-target scheduler verifier covers completion arriving at pause,
repeated pause/buffering, exact cooldown expiry, interrupted searches, failed
retry, profile/next-target changes, disable/re-enable, and disposal. The DEX
verifier checks original provenance, null/non-null paths, unchanged seek body,
missing/ambiguous/modified/register/duplicate rejection, and write/reload. Bundle
verification applies the stability patch alone and in the combined selection,
and checks the original seek remains untouched when the patch is absent.

Use `:patches:verifyNuvioNextEpisodeCooldown` and
`:patches:verifyNuvioPlayerStability`; both are included in `verifyNuvioLatest`.
The historical beta.6 scheduling fixtures were left unchanged. The guard fixes
the observed exception path; improvement to startup frame drops still requires
an on-device comparison and is not established by DEX verification alone.

Validation completed with `buildAndroid`, `verifyNuvioNextEpisodeCooldown`,
`verifyNuvioPlayerStability`, `verifyNuvioStreamPreloadRuntime`,
`verifyNuvioBeta8Bundle`, and `generatePatchesList`. The CLI applied all 16
patches successfully to the original beta.8 APK. The resulting artifact is
`E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.8-player-stability-fix-unsigned.apk`.
`verifyNuvioPlaybackApk` with `-PnuvioRequireStability=true` passed against this
artifact, including the startup guard, all 17 playback-button hooks, extension
signatures, and no additional cross-DEX findings beyond the original 36 optional
library findings. ZIP alignment passed; package is `com.nuvio.santodan`, code
1071. All 108 native libraries match the original. The APK is deliberately
unsigned and has not been installed or tested on a device.

Build, bundle, CLI result, and APK verification evidence is under
`E:/Morphe/.inspect-nuvio-beta8/player-stability-*`. APK SHA-256:
`fac752515a3fa032294b6b703dea782c8be7e8044ab4875dfac0afe38a801eaf`.


The subsequent single-consumer/background cancellation-monitor experiment was
reverted after the user reported worse playback and audio stuttering. The queue
again uses its previous two consumers without the 100 ms cancellation monitor.
Keep the earlier next-episode cooldown and startup track-reselection fixes. The
`preload-yield-fix` APK is superseded; use `player-stability-fix` instead.

Restore audit: rebuilding all 16 patches from the restored bundle against the
original beta.8 APK produced the exact same ZIP entry set and uncompressed bytes
as `player-stability-fix-unsigned.apk`, including all 21 DEX files. All embedded
runtime extensions also match the preserved pre-experiment source bundle.
Comparison evidence is `.inspect-nuvio-beta8/stability-restore-comparison.json`
under the workspace root. Fixed-name copies of the APK and bundle are available
under `E:/Morphe/Apps/NuvioTV/` as
`NuvioTV-1.1.0-beta.8-player-stability-restored-unsigned.apk` and
`patches-0.13.0-player-stability-restored.mpp`. The restored APK is byte-for-byte
identical to the original player-stability artifact (SHA-256 `fac752515a3fa032294b6b703dea782c8be7e8044ab4875dfac0afe38a801eaf`).
The user's continued stuttering is unresolved; artifact equivalence does not
establish the cause or confirm what is installed on the device.

The later watched-membership startup experiment is superseded by the post-Home
sync design in `docs/NuvioMergedProgress.md`. The user's subsequent log showed
46–51 seconds spent restoring the projection before Home was fully drawn. The
current build uses a separate lightweight launch cache, migrates the old cache
after Home, and starts the same full USER_INITIATED sync as the menu button with
a top progress banner. Use `NuvioTV-1.1.0-beta.8-post-home-sync-signed.apk` for this
design; startup time and device playback still need confirmation.

The current refinement uses Nuvio's actual native updater host/banner for sync
progress, with guarded scoped labels/actions. Quick startup sync reuses a
validated history cache and applies local playback without provider refresh;
Sync now remains a full remote refresh. Full refresh waits for native provider
readiness before accepting empty lists. Old/incomplete caches require one repair
sync. See `docs/NuvioMergedProgress.md` for contracts, freshness tradeoff, tests,
and `NuvioTV-1.1.0-beta.8-native-banner-quick-sync-signed.apk` verification.

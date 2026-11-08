# NuvioTV 1.1.0-beta.10

Target: `com.nuvio.tv`, `1.1.0-beta.10`, version code `1073`.
Original: `../OriginalApps/NuvioTV-1.1.0-beta10.apk`.
SHA-256: `720f35a827c236d1a7716b0a7c89cf63950601ae8025badfdc84c79325aab018`.
Identity was read from the APK manifest with SDK aapt; all five original DEX files
were inspected. Inspection inventories, method comparisons and logs are under
`../Skills/inspection-evidence/.inspect-nuvio-beta10/`.

All sixteen public patches use `contracts/nuvio/native.properties` and exact
beta.10 compatibility. Dedicated `VerifyNuvioBeta10*` fixtures cover this target;
historical version fixtures are preserved. No release version is bumped.

## Quick startup reconciliation (2026-11-05)

Quick startup shows saved Continue Watching immediately, then awaits one native
automatic refresh per included provider after Home is presented. It publishes
fresh progress, next-up seeds and watched membership without reading or saving
all watched-item models. Catalog refresh continues independently. The old quick
path skipped the awaited refresh and could retain stale episode data until a
manual full sync. It also decoded bulk saved membership before contacting
trackers; a device capture measured 20 seconds for 1,734 shows. The current
pre-refresh phase skips that obsolete membership decode.

Background startup reconciliation allows **120 seconds per provider**; explicit
sync retains its 45-second deadline. Native automatic/user-initiated intents,
rate limits, refresh coalescing, cancellation and profile/navigation guards
remain in effect. Saved CW stays usable during refresh and is retained on
failure. Startup status messages include the active provider operation and the
actual failure instead of leaving a red banner without details or overwriting
failure with the earlier quick-cache success message.

Original beta.10 DEX shows `Lu9/m7;->v` delegates to `Lu9/l6;->k`, which dispatches
`Leb/x0;->c` through `Lq9/j0;->a`. The native gate serializes refreshes with a Mutex
and coalesces completion by profile generation/sequence. Paired device captures
show startup exhausting 45 seconds inside remote refresh, while a later full
sync completes that operation in 3.121 seconds. Queueing, hydration and network
time cannot be separated from those logs; the longer bound accommodates cold
startup work without claiming a specific underlying MDBList fault is fixed.

The user subsequently reported successful startup sync. The 10:31 device log
confirms Home fully drawn in **8.4 seconds**, MDBList refresh in about 25.2
seconds, provider reads in 31.7 seconds, and publication of **271 next-up seeds**
with watched membership for **1,734 shows**. Final status is `Startup sync
complete` in **37.8 seconds**. Catalog refresh also completes. Marriage Toxin is
already preloaded as episode 9 before reconciliation, so this capture proves
successful refresh/publication but does not itself show an episode-5-to-9
transition.

Host checks cover cached episode 5 remaining visible while refresh is pending,
episode 9 publication only after completion, cold refresh exceeding the normal
deadline, bounded failure, cancellation and retained snapshots. `buildAndroid`,
`verifyNuvioProviderRefreshRuntime`, `verifyNuvioPlaybackOverlayRuntime`, all
`verifyNuvioBeta10Bundle` selections, `verifyAndroidBundle` and Desktop 2.0.0 import
passed for the final code. The complete `verifyNuvioLatest` suite also passed
before the reporting/deadline follow-ups. Verification logs are
`quick-reconcile-cold-refresh.log` and `quick-reconcile-cold-refresh-import.log`
in the beta.10 evidence directory; earlier `quick-reconcile-*` logs retain the
intermediate investigation, including the obsolete Desktop 1.19.1 path failure.

Bundle: `patches/build/libs/patches-0.16.4.mpp` (release version unchanged).
SHA-256: `0b6c03809b7f7fc3cceda93d9bbf44c2c86b7c4a60c97a53bcd3f049bc3acf4c`.
Local verification applied packaged selections and checked assembled DEX. The
agent did not rebuild an installable APK, sign or install it; the successful TV
run is the user's test. No separate fast-startup patch was added.

## Immediate playback updates after suspended writes (2026-11-06)

The user reported that completing Marriage Toxin episode 9 left its detail
watched marker and Continue Watching stale until restart. The log confirms
93.26% playback, successful tracker stop dispatch, and a later startup refresh
advancing next-up to episode 10. Tracker acknowledgement alone does not establish
that the local overlay received the native persistence event.

Original beta.10 local progress methods `bc.C/D/A/B` resume through
`data.local.vb/wb/tb/ub`, respectively. The runtime still recognized the older
`pb/qb/nb/ob` names. Native `invokeSuspend` re-enters the public store wrapper
with null/zero placeholder arguments. If that continuation is wrapped again,
the cloned body starts a new write instead of resuming its original state, so
the successful-save overlay callback can be lost.

`NuvioLocalWriteContinuation.observe` now preserves those exact native resume
states. The original-DEX verifier checks its bindings against each method's
INSTANCE_OF instruction. The runtime fixture exercises native wrapper re-entry,
failure propagation, exactly-once notification, and four completed episodes
appearing in detail/history/next-up projections without sync or restart. Existing
native persistence, completion thresholds and remote writes remain unchanged.
No new native hook, older-version mapping or startup synchronization was added.

Evidence: `local-write-resume-evidence.md`, `local-write-resume-validation.log`
and `local-write-resume-bundle.log` in the beta.10 inspection directory. The host
and DEX regression is distinct from device confirmation; another TV playback
test is needed. No signing or installation was performed.

Validation passed: `buildAndroid`, `verifyNuvioBeta10`,
`verifyNuvioPlaybackOverlayRuntime`, `verifyNuvioProviderRefreshRuntime`, all
`verifyNuvioBeta10Bundle` selections, `verifyAndroidBundle` and Desktop 2.0.0
import. An isolated before/after harness reproduces failed resume handling for
all four old bindings and passes with the corrected bindings; its output is
`local-write-resume-repro/result.log`. The updated bundle keeps the existing
`patches/build/libs/patches-0.16.4.mpp` filename and release version.

A second user capture from the same pre-fix playback session shows episode 9
at 374,491ms near 20:50:12, successful stop reporting at 26.25%, and a subsequent
launch reporting position 210ms rather than resuming. Partial positions share
the corrected local-save bridge, so this is consistent with the same resume
state mismatch; the log alone does not prove which saved position reached the
player. The added suspended-C regression preserves a 374,491ms partial record
in both merged resumable progress and episode details without marking it
watched. `local-write-resume-position.log` records that runtime check. Device
resume/seek confirmation with the corrected bundle remains required.

## Native contracts

| Contract | Beta.10 binding |
| --- | --- |
| Progress repository / local stores | `Lba/tf;`, `data/local/bc`, `data/local/rc` |
| Stream repository / plugin request | `Lba/o5;`, `Lba/e5;`; repository `j`, video `k`, type `l`, season `m`, episode `n` |
| Native stream search | static `o5.l(o5,String,String,Integer,Integer,boolean,String,boolean,boolean,int):Flow` |
| Detail resolver | static `Lxa/q0;->C(Meta,NextToWatch,List):Video` |
| Player model / controller / state | `Lbb/ml;`, `Lbb/gc;`, `Lbb/jl;`; model state getter `e():StateFlow` |
| State identity | season `D0`, episode `E0`, video `F0`, next `y1:Lbb/l4;`, error `m1` |
| Next-episode routes | `Lbb/ng;`: picker `G`, delegate `r`, threshold `y` reading controller `s2:Z` |
| Playback rows | `Lbb/ei;`, `Lbb/ji;`; native callbacks and availability retained |
| Controls / pause timers | `Lbb/jf;->I` with Job `U0`, `K` with Job `m4`; `k` cancels pause overlay |
| Home model | `Lya/u3;` |
| Date percentage control | `Lgb/ic;->j` with 14 parameters |
| Native sync banner | `Lnb/a;->b`: state parameter v64, installed flag v66, close guards 731/734, close label 761 |
| Native install action | `data/local/da.invokeSuspend(Object):Object` |
| Scoped Hilt providers | profile `B`, stream repository `g3`, tracking coordinator `T3`; verified against native `get()` consumers and casts |

The native default search dispatcher now owns the stream-search entry point.
Next-episode preloading passes the player's `gc.r3` priority binge group and
uses native mask `16`. Force-refresh stays false; both plugin flags are enabled
together for the additional local-plugin
autoplay cache entry when appropriate. Continue Watching and detail searches
retain a null group. See [source cache reuse](NuvioNextEpisodePreload.md).
Its exact static descriptor, register layout and instruction fingerprint are
validated before mutation; the incompatible suspend search remains unused.
Native session caching, profile isolation and scoped local-scraper permission
remain in effect.
The group/mode cache correction passed focused runtime and standalone/combined
bundle verification on 2026-11-05. The user subsequently confirmed successful TV
behavior with the next-episode setting enabled in the test profile. See the
source-cache document for the evidence and the disabled-setting diagnostic.

R8 splits the icon utilities again. Playback buttons resolve factory owner and
method together from the same full native references validated at patch time.
This covers play/info in `La/b;`, report in `Lc6/a;`, party/speed in `Lu9/a6;`
and the external-player icon in `Lu9/f2;`.

## Verification

Run from the repository with Java 21 and SDK platform 36:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-1.19.1-all.jar' --continue --offline
```

Device checks remain for playback, remote focus, native tracking sync, profile
switches, optional settings, native installer and Android TV channels.

## Completed validation (2026-11-04)

`buildAndroid`, `generatePatchesList`, `verifyNuvioLatest`, `verifyAndroidBundle`
and Desktop 1.19.1 import passed. Original-DEX checks cover exact native fields,
methods, Hilt provider consumers, changed/missing/ambiguous/already-patched
rejection, mutation scope and DEX write/reload. All ten packaged selections pass
with no new cross-DEX findings; the original retains 36 optional-library findings.
Host checks cover settings, date styles, remaining counts, metadata precedence,
stale completions, profile changes, cancellation and the production 30-second
preload. Historical beta.6 movie/count fixtures remain unchanged; separate
`verifyNuvioBeta10MovieReleaseRuntime` and `verifyNuvioBeta10RemainingSyncRuntime`
checks passed and are included in the current latest suite.

The actual CLI-rebuilt APK passed all 17 playback hook checks, extension/native
reference resolution, exact native updater repairs and installer/provider audits:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:verifyNuvioPlaybackApk :patches:verifyNuvioApkUpdates :patches:verifyNuvioUpdateInstaller '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.10-patches-unsigned.apk' '-PnuvioUpdatesApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.10-patches-unsigned.apk' '-PnuvioRequireStability=true' --offline
```

Successful logs are `../Skills/inspection-evidence/.inspect-nuvio-beta10/final-validation.log` and
`extra-runtime-validation.log`. Additional provider badge/composition/delta,
remaining-count and launcher-publisher checks passed in `final-verification.log`;
that earlier run also records the subsequently corrected preferred-source fixture
and the historical movie/count fixture failures. `git diff --check` passed.

## Rebuilt APK audit (2026-11-04)

Morphe Desktop 1.19.1 rebuilt all sixteen patches with zero failed patches.
The result is `com.nuvio.santodan`, beta.10 / 1073, labelled **NuvioTV Patched**.
Owned permissions, provider authorities, launcher labels and 16-KB native-library
alignment passed audit. All 108 native libraries are byte-identical to the
original. Signature verification confirms the output is unsigned.

- Bundle: `patches/build/libs/patches-0.16.1.mpp`.
- APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.10-patches-unsigned.apk`.
- APK SHA-256: `9f0df20775fe40a1049460b7ce4e161075051214386ccd48540ec291188896d2`.
- Evidence: `../Skills/inspection-evidence/.inspect-nuvio-beta10/rebuild-final.log`, `rebuild-result.json`
  and `apk-audit.json`.

The APK was rebuilt and audited. It was not signed, installed or tested on a
device. No commit or push was made.

## Pull to v0.16.2 (2026-11-04)

Fast-forwarded `main` from `32065a5` to `93f9a74`, the single upstream
`chore: Release v0.16.2 [skip ci]` commit. All 41 local changed/new files were
restored. Before updating these release notes, 40 were byte-identical to their
pre-pull versions; the generated patch list retained only the upstream bundle
version and APK-update default changes. A byte-verified backup is at
`../backups/beta10-before-pull-20261104-122308/`.

The current bundle is `patches/build/libs/patches-0.16.2.mpp`; the version came
from upstream. No local release bump, merge commit, new local commit or push
was made at that checkpoint. Pending release notes now distinguish the released
beta.9 port from the pending beta.10 work.

All sixteen patches were rebuilt again with the 0.16.2 bundle. The separately
named output preserves the earlier APK:

- APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.10-patches-0.16.2-unsigned.apk`.
- SHA-256: `d8698dc96c9fdbe79061986f96c438c4e213554fa99ee86a823171352730dda0`.
- Evidence: `../Skills/inspection-evidence/.inspect-nuvio-beta10/post-pull-rebuild.log`,
  `post-pull-rebuild-result.json` and `post-pull-apk-audit.json`.

The clone identity, owned permissions, provider authorities, launcher labels and
16-KB alignment passed again. All 108 native libraries match the original.
This output is unsigned and was not installed or device-tested.

Post-pull `buildAndroid`, `generatePatchesList`, the complete `verifyNuvioLatest`
suite, `verifyAndroidBundle` and Desktop 1.19.1 import passed again. The actual
0.16.2 APK also passed `verifyNuvioPlaybackApk`, `verifyNuvioApkUpdates` and
`verifyNuvioUpdateInstaller`, using the versioned APK above for `nuvioPlaybackApk`
and `nuvioUpdatesApk`, with `nuvioRequireStability=true`. See
`../Skills/inspection-evidence/.inspect-nuvio-beta10/post-pull-verification.log` and
`post-pull-apk-verification.log`. Generated metadata differs from upstream only
in the sixteen beta.10 compatibility targets. `git diff --check` passed.

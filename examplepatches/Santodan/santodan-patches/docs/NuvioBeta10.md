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
Preloading passes the native default mask `208` (16 + 64 + 128), preserving
false force-refresh and the two new false search flags, with a null group.
Its exact static descriptor, register layout and instruction fingerprint are
validated before mutation; the incompatible suspend search remains unused.
Native session caching, profile isolation and scoped local-scraper permission
remain in effect.

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

# NuvioTV 1.1.0-beta.9

Target: `com.nuvio.tv`, `1.1.0-beta.9`, version code `1072`.
Original: `../OriginalApps/NuvioTV-1.1.0-beta9.apk`.
SHA-256: `4ea5754c0fdee16cfd00d1b137f5a8ba8224e2081213750148a02ba64fa0aebd`.
Manifest identity was read with SDK aapt. All six original DEX files were inspected.

All sixteen public patches use the reviewed active contract in
`contracts/nuvio/native.properties`. Existing historical fixtures are preserved;
new `VerifyNuvioBeta9*` fixtures cover this target. No release version is bumped.

## Native evidence

The read-only update report found 43 unique class matches, 80 classes needing
review and 61 stale explicit references. Class similarity suggestions were
followed by method/field and call-site inspection, including R8 utility splitting.
Local inventories, semantic field evidence and verification logs are under
`../.inspect-nuvio-beta9/`.

| Contract | Beta.9 binding |
| --- | --- |
| Progress repository / local writes | `Lba/qf;`, `G` and `t` with `(int, WatchProgress, ContinuationImpl, boolean):Object` |
| Local progress / watched stores | `data/local/yb` / `pc`; existing suspend bodies remain wrapped |
| Stream repository / plugin request | `Lba/f5;` / `Lba/v4;`; request repository `i`, video `j`, type `k`, season `l`, episode `m` |
| Detail resolver | static `Lxa/s0;->D(Meta,NextToWatch,List):Video` |
| Player model / controller / state | `Lbb/hl;` / `Lbb/bc;` / `Lbb/el;` |
| Player state getter | `hl.e():StateFlow`; native `hl.f():void` remains a controls action |
| State identity | season `A0`, episode `B0`, video `C0`, next `v1:Lbb/k4;`, error `j1` |
| Next-episode routes | `Lbb/ig;`, threshold `x` reads `s2:Z`; picker callers `Lbb/zf;` |
| Playback rows | `Lbb/ai;` (59 registers), `Lbb/fi;` (52 registers); original callbacks/availability retained |
| Controls / pause-overlay timers | `Lbb/df;->H` with controller `U0` Job; `J` with `k4` Job; `j` cancels pause overlay |
| Home model / pipeline | `Lya/t3;` / `Lya/i5;` |
| Home card captures | `Lna/q0;`: title `l`, progress `r`, next-up `s` |
| Library / collection MetaPreview | `Lna/u1;->g`, `Lna/i0;->h`; collection renderer has 57 registers |
| Poster / style helpers | image `Lgb/dg;->b`; style `Lgb/dh;->s` and `u` |
| Layout insertion | `Lbb/dh;->invoke` constructs `Lgb/u6;` with `Lgb/h7;`, followed by unique `Lg0/i;->q` |
| Settings / Compose state | rows `Lgb/gd;`, section `Lgb/ke;`, picker `Lgb/pd;`; `Lh1/h;->s(Object):Lh1/r1;` |
| Tracking policy helpers | selection `Lna/f3;`, Compose wrapper `Lgb/ch;->N`; enum `data/local/zb`, values field `h` |
| Navigation | `Lm5/m;->d:Lm5/g0;`, destination route `i:String` |
| Native sync banner | host `Lna/k1;->n`; banner `Lnb/a;->b`; reviewed close guards 729/732 and label 759 |
| Native updater / installer | `Llb/` updater classes; install action `data/local/jc` |

Patch-time checks retain exact descriptors and fingerprints, unique anchors,
register/branch guards and already-patched rejection. Native disabled paths,
authentication, tracking-provider ownership and saved preference IDs are preserved.

## Verification

Run with Java 21 and SDK platform 36:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest --offline
```

Device checks remain for remote focus/navigation, playback, native sync,
profile changes, optional settings and Android TV channel publication.

## Completed validation (2026-10-31)

Passed with Java 21, SDK platform 36 and Morphe Desktop 1.19.1:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest :patches:verifyNuvioProviderBadge :patches:verifyNuvioStreamPreload :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-1.19.1-all.jar' --continue --offline
```

The subsequent banner-parameter correction passed `verifyNuvioBeta9`, all ten
`verifyNuvioBeta9Bundle` selections, `verifyAndroidBundle` and Desktop import
again. Banner hooks now derive the state and installed-flag registers from the
native parameter frame (66 and 68), with original-DEX and packaged regressions.
The full suite covers unique/changed/missing/ambiguous/already-patched rejection,
DEX write/reload, disabled behavior, settings, focus, profile isolation,
cancellation, persistence, timer lifecycle and the production 30-second preload.
All ten packaged selections retain the original 36 optional-library cross-DEX
findings with no new findings.

The CLI rebuilt all sixteen patches, including side-by-side installation, with
zero failed patches. The rebuilt APK is `com.nuvio.santodan`, beta.9 / 1072,
labelled **NuvioTV Patched**. Its owned permissions, provider authorities,
launcher labels and 16-KB native-library alignment passed audit. All 108 native
libraries are byte-identical to the original. Signature verification reports
`Missing META-INF/MANIFEST.MF`, as expected for the deliberately unsigned output.

The APK verifier now checks inherited Java APIs against the actual SDK class
files, matching the bundle verifier, so inherited `Enum` methods are resolved
without assuming the host JDK API or exempting unresolved calls.

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:verifyNuvioPlaybackApk :patches:verifyNuvioApkUpdates :patches:verifyNuvioUpdateInstaller '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.9-patches-unsigned.apk' '-PnuvioUpdatesApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.9-patches-unsigned.apk' '-PnuvioRequireStability=true' --offline
```

Artifacts:

- Bundle: `patches/build/libs/patches-0.16.0.mpp`; the repository version was already 0.16.0 and was not changed.
- Unsigned APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.9-patches-unsigned.apk`.
- APK SHA-256: `eb9c0f5a4669a71218f8d27d521409fdffe385c48afdcee9e9f915551dcd47ea`.
- Logs: `../.inspect-nuvio-beta9/final-verification.log`, `banner-register-verification.log`, `rebuild.log`, `apk-verification-final.log` and `apk-audit.json`.

The APK was rebuilt and audited. It was not signed, installed or tested on a
device. No commit or push was made. The pending release-note scope is `nuviotv`.

## Pull and rebuild (2026-10-31)

Fast-forwarded `origin/main` from `cc12b85` to release commit `69468af`
(v0.16.1). A byte-verified backup of all 65 local changed/new files is at
`../backups/beta9-before-pull-20261031-160931/`. All 63 files other than the
regenerated README and patch list retained their exact pre-pull content.
The pending release-note scope remains `nuviotv`.

The new current bundle is `patches/build/libs/patches-0.16.1.mpp`.
`buildAndroid`, `generatePatchesList`, the complete `verifyNuvioLatest` suite,
`verifyAndroidBundle` and `verifyMorpheDesktopImport` with Desktop 1.19.1 passed
again; see `../.inspect-nuvio-beta9/post-pull-verification.log`.
The version came from the pulled release commit. No local version bump, commit
or push was made. This follow-up rebuilt the MPP; the unsigned APK recorded
above remains the earlier build and was not rebuilt or installed here.

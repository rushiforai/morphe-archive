# NuvioTV 1.1.0-beta.12

Target: `com.nuvio.tv`, `1.1.0-beta.12`, version code `1075`.
Original: `../OriginalApps/NuvioTV-1.1.0-beta12.apk`.
SHA-256: `de66748a063a619d3688dfe37a31b644fb9fce94476603f8bd1c6f40031787d8`.
The package and version were read with SDK aapt. All original DEX files were
inspected; inventories, comparison reports and verification logs are retained in
`../Skills/inspection-evidence/.inspect-nuvio-beta12/`.

All sixteen public patches target beta.12 through the shared
`contracts/nuvio/native.properties`. Dedicated `VerifyNuvioBeta12*` fixtures
replace beta.10 in `verifyNuvioLatest`; historical fixtures remain unchanged.
The bundle release version is unchanged.

## Reviewed migration

| Contract | Beta.12 binding |
| --- | --- |
| Player model / controller / state | `bb.ql`, `bb.gc`, `bb.nl`; state getter `e()` |
| Playback rows / controls / timers | `bb.ji`, `bb.oi`, `bb.qk`, `bb.of` |
| Controls / pause / cancellation | `of.J` / `of.L` / `of.k`; jobs `U0` / `p4` |
| Progress repository / stores | `ba.sf`, `data.local.dc`, `data.local.tc` |
| Local-save resume states C / D / A / B | `data.local.xb` / `yb` / `vb` / `wb` |
| Stream repository / plugin request | `ba.n5`, `ba.d5`; native static dispatcher `n5.l` |
| Next-episode routes / binge group | `bb.sg.G`, delegate `r`, threshold `y`; controller `u3`, threshold flag `t2` |
| Detail resolver / model | `xa.o0.C`, `xa.n7` |
| Home model / state / pipeline | `ya.t3`, `ya.s2`, `ya.h5` |
| Home next-up seed decision / Upcoming split | `h5.B` / `h5.D` |
| Native updater host / grouped labels | `na.r1.n`, `m9.v4.j` |
| Native install action | `data.local.ea.invokeSuspend` |
| Focus factory / animated scope | `f2.r.g`, `v.b0` |

The player identity fields remain `D0`, `E0`, `F0`, `y1` and `m1`.
Hilt profile, stream and tracking providers remain `B`, `g3` and `T3`; the
original-DEX checks validate native consumer types, not field existence alone.
Native stream search still uses mask 16 and the player binge group, including
the additional plugin-continuation cache mode only for native-recognized groups.
Search mode and group remain part of the cache key.

The suspended local-save fix is retained with beta.12's exact continuation
classes. Re-entry with placeholder arguments must resume the native body,
publish completion once and preserve partial positions. Quick startup retains
cached CW followed by awaited provider reconciliation, the 120-second startup
provider deadline, cancellation and profile guards.

Updated fingerprints retain fail-closed validation. Changes were checked against
original DEX, including renamed utility methods, shifted player fields, the
native updater root/banner, and the actual install-action authority literal.
The old `data.local.da` still exists but no longer owns installation; selecting
it by its old name would miss the FileProvider update and is rejected.

## Verification

Run from the repository with Java 21 and SDK platform 36:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.0.0-all.jar' --continue --offline
```

Device checks remain for playback/resume, remote focus, tracker synchronization,
profile switches, optional settings, the native installer and TV channels.
Local DEX and host-runtime results do not establish device behavior.

## Completed local validation (2026-11-07)

`buildAndroid`, `generatePatchesList`, the complete `verifyNuvioLatest` suite,
`verifyAndroidBundle` and Desktop 2.0.0 import passed. Original-DEX checks cover
native runtime bindings, rejection cases, mutation scope and DEX write/reload.
All ten packaged selections passed, including the combined selection. Cross-DEX
verification adds no findings to the original's 36 optional-library findings.
Host checks retain delayed/group-aware preloads, suspended completion and partial
positions, provider reconciliation, settings, movie-date and remaining-count
behavior. The successful run is `final-validation.log` in the evidence directory.

Morphe Desktop 2.0.0 rebuilt the original with all sixteen patches and zero
failures. The output is `com.nuvio.santodan`, beta.12 / 1075, labelled
**NuvioTV Patched**. Owned provider authorities and permissions, launcher labels
and 16-KB native-library alignment passed audit. All 108 native libraries are
byte-identical to the original. Signing verification confirms an unsigned APK.

- Bundle: `patches/build/libs/patches-0.16.4.mpp`.
- Bundle SHA-256: `9e46de40c9468e6ac51fad6295abedf61981562d9e0b9c7f0f9c58694d4f48d2`.
- APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.12-patches-0.16.4-unsigned.apk`.
- APK SHA-256: `a1751c799fa59879502054f7a2297c2d57f895b6938c89f69a38890d6fedfdad`.
- Evidence: `rebuild.log`, `rebuild-result.json` and `apk-audit.json` in the
  beta.12 evidence directory.

The APK was rebuilt and audited. It was not signed, installed or device-tested.
No commit or push was made.

The actual rebuilt APK also passed `verifyNuvioPlaybackApk` (all 17 playback
hooks and extension/native reference resolution), `verifyNuvioApkUpdates` and
`verifyNuvioUpdateInstaller` (exact updater/installer repairs and clone providers):

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:verifyNuvioPlaybackApk :patches:verifyNuvioApkUpdates :patches:verifyNuvioUpdateInstaller '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.12-patches-0.16.4-unsigned.apk' '-PnuvioUpdatesApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.12-patches-0.16.4-unsigned.apk' '-PnuvioRequireStability=true' --offline
```

See `apk-verification.log` in the beta.12 evidence directory. `git diff --check`
passed. Release-owned version metadata remains 0.16.4.

# NuvioTV 1.1.1

Target: `com.nuvio.tv`, version `1.1.1`, version code `1081`.
Original: `../OriginalApps/NuvioTV-1.1.1.apk`.
SHA-256: `1ac8aa80ad9fff7b4c21cfe4bfdfed61b4de44a120ff4b1b5743149ccb00928d`.
SDK aapt confirms the package and version. All eighteen public NuvioTV patches
use this exact target, including metadata add-on selection. Bundle versions remain
owned by the release workflow.

## Migration

The native contract now describes 1.1.1. Dedicated `VerifyNuvio111*` fixtures and
tasks drive `verifyNuvioLatest`; historical fixture sources remain unchanged.

- Current-stream rendering moved from `bb.wn.h` to static `bb.vn.h`. The complete
  thirteen-argument signature, register count and instruction body are unchanged.
- The controller's playback request type moved from `T` to `U`, binge group from
  `u3` to `v3`, preload-trigger flag from `t2` to `u2`, controls job from `U0` to
  `V0`, and playback session flow from `H0` to `I0`. The player-state accessor
  still returns a StateFlow, now through controller `G0`. Shared contract names
  bind the preload and IntroDB readers to the same fields their patches validate.
- Native Info/Speed factories moved to `z0.e.b` / `z0.c.b`. External/report
  factories moved to `k8.d.B` / `k8.d.x`. Native caption, aspect and chapter caches
  are `k8.d.h`, `k8.j.e` and `k8.i.b`. Real-DEX glyph checks retain Info, Play,
  Groups and BugReport semantics and also verify Speed and OpenInNew.
- Library cards now call static `z0.d.e(String,Composer):int` before requesting
  their image. The metadata artwork hook uses this full reviewed reference.
  Native repositories, enrichment constructors and per-profile persistence remain
  unchanged. Metadata hooks still compose with movie/finale decorations.
- Startup, player controls/timers, native update banner, installer and updater
  fingerprints were refreshed after reviewing their native reference moves and
  embedded version constants. Signature, mutation-scope, try-layout and
  missing/changed/ambiguous/already-patched checks remain in place.

## Evidence

Use `../Skills/inspection-evidence/.inspect-nuvio-111/` directly.
`provenance.json` records both original APK hashes and all original DEX hashes.
The retained 1.1.0 fixtures were compared byte-for-byte with their original APK;
the five 1.1.1 fixtures were extracted independently.

`baseline.tsv`, `candidate.tsv` and their `*-extra.tsv` counterparts contain
fresh original-Dex definitions, method fingerprints and focused instruction dumps.
`reviewed-method-comparison.json` proves eleven guarded bodies retain their
opcodes, registers, literals and branch offsets after the explicitly reviewed
reference moves. Focused `*-diff.txt` files cover player controls, timers, startup,
metadata library artwork, update banner and installer changes. The structural
discovery report is a candidate-finding aid, not compatibility proof.

## Verification and delivery

Run from the repository with Java 21 and SDK platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.2.0-all.jar' --continue --offline
```

`final-validation.log` records the complete suite. Its sole remaining failure was
an IntroDB verifier assertion containing the preceding release's control-row hash;
the dedicated 1.1.1 fixture and default verifier entry points are checked in
`final-fixtures.log`, which passed. All required checks passed across these runs
and the APK audits on 2026-11-21. The packaged verifier applies
eleven standalone/combined selections, including metadata alone and all patches
together, and checks DEX roundtrips, runtime/native references and cross-DEX
findings. Settings, playback, IntroDB, preloading, tracking, lifecycle and
negative matcher checks run separately from package import.

The CLI rebuild applies all seventeen patches to the original without `--force`.
`rebuild-all.command.json`, `rebuild-all.json`, `rebuild-all.log` and
`rebuild-all.audit.json` retain the command, patch results and delivery audit.
The output retains all 108 original native libraries and passes 16-KB alignment.
Clone authorities, restart process and private settings activities are audited.

`verify-apk.ps1` records the actual-APK audit invocation. `apk-validation-2.log`
records successful playback, updater, installer, date-label editor,
settings transfer/restart, IntroDB, metadata and new `verifyNuvio111Apk` checks.
The latter checks migrated native definitions and reflected bindings in the
delivered preload, IntroDB and playback-icon runtime classes. Cross-DEX findings
remain the original's 36 optional-library findings.

Bundle: `patches/build/libs/patches-0.20.0.mpp`.
Combined APK: `../Apps/NuvioTV/NuvioTV-1.1.1-patches-0.20.0-all-unsigned.apk`.
Initial migration bundle SHA-256: `5916f857ee31ffe5249edf9a88d2460c6af02e71965922f286d6253654d5deb8`.
APK SHA-256: `c00e4b8fcb7438ee5b98dc8de9808e6341d16d9254399eca669682fdf63c42e9`.

The APK is unsigned. No signing, installation or device testing was performed.
Device checks remain for remote focus, native settings editors, playback/resume,
profiles, tracking, metadata artwork across restarts, TV channels and installation.

## Continue Watching transition follow-up

The merge patch now preserves the existing card during initial/partial Home
publications while the next episode is being resolved. The final native result
still replaces or removes it. See [NuvioMergedProgress.md](NuvioMergedProgress.md)
for the reported Mi Box delay, native hook evidence and behavior limits.

`home-transition-final-validation.log` records a successful Android build,
native hook/rejection/roundtrip and runtime checks, existing local playback
regressions, standalone merge/combined bundle checks, Android bundle verification
and Desktop import. `home-transition-old-apk-regression.log` rejects the preceding
APK specifically for missing staged Home hooks. `home-transition-apk-audit.log`
checks the replacement's delivered hooks/reflection strings and existing APK
integration. The separate rebuild command and identity/library/alignment audits
are recorded in `home-transition-all.*` in the same evidence folder.

Replacement APK:
`../Apps/NuvioTV/NuvioTV-1.1.1-patches-0.20.0-all-cw-transition-unsigned.apk`.
SHA-256: `d00cb0c8c05ac462e48d2c99426d3cf894a9f1b35d681b6e58ff4937d43dfd6e`.
The bundle path is unchanged; its content now includes the transition fix.
Bundle SHA-256: `669496187d5aa64fa46374f15d67bd37813bbb2955b518ed2f10a3cf43ff5a79`.
The earlier `all-unsigned.apk` is retained as the regression input.
The replacement is unsigned; no installation or device test was performed.


## Live local playback projection delivery

Continue Watching now follows the local playback journal behind the player.
Position updates do not run metadata lookups; completion starts one coalesced,
bounded native single-show next-up lookup. Existing quick/normal tracker sync
remains separate. The earlier keep-visible-only output is superseded by this
local-update implementation; see [NuvioMergedProgress.md](NuvioMergedProgress.md).
Fast playback launches retain the native observer until its settings snapshot is
captured, then pause bulk work while leaving the local updater active.

`local-home-final-validation.log` records the full latest suite. Its sole failure
was the maintenance verifier treating `REF_HOME_NEXT_TYPE` (a field reference)
as a class; `local-home-final-focused.log` records the corrected classification,
original native-reference checks, runtime tests and standalone/combined bundle
checks passing. `local-live-release-check.log` and
`local-live-native-context-check.log` record the final lifecycle/native-context
checks. The previous APK is rejected in `local-live-old-apk-regression.log`.
`local-live-final-apk-audit.log` records successful actual-APK checks, including
settings capture, native resolver/state-copy bindings and cache-free Home resume.
The exact rebuild command and native-library/identity/alignment audit are in
`local-live-all.*`. Original native libraries remain unchanged.

Latest bundle: `patches/build/libs/patches-0.20.0.mpp`.
Bundle SHA-256: `a06607ace86074b8679d53aed8c075f8974ecf96011c5c0c835ede62be1ca98b`.
Latest APK: `../Apps/NuvioTV/NuvioTV-1.1.1-patches-0.20.0-all-local-live-unsigned.apk`.
APK SHA-256: `8e7fcc2659f78969407357e26436f3cc7cf65f1500e794ce2c1785f2bd389c78`.

The APK is unsigned. No signing, installation or Mi Box device test was performed.
Native cache-miss latency and playback/frame behavior remain device checks.

## Direct date-label editor

Date label appearance is a clickable row that opens one menu directly.
Select Text or Label in the horizontal top row; the color picker and sliders
update for that part. The opacity/size sliders are below the color picker,
outside the preview. Position and reset are also inside, with a shared preview
and one Apply/Cancel for the draft.
See [behavior, native evidence and verification](NuvioDateLabelEditor.md).

## Optional badge editor

The eighteenth public patch, [Customize labels](NuvioLabelCustomization.md), adds
per-label caption and appearance drafts using the native date editor UI. It is
independent of the existing date-label patches. Historical rebuild evidence above
records the preceding seventeen-patch bundle.

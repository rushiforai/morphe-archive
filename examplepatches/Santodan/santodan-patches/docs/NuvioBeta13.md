# NuvioTV 1.1.0-beta.13

Target: `com.nuvio.tv`, `1.1.0-beta.13`, version code `1076`.
Original: `../OriginalApps/NuvioTV-1.1.0-beta13.apk`.
SHA-256: `306eb6dcb904677000df18448d5cd6a8b4bc6d436eff5984e6ad25e82b6aeecb`.
Identity was read from the original manifest with SDK aapt. All five retained
DEX files match their original ZIP entries byte-for-byte.

All sixteen public patches target beta.13 through
`contracts/nuvio/native.properties`. `verifyNuvioLatest` uses dedicated beta.13
fixtures. Historical beta.12 and earlier fixtures remain unchanged. Local
verification below uses bundle 0.16.5 as its baseline. The Release workflow
assigns the published version and updates release-owned metadata.

The side-by-side patch also supports exporting/importing all Santodan runtime
settings through Android's document picker. See
[NuvioPatchSettingsBackup.md](NuvioPatchSettingsBackup.md) for usage, profile
handling, included settings and verification.

For the subsequent IntroDB API-key menu fix, see
[NuvioIntroDb.md](NuvioIntroDb.md#beta13-api-key-editor-fix-2026-11-08).
The row is explicitly enabled and the editor uses the reviewed beta.13 dialog,
keyboard-controller and border contracts.
The current combined rebuild is
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-date-opacity-all-unsigned.apk`;
it includes the earlier playback/IntroDB fixes, settings backup, native transfer
dialogs and Restart button, with default package `com.nuviotv.santodan`.
The earlier `introdb-editor-fix` output still used the String callback branch for
focus events and is superseded; see the focus-crash follow-up in the same document.

For the corrected playback editor, use
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-editor-fix-unsigned.apk`.
The earlier APK without `editor-fix` in its name is superseded; see the follow-up
below for its crash and the replacement's verification.

## Reviewed native contracts

Date-label **Label color** and **Font color** retain the native swatch row,
opacity controls and Apply/Cancel buttons. Color names are now visible beneath
the circles. The first **Custom** circle displays the actual draft/saved color,
including its opacity, while retaining a separate internal marker for its action.
All other swatches keep their order and native focus/click behavior.

Custom opens the native hue/saturation/brightness/hex editor. Its preview overlays
an actual date label on a random movie cover. A native **Switch to Card** /
**Switch to Poster** button independently selects a 2:3 poster or 16:9 card.
The preview keeps its mode for the current app session, without reading or
changing Continue Watching, global landscape preferences, profiles or stores.
Switching modes keeps the same sample movie and color draft.
Landscape artwork prefers the movie's landscape poster, then backdrop, then the
native cropped-poster fallback. The label uses the live edited color and the
saved other color, position, padding, font size and native text style. Preview
changes do not write preferences. The editor button reads **Apply** and returns to the original
picker; that picker's Apply commits RGB and opacity. Cancel does not commit the
draft. Normal theme customization retains its original preview and Save Theme.

The custom editor now carries the native picker's live opacity, including changes
not yet applied in that picker. The reviewed `gb.jc.b` opacity state is captured
after its `g1.o1` cast. Opening Custom copies its current percentage into the
separate ARGB draft; the native RGB-only editor and preview preserve that alpha.
Custom Apply returns to the picker at the same opacity rather than resetting to
100%. Cancel still leaves stored preferences unchanged. Regression checks cover
0%, 30%, 50% and 100% for label and font colors through preview and both Apply
steps. `date-opacity-native-evidence.txt` records the new native hook.

The shared native `MetaPreview` constructor retains artwork/title strings for
at most 24 unique movies already loaded by the app. Series, duplicates and empty
or placeholder posters are skipped. The preview chooses once per editor opening,
so slider changes do not switch movies. Image loading and caching use native
`gb.cj.a`; there are no additional catalog/API requests. If catalogs have not
loaded yet, the label remains visible and the first valid movie publishes a
preview revision when available. Native image loading can still fail offline.

The previous `date-custom-color-v2` output incorrectly replaced the picker with
a list. It also passed ARGB to `CustomThemeColors`, whose constructor requires
all three values in `0..0xFFFFFF`. The emulator log shows this exact
`IllegalArgumentException` when opening Custom. That output is superseded.
The corrected editor strips alpha before constructing the native model and
preserves alpha separately for the original picker. The host fixture now enforces
the actual constructor restriction rather than accepting invalid ARGB values.

The editor binding is static
`gb.x0.a(CustomThemeColors,boolean,Function1,Function0,Composer,int)`, with gradients
disabled. Native swatch `gb.jc.a(J,boolean,boolean,Function0,Modifier,Composer,int)`
is wrapped in a centered column containing the original focusable circle and a
non-focusable caption. A recursion guard lets the circle render with the real
custom color while preserving the Custom action. Native `gb.x0.c` delegates to
the date-label preview only for the label editor; its native theme path remains.
The Save Theme resource in reviewed `gb.i0.invoke` resolves to native Apply only
in this editor. All hook targets keep their register counts. Full references are
shared in `contracts/nuvio/native.properties`.
Evidence is `date-preview-toggle-native-evidence.txt`, `date-cover-preview-native-evidence.txt`, `date-label-preview-native-evidence.txt`,
`date-native-swatch-native-evidence.txt` and `date-native-swatch-user-crash.txt` in the beta.13 inspection directory.

Verification: `buildAndroid`, `verifyNuvioBeta13DateStyleRuntime`,
`verifyNuvioBeta13`, standalone/combined `verifyNuvioBeta13Bundle`,
`verifyAndroidBundle`, Desktop 2.1.1 import and
`verifyNuvioDateColorApk -PnuvioDateColorApk=<apk>`.
The APK audit requires caption, preview and scoped Apply hooks, their native
reflection bindings and the RGB mask. Host tests exercise visible color names,
the real custom circle color, movie-only sampling, stable artwork across edits,
an independent Poster/Card button, both dimensions, poster-only fallback, live
label background/font previews, balanced Compose groups, native Apply/opacity, scoped button text, persistence and reset.

Combined unsigned APK:
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-date-opacity-all-unsigned.apk`.
SHA-256: `0271c9efd02ad54b03666258a3838931a49b04e89b2ad276ba6cb6b8443f092f`.
All sixteen patches rebuilt successfully; native libraries remain unchanged and
16-KB alignment passes. Not signed or installed; corrected UI interaction and TV
focus remain untested on a device. Bundle: `patches/build/libs/patches-0.16.5.mpp`.

| Contract | Beta.13 binding |
| --- | --- |
| Player model / controller / state | `bb.vl`, `bb.lc`, `bb.sl`; state getter `e()` |
| State identity | season `D0`, episode `E0`, video `F0`, next `y1:bb.m4`, error `m1` |
| Playback rows / controls / timers | `bb.oi`, `bb.ti`, `bb.vk`, `bb.tf` |
| Controls / pause / cancellation | `tf.J` / `tf.L` / `tf.k`; jobs `U0` / `p4` |
| Progress repository / local stores | `ba.yf`, `data.local.cc`, `data.local.sc` |
| Local-save resume states C / D / A / B | `data.local.wb` / `xb` / `ub` / `vb` |
| Stream repository / plugin request | `ba.q5`, `ba.g5` |
| Native stream search | static `q5.l(q5,String,String,Integer,Integer,boolean,String,boolean,boolean,int):Flow` |
| Next-episode routes / binge group | `bb.xg.G`, delegate `r`, threshold `y`; controller `u3`, threshold flag `t2` |
| Detail resolver / model | static `xa.n0.C(Meta,NextToWatch,List):Video`, `xa.n7` |
| Home model / state / pipeline | `ya.v3`, `ya.t2`, `ya.k5`; seed policy `B`, Upcoming split `D` |
| Compose state factory | static `g1.h.s(Object):g1.r1` |
| Focus factory / animated scope | `g.e.g`, `u.b0` |
| Poster image / colors / focus | `gb.cj.b`, `gb.oj.z`, `gb.oj.B` |
| Native updater host / grouped labels | `gb.cj.h`, `m9.a5.i` |
| Native string / formatted string | `a.a.T`, `a.a.U` |
| Native install action / receiver fallback | `data.local.da.invokeSuspend`, static `UpdateInstallResultReceiver.a(Context,File,boolean,boolean)` |

The original static search API remains available. `ba.c6.e` is a session-cache
helper, not its replacement. Similarly, `c9.b2.s()` is an instance StateFlow
getter, not a Compose state factory. Keep the original static/parameter/return
guards; do not weaken validation to accept either unrelated method.

Hilt profile, stream and tracking providers remain `B`, `g3` and `T3`. Original
DEX checks validate their consumers and types. Preloads preserve the native mask
16, priority binge group and plugin-continuation cache mode. The group and search
mode remain part of the native cache key. Suspended local writes retain exact
native resume states, exactly-once completion and partial playback positions.

Continue Watching's card now has 65 registers; its image call still passes the
live Composer as its twelfth argument. Library/collection cards retain 36/59
registers. Updated utility owners and full field references are shared by patch
validation and runtime icon-cache access. Native image/text/focus behavior is
preserved rather than replaced.

The installer receiver now delegates fallback installation to a static helper.
Metadata suppression remains in the original callback; clone-authority repair
targets the helper and the native install action. Both methods are validated
before edits. Checks cover missing/changed helpers, mutation atomicity, both
patch orders, duplicates and DEX/try-region round trips.

## Inspection evidence

Use `../Skills/inspection-evidence/.inspect-nuvio-beta13/` directly. The trusted
inventories are `reviewed-baseline.json` / `.tsv` and `reviewed-inventory.json` /
`.tsv`, regenerated from the original beta.12 and beta.13 APKs. Earlier inventory
and mapping files retained from the incomplete attempt are not verified inputs.
`reviewed-report.md` is the fresh APK-to-APK structural comparison; its candidate
matches require semantic review. `icon-method-evidence.txt` records factory
matching by native glyph labels, including cases with split utility owners.

The earlier partial port and its historical-fixture edits were backed up before
completion; `completion-backup.txt` records that workspace backup path.

## Verification commands

Run with Java 21 and SDK platform 36:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.0.0-all.jar' --continue --offline
```

For the actual rebuilt APK:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:verifyNuvioPlaybackApk :patches:verifyNuvioApkUpdates :patches:verifyNuvioUpdateInstaller '-PnuvioPlaybackApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-unsigned.apk' '-PnuvioUpdatesApk=E:/Morphe/Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-unsigned.apk' '-PnuvioRequireStability=true' --offline
```

Device checks remain for playback/resume, focus, profiles, native tracking sync,
optional settings, Android installation and TV channels. No signing,
installation or device testing is implied by local checks.

## Initial port checks (2026-11-08; superseded by the editor fix below)

The complete `verifyNuvioLatest` suite, Android bundle verification and Desktop
2.0.0 import passed (`final-validation.log`). The final icon follow-up passed
original-DEX glyph checks, runtime composition/settings checks and contract
validation (`icon-validation.log`). It corrects Play/Info factory selection and
keeps the caption cache `k8.k.g` separate from the native Groups and Play caches.
Historical beta.12 verifier files have no diff from the committed baseline.

Morphe Desktop 2.0.0 rebuilt all sixteen patches with zero failures. The final
APK is `com.nuvio.santodan`, beta.13 / 1076, labelled **NuvioTV Patched**.
Provider authorities, owned permissions, launcher labels and 16-KB alignment
passed audit. All 108 native libraries match the original; the APK is unsigned.
The preliminary APK from before the icon follow-up is retained only in the
inspection-evidence directory, not at the delivered output path.

- Bundle: `patches/build/libs/patches-0.16.5.mpp`.
- Bundle SHA-256: `4ee1467d0db74eec6cd8b36f5202a90551b2948bdcd552f0050ddaa041279b09`.
- APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-unsigned.apk`.
- APK SHA-256: `2ac8265f6ac7f851c9b4dac69309efbdf95c90852e867aa8a4da08270172c134`.
- Evidence: `rebuild.log`, `rebuild-result.json`, `apk-audit.json` and
  `final-bundle-apk-validation.log` under the beta.13 inspection directory.

The final follow-up passed all ten packaged selections, Android bundle checks,
Desktop import and audits of the actual rebuilt APK. All 17 playback hooks and
their extension/native references resolve. Exact updater/installer repairs,
including the receiver's new fallback helper and both clone authorities, match
the verified mutations. Cross-DEX checks add no findings to the original's 36
optional-library findings. `git diff --check` passed.

At this validation checkpoint, no commit, push, signing or installation had been
performed. Device confirmation remained pending.

## Playback editor crash fix (2026-11-08)

The user's 10:32:35 crash is `NoSuchMethodException: d7.a.G`, reached through
`ButtonsUi.lambda$iconPicker$11` while opening the editor. Original beta.13 DEX
defines the list renderer as static `d7.a.H(...):void` with twelve parameters;
`G(int):long` is an unrelated helper. The patch's full reference already selected
H, but runtime still read a separate stale `LAZY_LIST_METHOD=G`. The original
host fixture also supplied G with the renderer signature, hiding this mismatch.

The runtime now derives the renderer owner and method from the validated
`REF_LAZY_LIST_I`; the duplicate name property is removed. The host fixture uses
H and the real one-argument G overload. Original-DEX checks establish that G is
not a twelve-argument renderer. The actual APK audit requires the editor's full
native reference to resolve to a packaged native definition. This audit rejects
the earlier crashing APK and passes the replacement.

Validation: `buildAndroid`, `verifyNuvioMaintenance`, `verifyNuvioPlaybackButtons`,
`verifyNuvioPlaybackButtonsRuntime`, standalone/combined `verifyNuvioBeta13Bundle`,
the actual-APK playback/updater/installer checks, Android bundle checks and
Desktop import. Evidence is `editor-crash-old-apk-regression.log` (expected
failure), `editor-fix-bundle-validation.log`, `editor-fix-apk-validation.log`,
`editor-fix-rebuild-result.json` and `editor-fix-apk-audit.json` in the beta.13
inspection directory.

- Fixed bundle: `patches/build/libs/patches-0.16.5.mpp`.
- Bundle SHA-256: `7f980e9d47dd69fe5df17153b84b72e8fcdaa1f471b2221900625613172b8a35`.
- Fixed APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.13-patches-0.16.5-editor-fix-unsigned.apk`.
- APK SHA-256: `e7e42593a79c0ac05c53ecc3644a300cef7f5850f9b524e5d58c67a9440aedeb`.

All sixteen patches rebuilt successfully. Clone identity and providers, 16-KB
alignment and all 108 unchanged native libraries passed audit. The fixed APK
is unsigned and was not installed or device-tested. No commit or push had been
made at that validation checkpoint.

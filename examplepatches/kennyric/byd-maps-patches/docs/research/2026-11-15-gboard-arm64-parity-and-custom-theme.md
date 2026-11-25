# Gboard 18.6.3: arm64/arm32 patch parity and the Custom Theme import failure

Date: 2026-11-15. Two questions from the owner:

1. The Gboard fixes were updated and checked against the armeabi-v7a release APK; does the same
   patch set still apply to the arm64-v8a release?
2. Importing a theme from Rboard fails with **"The theme could not be verified or installed."**

## 1. Inputs

| Input | SHA-256 |
| --- | --- |
| `com.google.android.inputmethod.latin_18.6.3.1002251336-release-arm64-v8a-176071766` (minAPI26, nodpi) | `2b1c28cf650894ead8a95224ac15fce246e61cd54d11e2149c2a13fc24b30d84` |
| `com.google.android.inputmethod.latin_18.6.3.1002251336-release-armeabi-v7a-176071765` (minAPI26, nodpi) | `8a27c09f0ae9a9f0224781b2d1eb1117031eac14adb1be8a615aa4840cd5a0e1` |

Both builds install as `versionName 18.6.3.1002251336-release-<abi>`; the release APKs share one
DEX obfuscation map. Only the native payload differs per ABI, so every bytecode binding (and the
bundled OCR engine) has to be validated per APK, not inferred.

## 2. Patch parity: 26 of 26 on both ABIs

Command (same arguments, only the input APK differs):

```bash
java -jar .tools/morphe-desktop-1.19.1-all.jar patch \
  -p patches/build/libs/patches-1.88.0.mpp --exclusive --validate --bytecode-mode FULL -f \
  -o build/validation-gboard/gboard-<abi>-patched.apk -r build/validation-gboard/<abi>-report.json \
  -e "Change package name" -e "Custom branding" -e "Parakeet personal dictionary" \
  -e "Parakeet voice typing" -e "Rambler contact names" -e "Rambler personal dictionary" \
  -e "Rambler app context" -e "Rambler custom instructions" -e "Rambler cursor-aware editing" \
  -e "Rambler stop after silence" -e "Rambler voice typing" -e "Add Gboard Signature Bypass" \
  -e "Rounded Keyboard Panel" -e "Key Shape Selection" -e "Custom Theme" \
  -e "G Logo on Spacebar" -e "Frosted Glass" -e "Enable OCR / Scan Text" \
  -e "AI Writing Tools" -e "Clipboard Enhancements" -e "Toolbar Editing Buttons" \
  -e "Incognito Mode Toggle" -e "Web Clipboard" -e "Cursor trackpad mode" \
  -e "Simple Calculator" -e "AMOLED dark keyboard" <apk>
```

`AMOLED dark keyboard` is declared against the experimental Gboard target, so `-f` is required to
list and apply it; every other argument is the production selection.

| Check | arm64-v8a (176071766) | armeabi-v7a (176071765) |
| --- | --- | --- |
| Patch report `success` | `true` | `true` |
| `failedPatches` | `[]` | `[]` |
| Applied top-level patches | 26 | 26 |
| Classes made mutable | 67 of 28 768 | 67 of 28 768 |
| Bytecode mode | FULL, `--validate` | FULL, `--validate` |
| Output signed | Morphe key, OK | Morphe key, OK |

Because every patch resolves its target with an exact descriptor and asserts the stock shape
(access flags, register counts, structural fingerprints) before mutating, the identical
67-class result on both builds is the parity evidence: the 18.6.3 obfuscation map is shared, and
no binding silently falls back.

This also closes the AMOLED note in
[2026-11-14-gboard-amoled-dynamic-dark.md](2026-11-14-gboard-amoled-dynamic-dark.md) §5, which
recorded the armeabi-v7a palette as *assumed*: `AMOLED dark keyboard` now applies on the v7a
release too.

## 3. Why a Custom Theme import failed

The toast is ours, not Gboard's: `gboard_patches_custom_theme_failed_toast` in
`extensions/gboard-patches/src/main/settings-text/gboard_settings_text.xml`
(`The theme could not be verified or installed.`) is raised by
`GboardCustomThemeGalleryView.apply()` when `GboardCustomThemeInstaller.install()` throws, which is
exactly the Rboard-pack gallery the owner used ("3D Theme Pack", "Amogus").

The throw came from the validator step:

```
GboardCustomThemeInstaller.importArchiveWithOwnership
  -> inspect(staging)                                  # archive rules, passed
  -> validateWithGboard(context, staging)              # reflection into Gboard
     -> GboardCustomThemeTargetContract.validateThemeArchive
        -> Class.forName(GboardCustomThemeVersionBindings.VALIDATOR_CLASS)
```

`GboardCustomThemeVersionBindings` is generated at build time from
`patches/src/main/resources/gboard/gboard-version-bindings.json`. That file is the vendored
**18.5.11** profile (its `target_version`), so the extension still shipped 18.5.11 class names:

| Binding | Shipped (18.5.11) | 18.6.3 target |
| --- | --- | --- |
| validator | `Lrzb;->h(File)Z` | `Lrhw;->h(File)Z` |
| plus handler | `Lksz;->f(Lkst;Lktc;I)V` | `Lkbl;->f(Lkbf;Lkbo;I)V` |
| activity-result handler | `ThemeListingFragment;->X(IILIntent;)V` | `ThemeListingFragment;->W(IILIntent;)V` |
| peer class/fields | `Lkst;` `b`, `s` | `Lkbf;` `b`, `t` |
| peer result | `Lkst;->i(LIntent;)V` | `Lkbf;->j(LIntent;)V` |
| launcher | `Lsgz;->H(LIntent;ILBundle;)V` | `Lquw;->E(LIntent;ILBundle;)V` |

The patched bytecode used the 18.6.3 names
(`GboardVersionBindings.customThemeValidator` = `Lrhw;->h(Ljava/io/File;)Z`), so the two halves of
one feature disagreed. The 18.5.11 names still *exist* in 18.6.3 but are unrelated classes —
`kst` is a protobuf message (`extends aaej`), `rzb`/`sgz` are other shrunk classes — so the
reflection either misses the member or reads the wrong one, the installer treats the archive as
rejected and the gallery shows the toast. The gallery path also covers the same reflection via
`GboardCustomThemeInstaller`, which is why the user-visible result is "not verified".

## 4. Fix

- New `patches/src/main/resources/gboard/gboard-custom-theme-bindings.json`: the eight
  Custom Theme bindings at their 18.6.3 values (`target_version 18.6.3`). The vendored 18.5.11
  profile is left intact as the upstream reference.
- `extensions/gboard-patches/build.gradle.kts`: the bindings generator now reads the 18.6.3
  profile, with a comment naming the drift this prevents.
- `patches/src/test/kotlin/patches/gboard/CustomThemeBindingsTest.kt`: asserts the profile
  matches `GboardVersionBindings` (both halves of the feature), and, when `GBOARD_ORIGINAL_APK`
  is set, that every declared class/method/field exists in the APK with the declared shape.
- `patches/build.gradle.kts`: `testImplementation(libs.gson)` for that test.

## 5. Verification

- `./gradlew :patches:build` (tests included) passes; `CustomThemeBindingsTest` reports
  3 tests, 0 failures, with `GBOARD_ORIGINAL_APK` pointed at the arm64 release base APK.
- Generated `GboardCustomThemeVersionBindings` now reads `PLUS_CLASS kbl`, `PEER_CLASS kbf`,
  `LAUNCHER_CLASS quw`, `VALIDATOR_CLASS rhw`, `TARGET_VERSION 18.6.3`.
- Re-patched both release APKs with the rebuilt bundle: 26/26 again on both ABIs, and
  `jadx` of `GboardCustomThemeTargetContract` in the **patched** arm64 APK shows
  `Class.forName("kbl")`, `"kbf"`, `"quw"`, `"rhw"` — the shipped artifact carries the corrected
  contract.
- Owner confirmation: the Rboard theme import now succeeds (2026-11-15).

## 6. Limits

- Parity above is patch *application* parity (contracts, fingerprints, rebuilt DEX, signing),
  not a per-feature functional test on both ABIs. Features that run native payloads (OCR engine,
  Parakeet/Rambler) still differ per ABI by construction.
- Theme import was verified statically end to end (profile → generated class → patched APK);
  the gallery's download/apply path was not re-run to completion on a device in this session.
  A failed apply remains silent in logcat because the gallery catch is UI-only.

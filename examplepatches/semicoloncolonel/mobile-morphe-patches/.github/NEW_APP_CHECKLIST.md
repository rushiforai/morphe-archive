# New app checklist

Run this audit before a new app, or a new version of an app, goes to `dev`. It makes sure that the install instructions in [Supported apps](../docs/apps.md) and the [FAQ](../docs/faq.md) work for this app, and that the listed version is one people can get.

Record the answers in the pull request or commit message. Push only when the whole list passes, and only as part of a batch that is ready to release.

## 1. Version

- [ ] The target in `shared/Constants.kt` has the version name and the version code of the build that was tested. Read both from the APK with `aapt2 dump badging`, not from the store page.
- [ ] The version is the one Google Play serves to phones outside any beta program. The maintainer's Play account is in some betas, so check a version from Play against the public release before it becomes the main target.
- [ ] Older targets stay in the list. A new version is added as a new target.

## 2. How the app is delivered

- [ ] Install the app from Google Play and run `adb shell pm path <package>`. Note whether it arrives as one APK or as a base APK with splits.
- [ ] If there are splits, find which split holds the native libraries (`lib/<abi>/*.so`). An app whose native libraries are only in a split crashes at launch when it is patched from `base.apk` alone.
- [ ] Set `apkFileType` to match: `APKM` for a split app, `APK` for a single APK.
- [ ] If the native libraries are only in a split, add a patch dependency that refuses an input without them and says which sources work, as the Netflix and Koupon patches do.

## 3. Every source the docs offer

Test each source that the docs tell people to use. A source that does not work must either be refused by the patches with a clear message or be listed in [Known issues](../docs/known-issues.md).

- [ ] **Google Play, "Use installed app".** Patch the Play Store copy on the phone with Morphe Manager, using a bundle built from the commit that will be pushed. The patched app installs, opens, and signs in.
- [ ] **APKMirror `.apkm`.** Check that APKMirror has this version, that it is the phone build and not the Android TV build, and that the version code matches. Patch it with the Morphe CLI, install it, and open it.
- [ ] **A single `.apk`.** For a split app, patch `base.apk` alone and confirm that the patches refuse it.
- [ ] **Version not on APKMirror.** If APKMirror does not have the version, say in [Supported apps](../docs/apps.md) that the app comes from Google Play.

## 4. What can break a re-signed copy

- [ ] The re-signed, unpatched app opens and loads its content.
- [ ] Sign-in works with each method the app offers. If Google sign-in fails on a re-signed copy, add GmsCore support, off by default, and test it with the throwaway Google account.
- [ ] The first run of a new account works, from sign-up through any welcome or onboarding screens. Patches that hide screens can leave a new account on an empty screen.
- [ ] Note any over-the-air update system (CodePush, Expo updates). Patches that edit the JavaScript bundle must turn it off.
- [ ] Note any Play Integrity, Pairip, or signature check, and what it blocks.

## 5. The patch run

- [ ] Build the bundle from a clean working tree.
- [ ] Patch the real app with the Morphe CLI, using every patch that is on by default and every patch that is off by default, and install it.
- [ ] Check each patch on the phone, not only that it applied.
- [ ] Check that `extensions/proguard-rules.pro` keeps every extension method that injected code calls.

## 6. Documentation

- [ ] The app has a row in [Supported apps](../docs/apps.md) with its patches, the tested version, and the date. Patches not checked on a phone are marked experimental.
- [ ] If the app needs a particular source, or cannot use one, the row or [Known issues](../docs/known-issues.md) says so.
- [ ] The app is in the three issue forms, and the README counts are updated.
- [ ] `python3 .github/scripts/check_issue_forms.py` and `python3 .github/scripts/build_tv_repo.py --check` pass.

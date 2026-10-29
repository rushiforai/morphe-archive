# Buienalarm investigation

Investigation date: 2026-10-26. Shipped-artifact inspection used the leanrea workflow: identify/archive inventory first, copy input to a temporary extraction, then inspect resources and smali with apktool. No installed jadx was required.

## Reference collections

All seven original top-level patch repositories were inventoried. Counts below are source-file counts and distinct literal `packageName` compatibility declarations, not release patch counts. Shared patches and multiple patches per package make those different measures.

| Directory | Revision | Kotlin files under patches/src/main/kotlin | Explicit package names | Relevant structure |
| --- | --- | ---: | ---: | --- |
| buienradar-patches | 29f473b | 6 | 1 | Closest small example: separate ad and promotion patches; Fingerprint and Compatibility APIs. Buienradar is a different app/package. |
| devanced | 4f08e46 | 161 | 25 | Multi-app bytecode/resource patches, fingerprints and extension/stub modules. |
| doom | 36e5420 | 533 | 227 | Broad multi-app collection, generated patch inventory and extension support. |
| heval | 55b8cf0 | 322 | 73 | Multi-app patches, shared controls and app-specific extension modules. |
| hoodles | e9c9426 | 190 | 57 | Multi-app patches, shared libraries, stubs and native-format helpers. |
| piko | a0ed9a5 | 288 | 2 | Twitter/X and Instagram patches; substantial shared resource and extension tooling. |
| tv-patches | a963307 | 78 | 17 | Android TV ad-removal patches, app-specific extensions and runtime capture runbooks. |

Every collection uses the `app.morphe.patches` Gradle plugin and Kotlin patch sources. No source match for `buienalarm` or `org.yoki` was found in their patch Kotlin files. The pre-existing `piko/gradlew.bat` modification was left untouched. No changes were made to these reference repositories or to the separately cloned official template.

The implementation lives in the user's repository `johnneerdael/buienalarm-patches`, cloned on `dev` from the official template. Its template examples were replaced by the two real patches. The upstream LICENSE, NOTICE and semantic-release workflows are retained.

## APK identity — seen

| Property | Value |
| --- | --- |
| Input | `/Users/jneerdael/Scripts/morphe/buienalarm.apk` |
| Package | `org.yoki.android.buienalarm` |
| Version | `4.32.0` |
| Version code | `3723` |
| Minimum / target SDK | `26` / `36` |
| SHA-256 | `6ffea33fe307c5822a5d6f5ad59b44ab6affd575f470d50a13f9fb180bd16e6e` |
| Original signing certificate SHA-256 | `d7e009b89d18f11ac9cdc58b1027e14772de9b429a6f2520cd6459c6b9413ceb` |

The sibling XAPK contains the same app version's base APK plus ARM64 and density splits. The supplied standalone APK was used for all patch checks. Neither input was modified.

## Patch points — seen

The temporary original extraction is under `$TMPDIR/re/buienalarm-20261026/decoded`. Paths below are relative to that extraction; these are decompiled artifact locations, not original developer source names.

- `smali_classes2/com/meteoplaza/android/mpbannerview/MPBannerOptions.smali:242`: `access$getEnabled$cp()Z` returns the SDK's global banner-enable field, initially true. The patch makes this query return false immediately, covering fragment creation before activity `onResume`.
- `smali_classes2/com/meteoplaza/android/mpbannerview/MPBannerFragment.smali:180`: method `A(MPBannerOptions)` checks that getter and returns before ad construction when disabled. This controls the PubMatic OpenWrap path (`POBBannerView.loadAd`, line 446) and the alternative Google banner path. Its `onResume` also checks the getter (line 1082).
- `smali/com/meteoplaza/android/mpbannerview/b.smali`: the SDK's disable implementation clears the flag and hides existing banner fragments. The enable implementation resumes/reveals them.
- `smali_classes2/org/yoki/android/buienalarm/activity/MainActivity.smali:2246`: `onResume` tests a subscription-derived local boolean, calls `disableBanners` and uses wrap-content height when true; otherwise it enables banners and reserves 100dp. The patch forces only that local decision.
- `smali_classes2/mn8.smali:108`: the weather fragment's `onResume` has a second local ad decision. Its disabled branch calls `disableBanners` and returns; its other branch starts ad setup. The patch also forces this local decision, deriving its class and register rather than hardcoding `mn8`.
- Other banner users, including the daily forecast path through `on8`/`gb7`, reach `MPBannerFragment` and therefore the same global getter. A separate review checked this call path.
- `res/layout/activity_main.xml`: banner container `@id/banner_fragment`. `res/layout/fragment_weather.xml`: container `@id/banner1`. Hide ads sets visibility to gone and height to zero while retaining both binding targets.
- `res/xml/preferences_general.xml:4`: the Premium card is the preference with key `preference_subscription`, layout `subscription_preference` and an intent to `SubscriptionActivity`.
- `smali_classes2/du4.smali:808`: Settings setup finds that preference and writes its title/summary without a null check. Deleting the preference would break this path. The patch instead sets `app:isPreferenceVisible=false`, using the app's existing AndroidX preference attribute.

The code fingerprints require exactly two matching ad-decision methods and verify the boolean-result/branch structure before changing it. Resource selectors require exactly one matching element. Unexpected versions or changed structures fail rather than guessing.

## Build and repository setup — seen

- JDK 21.0.11 and Gradle 9.6.1 were used. The wrapper checksum is pinned.
- The supplied template's `dev` branch uses patches Gradle plugin `2.1.0-dev.1` and patcher `2.0.1`; those versions were retained.
- The official `buildAndroid` task succeeded with a local PAT limited to `read:packages`. The token is passed through the build process environment and is never written into project configuration or logs. `.pat` is Git-ignored.
- The bundle includes JVM classes and Android DEX. No runtime extension is needed by these patches; unused template extension examples were removed.
- The GitHub repository has both `main` and `dev`. Its Actions workflow permission API reports `can_approve_pull_request_reviews=true`; release and PR workflows declare their own task-specific write permissions.
- Project group, bundle name/about metadata, README and issue links point to `johnneerdael/buienalarm-patches`. The implementation was subsequently committed and pushed at the user's request. Publication uses the retained semantic-release workflow; see `PUBLISHING.md` for verified release and source-index behavior.

## Verification

`python3 scripts/validate.py ../buienalarm.apk` checks an unpatched baseline and three independently selected outputs. Each run uses the actual Morphe Desktop 1.19.1 patcher with `--validate --bytecode-mode FULL` and checks the JSON result, APK signature, rebuilt XML and emitted DEX. The verifier failed against the original APK when patched effects were requested, before implementation.

| Selection | Expected ad checks | Expected Settings check |
| --- | --- | --- |
| Original | Original getter/branches/containers | Card remains visible |
| Hide ads | Getter returns false; both branches forced; both containers hidden | Card remains visible |
| Hide Premium banner | Original ad code/containers | Card hidden; object retained; all DEX bytes identical to input |
| Both | All ad effects | Card hidden; object retained |

All four decoded cases passed; all three patch reports had success=true, exactly the requested applied patch names, and no failed patches. The final source review had no remaining actionable findings. The retained release README generator was also exercised successfully on a temporary README copy.

The APKs are signed with the local Morphe key; `apksigner verify` verifies their APK Signature Scheme v2 signatures. Static checks establish the requested changes in the outputs, not universal runtime behavior.

## Runtime validation boundary

A disposable Android 14 ARM64 emulator was created under the temporary investigation directory because the existing phone AVD's system image was missing. The combined patched APK installed and launched successfully into onboarding. The connected physical Android TV was not used.

Settings was opened directly using the disposable emulator's root ADB test access. With only Hide ads selected, the UI contained “Buienalarm Premium” and “Remove ads”. Installing the combined output over it and reopening Settings removed both card texts while retaining General settings, version information and the other preferences. Screenshots and UI hierarchies are saved as `build/validation/runtime/settings-ads-only.{png,xml}` and `settings-both.{png,xml}`. The final official-build APK was used for this comparison. No AndroidRuntime fatal exception was logged during these checks.

The AOSP image lacks Google Play services. Its warnings can be dismissed, but this is not a full end-to-end weather run. The main activity launched; full forecast behavior and live network suppression remain unverified. No claim of live ad-network suppression follows solely from static inspection. Account purchases, subscriptions, push delivery, widgets, all locales and every Android version are outside the runtime checks.

## Development references

- [Prerequisites](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/0_prerequisites.md): JDK 21+, Gradle/Git and IDE guidance.
- [Setup lifecycle](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md): buildAndroid, Desktop application and GitHub Packages authentication.
- The checked-out official template and current plugin source were used for exact APIs and packaging behavior where older documentation might differ.

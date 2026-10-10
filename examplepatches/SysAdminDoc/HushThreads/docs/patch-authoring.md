# HushThreads patch authoring guide

Updated 2026-10-09

This guide is for tracing and changing Threads behavior in HushThreads. Start from the stock fixture that matches the target version. The app's own code is obfuscated, changes between releases, and is not included in this repository.

## Project layout

| Location | Purpose |
|---|---|
| patches/src/main/kotlin/app/morphe/patches/threads | Kotlin Morphe patches that inspect and edit Threads DEX or the manifest |
| patches/src/test/kotlin/app/morphe/patches/threads | Patch shape, data-flow, and fixture tests |
| extensions/threads/src/main/java/app/morphe/extension/hushthreads | Java code injected into the patched app at runtime |
| extensions/shared/library | Runtime support shared with other Hush bundles |
| patches-list.json | Generated patch metadata consumed by the bundle |
| fixtures/ | Local, ignored Threads XAPK and extracted APK fixtures |
| scripts/fingerprint-candidates.ps1 | Captures a method signature and ranks possible counterparts in another app build |
| scripts/verify-all-patches.ps1 | Applies the bundle to an APK or XAPK and checks its output |
| scripts/verify-injected-registers.ps1 | Checks DEX register, branch, and contract invariants |

The checked-in compatibility declarations are in [AppCompatibilities.kt](../patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt). Patch names and descriptions come from patch metadata. Generate patches-list.json after metadata changes instead of editing it by hand.

## Patch inventory

| Feature | Patch source | Primary fixture test |
|---|---|---|
| Block background-return feed refresh | [BlockReturnRefreshPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/feed/refresh/BlockReturnRefreshPatch.kt) | [ReturnRefreshFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/feed/refresh/ReturnRefreshFixtureTest.kt) |
| Change version code | [ChangeVersionCodePatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/versioncode/ChangeVersionCodePatch.kt), [VersionCodeReads.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/versioncode/VersionCodeReads.kt) | [ChangeVersionCodeFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/versioncode/ChangeVersionCodeFixtureTest.kt) |
| Disable analytics | [DisableAnalyticsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/analytics/DisableAnalyticsPatch.kt) | [DisableAnalyticsFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/analytics/DisableAnalyticsFixtureTest.kt) |
| Disable screenshot detection | [DisableScreenshotDetectionPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/screenshot/DisableScreenshotDetectionPatch.kt) | [DisableScreenshotDetectionFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/screenshot/DisableScreenshotDetectionFixtureTest.kt) |
| Disable video autoplay | [DisableVideoAutoplayPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/feed/autoplay/DisableVideoAutoplayPatch.kt) | [DisableVideoAutoplayFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/feed/autoplay/DisableVideoAutoplayFixtureTest.kt) |
| Hide ads | [HideAdsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/ads/HideAdsPatch.kt), [FeedPageFilterPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/ads/FeedPageFilterPatch.kt) | [HideAdsFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/ads/HideAdsFixtureTest.kt) |
| Hide suggested users | [HideSuggestedUsersPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/ads/HideSuggestedUsersPatch.kt), [ProfileSuggestedUsers.kt](../patches/src/main/kotlin/app/morphe/patches/threads/ads/ProfileSuggestedUsers.kt) | [HideSuggestedUsersFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/ads/HideSuggestedUsersFixtureTest.kt), [ProfileSuggestionsFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/ads/ProfileSuggestionsFixtureTest.kt) |
| Hide the Instagram button | [HideInstagramButtonPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/profile/HideInstagramButtonPatch.kt) | [HideInstagramButtonFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/profile/HideInstagramButtonFixtureTest.kt) |
| HushThreads settings | [ThreadsExtensionPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/extension/ThreadsExtensionPatch.kt), [SettingsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/settings/SettingsPatch.kt), [ShortcutCalls.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/settings/ShortcutCalls.kt), [ThreadsSettingsRow.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/settings/ThreadsSettingsRow.kt) | [ShortcutCallsTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/settings/ShortcutCallsTest.kt), [ThreadsSettingsRowFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/settings/ThreadsSettingsRowFixtureTest.kt), [SafeModeCrashWipeFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/settings/SafeModeCrashWipeFixtureTest.kt) |
| Max image quality | [MaxImageQualityPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/feed/imagequality/MaxImageQualityPatch.kt) | [MaxImageQualityFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/feed/imagequality/MaxImageQualityFixtureTest.kt) |
| Open links in browser | [OpenLinksExternallyPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/externalbrowser/OpenLinksExternallyPatch.kt) | [OpenLinksExternallyFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/externalbrowser/OpenLinksExternallyFixtureTest.kt) |
| Pure black dark mode | [PureBlackPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/theme/PureBlackPatch.kt) | [PureBlackFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/theme/PureBlackFixtureTest.kt) |
| Remove share targets | [RemoveShareTargetsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/sharetargets/RemoveShareTargetsPatch.kt) | [RemoveShareTargetsFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/sharetargets/RemoveShareTargetsFixtureTest.kt) |
| Remove the advertising ID | [RemoveAdIdPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/adid/RemoveAdIdPatch.kt) | No patch-specific fixture test was found under patches/src/test when this guide was written |
| Restore screens on re-signed builds | [RestoreTrustPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/resignedtrust/RestoreTrustPatch.kt), [Fingerprints.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/resignedtrust/Fingerprints.kt) | [RestoreTrustFbnsFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/resignedtrust/RestoreTrustFbnsFixtureTest.kt), [RestoreTrustShapesTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/resignedtrust/RestoreTrustShapesTest.kt) |
| Sanitize sharing links | [SanitizeSharingLinksPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/sharelinks/SanitizeSharingLinksPatch.kt) | [SanitizeSharingLinksFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/sharelinks/SanitizeSharingLinksFixtureTest.kt) |
| Save photos and videos | [SaveMediaPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/download/SaveMediaPatch.kt), [MediaBridges.kt](../patches/src/main/kotlin/app/morphe/patches/threads/download/MediaBridges.kt) | [SaveMediaFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/download/SaveMediaFixtureTest.kt) |
| Trust user-added certificates | [TrustUserCertificatesPatch.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/usercertificates/TrustUserCertificatesPatch.kt) | [TrustUserCertificatesFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/misc/usercertificates/TrustUserCertificatesFixtureTest.kt) |

## Workflow for a new or changed patch

1. Check the issue tracker, README patch list, current patch source, fixture tests, and recent commits. Confirm that the behavior is not already covered.
2. Choose the exact upstream build first. Check its package name, version, version code, ABI, density splits, min SDK, and signer against AppCompatibilities.kt and the local XAPK manifest.
3. Reproduce the behavior on an unmodified build. Record the affected screen, user action, expected result, and a screenshot or UI hierarchy when that evidence helps. Use a fresh emulator profile for stock behavior.
4. Trace the behavior in the target DEX. Start with readable strings, model types, call sites, fields, manifest filters, or known app components. Use JADX for focused decompilation and the checked-in fingerprint candidate script to compare builds. Recheck the bytecode around the final patch anchor.
5. Build a semantic anchor from more than one signal where possible. Require the expected number of matches. If a required target is missing or ambiguous, fail with a message that identifies what changed instead of patching the first candidate. A patch designed for partial coverage must report exactly which independent targets matched, as described below.
6. Follow values to their actual writes. Use the flow-sensitive helpers in ReachingWrites.kt when a register, literal, parameter, or default argument can be set on multiple paths.
7. Make the smallest DEX or manifest edit that changes the behavior. Preserve branch labels and try ranges. Use the register and control-flow helpers already used by the patches. Do not rely on an obfuscated class name as the only anchor.
8. Add a fixture test against every declared target build. Assert the selected target count, the inserted or changed instruction shape, register kinds, branch flow, and unrelated code or manifest state where relevant.
9. Regenerate the patch list, rebuild the Android patch bundle, run patch and runtime tests, lint the extension libraries, then run verify-all-patches.ps1 against each retained XAPK. Inspect appliedPatches in each result JSON. The desktop CLI can exit successfully while silently skipping a new patch when the local .mpp is stale.
10. Exercise the user-visible feature on a clean patched install. Compare it with the stock flow, check the off and on states when there is a setting, and capture screenshots for a UI change.
11. Update AppCompatibilities.kt, fixture declarations, README, CHANGELOG, the [source ledger](../sources/threads-sources.json), and release receipt inputs when the target build or patch metadata changes.

### Registering a feature

A new runtime feature needs both its patch and its settings registration. Follow a nearby feature through these files:

- Add its status method to [SettingsStatus.java](../extensions/threads/src/main/java/app/morphe/extension/hushthreads/settings/SettingsStatus.java), with an unpatched result of false. Depend on the Threads extension patch so that class is present. Use `requireStatusMethod()` before changing bytecode and `enableStatus()` after the hooks are installed. Both helpers are in [ExtensionSupport.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/extension/ExtensionSupport.kt).
- Register the display name in [FamilyNames.java](../extensions/threads/src/main/java/app/morphe/extension/hushthreads/settings/FamilyNames.java) and the feature in [PatchFamily.java](../extensions/threads/src/main/java/app/morphe/extension/hushthreads/settings/PatchFamily.java). Its status-method name must match the patch. Declare its switches and any changes that remain while Pause is on so the settings screen and diagnostic report agree.
- Put runtime settings and their defaults in [Settings.java](../extensions/threads/src/main/java/app/morphe/extension/hushthreads/settings/Settings.java), then add the row on the appropriate settings page. Use `L10n` for visible text. Check the feature with its switch off, on, and while paused.
- Choose patch selection and runtime defaults separately. [DefaultSelectionPolicyTest.kt](../patches/src/test/kotlin/app/morphe/DefaultSelectionPolicyTest.kt) requires a reason for any patch left out of Manager's default selection. Keep that list and `PatchFamily.OPT_IN` consistent with the generated catalog. The current exceptions are Change version code, Remove share targets, and Trust user-added certificates.

Keep the README patch table's names and descriptions identical to the generated catalog. A switch description should tell people its page, row title, and starting state. [ReadmePatchNamesTest.kt](../patches/src/test/kotlin/app/morphe/ReadmePatchNamesTest.kt) checks the table against the catalog, and [PatchCategoriesTest.kt](../patches/src/test/kotlin/app/morphe/PatchCategoriesTest.kt) limits a category to 15 entries.

### Partial target coverage

Some patches deliberately support independent targets that can be absent in a particular build. [PartialTargets.kt](../patches/src/main/kotlin/app/morphe/patches/threads/misc/extension/PartialTargets.kt) provides `handleTargets()`: a handler returns null on success or a reason when its target is absent. The helper warns for each missing target and fails when none match. This does not permit choosing an ambiguous target.

Disable analytics uses that contract for its PIGEON, DEFAULT, and MQTT address families. It writes the matched mask to `SettingsStatus.analyticsAddressMask()` and logs the matched and missing families. Review that coverage as well as the applied-patch list. A patch being present does not mean every supported hook matched.

### Comparing app builds

Use the checked-in candidate finder when a known method moves:

    ./scripts/fingerprint-candidates.ps1 -OldApk '<old bundle>' -Method '<method descriptor>' -NewApk '<new bundle>'

The script accepts APK, APKM, or XAPK inputs. Candidate ranking suggests methods to inspect and does not change an anchor. Confirm the method's callers, data flow, and guards before updating the patch. `verify-all-patches.ps1 -Force` can explore an undeclared build, but compatibility checks must pass without `-Force` before support is declared.

## Threads 450 lessons

- Redex renames and moves code between releases. Use semantic relationships, not hard-coded LX/...; names by themselves.
- The autoplay flag is the fourth boolean in the observed 450 call path. The default-argument function can write const/16 #1 into the destination register, so trace reaching writes through the call.
- Compose can tail-merge adjacent menu rows. For Save media, hook the Copy link row path with its own arguments. Do not hook after the shared row call, or the hook can fire for both actions.
- Compose labels stay on original instructions when code is inserted. Keep branches aimed at the original instruction and put new control flow around it.
- The pure-black theme value can move from the lambda into a static helper. Follow the helper call before choosing a literal anchor.
- The :fbns push process has its own signature read. A fix in the main process does not fix the push process.
- The app's share links use /share/ with an xmt token. Resolve the URL from the current build and preserve the per-share destination.
- Runtime app strings can be pooled or delivered dynamically. Use the extension L10n path for injected labels rather than assuming Android resources are the source of truth.
- Threads reads its original version code in multiple places. Change the Android-visible manifest value without redirecting the app's own startup and scheduler integrity reads.

## Ads and privacy patch boundaries

- `FeedPageFilterPatch.kt` is the shared point before `BarcelonaFeedCache` merges a fetched page. `HideAdsPatch.kt` uses both Threads' `Media` ad predicate and the page item's unit type. The extension recognizes seven ad-related unit names: `AD`, `AD4AD`, `INTENT_AWARE_AD_PIVOT`, `STAND_ALONE_MULTI_AD_PIVOT`, `ADS_FEEDBACK_INTERFACE`, `ADS_FEEDBACK_INTERFACE_INTERESTS_PICKER`, and `ADS_FEEDBACK_INTERFACE_REPETITION`. The patch fingerprint requires a subset to identify the enum. [HideAdsFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/threads/ads/HideAdsFixtureTest.kt) checks that both additional feedback names exist in the retained fixtures. Keep the normal `THREAD` and suggestion paths intact.
- `HideSuggestedUsersPatch.kt` handles the typed `suggested_users` and kickstart slots. It validates the raw server type before filtering. Do not collapse that patch into the paid-ad predicate just because the entries share a feed page.
- `DisableAnalyticsPatch.kt` rewrites three address families: Pigeon, default `logging_client_events`, and the MQTT settings object's `analytics_endpoint`. Build 450 also accepts `extra_analytics_endpoint` and `extra_fbns_analytics_endpoint` in its MQTT configuration-change flow, then reconstructs the settings object. The constructor hook should see those values, but keep this route in fixture and runtime regression coverage when the settings shape changes. This patch is not a network-wide tracker blocker.
- The static scan also found `ad_tracking_token` and ad-interaction signal classes. Their upload path is not yet known. `Disable analytics` does not directly change those fields, so don't call it an ad-measurement opt-out until a live trace proves coverage.
- `RemoveAdIdPatch.kt` removes the manifest permission. It leaves Google's AdvertisingIdClient call sites in the DEX. For a target SDK of 33 or later, Android returns zeroes when the permission is absent. Describe this as removing the Google advertising ID only. Account, session, analytics, and other app or device identifiers are separate.
- The app-reference page records the static evidence and its limits. Update it when a new supported build changes the ad enum, feed boundary, analytics routes, identifiers, or permission declarations. Keep server-side delivery claims separate from what a client-side filter proves.

For runtime checks, [FeedAds.java](../extensions/threads/src/main/java/app/morphe/extension/hushthreads/ads/FeedAds.java) records completed page and item checks separately from removals for each enabled rule. A nonempty page with no matches still counts as checked. Disabled, paused, and failed checks do not increment those completed-check counters. If checking an item throws, the filter returns the whole original page. Record the counters and failures alongside the visible feed. Zero removals alone prove neither that ads were absent from delivery nor that removal works.

## Build and verification

Use the toolchain and environment variables documented in [README.md](../README.md#building-and-checking). The normal patch sequence is:

    ./gradlew.bat :patches:generatePatchesList
    ./gradlew.bat :patches:buildAndroid
    ./gradlew.bat :patches:test :extensions:threads:testDebugUnitTest
    ./gradlew.bat :extensions:threads:lintRelease :extensions:shared:library:lintRelease
    ./scripts/verify-all-patches.ps1 -Apk <Threads XAPK> -DesktopJar <Morphe desktop JAR> -WorkDir <scratch folder>

Keep fixture binaries and verification output out of tracked files. The local fixture directory is ignored. When HUSHTHREADS_FIXTURE_DIR is unset, the real-build fixture tests skip, so check the test summary rather than treating a green task name as proof that the APK fixtures ran. Those tests run in their own task, `:patches:fixtureTest`, which `:patches:test` runs first. A new fixture test has to call `Fixtures` or `FixtureDex` in its own source, since that's how the task picks its classes. One that reaches them some other way lands in `:patches:test`, which runs without the fixture folder.

The distributable bundle, SHA-256, and CycloneDX SBOM are written to `patches/build/release`. Tests can rebuild the intermediate jar under `patches/build/libs`, so use the release directory's bundle for verification and distribution.

The verifier checks the CLI exit status, result report, expected patch names, package version, and saved APK. It also checks approved manifest changes, stock resource preservation, native packaging alignment, injected DEX structure and feature contracts, and bundle identity. Keep its result and diagnostic reports together. A result JSON can exist after a failed compile, and the desktop CLI can skip a patch absent from a stale bundle. The wrapper checks those conditions, so use its final result as well as reviewing `appliedPatches` and coverage warnings. Static native checks do not establish runtime support on a device with 16 KB memory pages.

For a new app build, add its exact fixture before declaring compatibility. Update AppCompatibilities.kt and its compatibility fixture test, the source ledger, and every build-aware patch test. Run the full selected-patch verifier against all declared builds without `-Force` and confirm it applied each patch. Update the user-facing supported-build table and changelog after the fixture checks pass.

Cut a release with the five stages of `scripts/release/release.ps1`, in order: `-Stage prepare`, `preflight`, `build`, `publish` and `index`, each with `-Version <version>`. The build stage writes the receipt with scripts/build-release-receipt.ps1 from one kept fixture run per declared build, and the index stage holds the published bundle to scripts/validate-release-facts.ps1. The README's [building and checking steps](../README.md#building-and-checking) say what each stage does and what it needs. Keep the patch source license and provenance headers intact when adopting code.

## References

- [Threads app reference](threads-app-reference.md)
- [README build and checking steps](../README.md#building-and-checking)
- [Morphe patch compatibility declarations](../patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt)
- [Android split APK format](https://developer.android.com/guide/app-bundle/app-bundle-format)

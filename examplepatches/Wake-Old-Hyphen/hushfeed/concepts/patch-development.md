# App and patch development map

This guide maps the TikTok app Hushfeed modifies to the code and release checks that make a patch. It was checked against Hushfeed source 0.70.0 on 2026-10-09. The generated [patch catalog](../patches-list.json) is the current source of truth for patch names and compatibility.

## What Hushfeed ships

Hushfeed is a Morphe patch bundle, not a TikTok APK. Morphe Manager takes a TikTok APK chosen by the user, applies the selected patches, and signs the result with the user's existing key. The patch definitions and the runtime code they inject live in separate Gradle modules.

The source snapshot in this checkout says version 0.70.1 and contains 130 patch entries. The published source index, patches-bundle.json, still names 0.69.0. This is the release sequence described in CONTRIBUTING.md: publish and verify a bundle before changing the source index. Do not hand-edit the index to make the versions match.

## Target app and version boundary

| Property | Current patch target |
| --- | --- |
| App | Global TikTok |
| Package | com.zhiliaoapp.musically |
| Supported version | 47.1.4 |
| Version code | 2024701040 |
| APK signer SHA-256 | 9041803e91bcb814b4b4399fb5c85a91640b755e5e8ba76813814bf4cf2ab5ba |
| Extension minimum Android API | 23 |

Only the global TikTok package is declared. TikTok Lite and regional package variants are not patch targets.

The target identity is centralized in [AppCompatibilities.kt](../patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt). Patch definitions normally use that compatibility object instead of copying package names, signer hashes, or version codes into each patch. The README's [Supported target](../README.md#supported-target) section is the user-facing version record. Update both from the reviewed APK when the target moves.

On 2026-10-09, a clean factory APK was downloaded from [TikTok's official Android download page](https://www.tiktok.com/download). It was TikTok 38.3.3, package com.zhiliaoapp.musically, version code 2023803030, minSdk 21, targetSdk 34, and 429,047,484 bytes. Its SHA-256 was AB8D9394D87CA046BDA8F49031791CFAF75588A0830B5D54766E1BCF8CCDD6BC. apksigner verified its official signer, which matches the certificate recorded for the supported target.

That factory APK is useful for observing TikTok's unpatched onboarding and selected signed-in surfaces. It is not a patch fixture. Its version is far older than 47.1.4, so bytecode matches, resource IDs, and patch success on it say nothing about the supported target.

## Factory install observation

The factory APK was installed into a separate writable emulator data image. The emulator's original app data was left intact. Launch first showed an Android full-screen notice with a Got it button. After dismissing that system notice, TikTok showed:

- Sign up for TikTok
- Create a profile, follow other accounts, make your own videos, and more.
- Skip
- Use phone or email
- Continue with Facebook
- Continue with Google
- Already have an account? Log in

The initial sign-up screen offered Skip, phone or email, Facebook, Google, and Log in. A later launch led to TikTok's birthday gate, with a Birthday field, month, day, and year picker labels, a disabled Continue button, and a Sign up action. The picker initially showed October 9, 2025. The clean pass ended there. The account holder later completed onboarding and sign-in on the visible emulator, which reached the For You feed and settings. That pass showed one in-feed video ad with an Ad label and Shop now button. It also exposed TikTok's ad, privacy, contact-sync, and content preference controls. No preferences were changed and no account-specific values were recorded. The birthday-gate screenshot and detailed route, tracking, and patch analysis are in [the TikTok app audit](tiktok-app-audit.md). These factory-install UI observations are from 38.3.3, not evidence about the supported 47.1.4 build. The separately labeled physical-device report below covers the later modified 47.1.4 installation.

## Build and injection path

1. Kotlin patch declarations under patches/src/main/kotlin describe compatibility, dependencies, options, and changes to TikTok bytecode or resources.
2. Runtime hooks and settings under extensions are compiled as Morphe extension payloads.
3. The :patches:buildAndroid task packages the patch code and both extension payloads into patches-<version>.mpp.
4. PatchListGenerator loads the built bundle and writes patches-list.json. That JSON records patch descriptions, categories, dependencies, options, package compatibility, signer, and target versions for Manager.
5. BundleVerifier checks the bundle's version, DEX payloads, checksum, target description, and exact match with the generated patch catalog.
6. Fixture tests and the desktop patcher check that the selected patch set still applies to the declared TikTok APK.

The delivered bundle contains classes.dex, extensions/tiktok.mpe, and extensions/shared.mpe. It does not contain TikTok's APK. The app package name and certificate are checked separately from the patch bundle's source version.

## Gradle module map

| Module | Responsibility |
| --- | --- |
| :patches | Kotlin patch recipes, compatibility metadata, patch tests, patch-list generation, and the .mpp bundle |
| :patches:stub | Compile-time declarations for types supplied by the patcher or host app |
| :extensions:tiktok | TikTok-specific Java runtime hooks, settings, localization, and Robolectric tests |
| :extensions:tiktok:stub | Compile-time declarations for TikTok classes referenced by the extension |
| :extensions:shared | Shared runtime extension payload |
| :extensions:shared:library | Shared settings, utility, and diagnostic code used by extensions and tests |

The Morphe Gradle plugin and the default extension namespace are configured in settings.gradle.kts. The current plugin pin is 1.3.4. The version catalog pins patcher 1.15.1 and the README holds the Manager floor at 1.34.0. Keep those pins compatible because Manager refuses a bundle built for a newer patcher. The TikTok extension compiles for Java 11 with API 23 as its floor. The shared library compiles for Java 17, also with API 23 as its floor. Module build files declare which payload name each extension produces. The stub modules let source compile against host types; they are not a substitute for checking the real APK.

## Where to look first

| Work area | Source of truth |
| --- | --- |
| Supported TikTok package, signer, and version codes | patches/src/main/kotlin/app/morphe/patches/shared/compat/AppCompatibilities.kt |
| Patch declarations | patches/src/main/kotlin/app/morphe/patches/tiktok/ |
| Shared patch helpers and failure contracts | patches/src/main/kotlin/app/morphe/util/ and patches/src/main/kotlin/app/morphe/patches/tiktok/shared/ |
| Runtime extension hooks | extensions/tiktok/src/main/java/app/morphe/extension/tiktok/ |
| Shared runtime settings and utilities | extensions/shared/src/main and extensions/shared/library/src/main |
| In-app setting keys, types, defaults, and availability | extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/Settings.java |
| Settings screen entry hook | extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/TikTokActivityHook.java |
| Settings page rows and categories | extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/ |
| Patch tests | patches/src/test/kotlin/ and patches/src/test/resources/ |
| Runtime tests | extensions/tiktok/src/test/java/ |
| Generated patch metadata | patches-list.json |
| Build, fixture, device, and release helpers | scripts/ |

The runtime code is grouped by feature under extensions/tiktok/src/main/java/app/morphe/extension/tiktok/. Current package folders are blockauthor, captions, capture, cleardisplay, comment, commentsort, diagnostics, download, externalbrowser, favorites, featurecontrols, featuregatelab, feed, feedfilter, foldable, follow, font, ghostmode, inbox, interaction, live, misc, navigation, network, notinterested, offline, playback, popups, privacy, profile, publishdate, repost, search, seekbar, seen, settings, share, speed, spoof, telemetry, translation, upload, and wellbeing. Search the generated patch catalog by display name first, then follow its dependencies into the Kotlin and Java sources.

The current catalog's 130 patches are grouped as follows:

| Manager category | Patches |
| --- | ---: |
| Comments | 11 |
| Downloads | 5 |
| Feed | 20 |
| Inbox | 7 |
| Interaction | 17 |
| Interface | 7 |
| Performance | 10 |
| Playback | 20 |
| Privacy | 16 |
| Search | 4 |
| Settings | 13 |

The [patch catalog](../patches-list.json) has the complete names and plain-English descriptions. Keep the prose in that generated catalog aligned with the README's patch table and the in-app setting title. The build's documentation checks compare those sources.

## How the in-app settings connect

The settings patch is defined in patches/src/main/kotlin/app/morphe/patches/tiktok/misc/settings/SettingsPatch.kt. It hooks TikTok's AdPersonalizationActivity and calls TikTokActivityHook, which builds the extension's TikTokPreferenceFragment inside that activity. Preference category classes build the pages and rows.

The hook checks the launch intent. It accepts the Hushfeed settings extra or the `morphe_settings` action, then returns to TikTok's original path for other launches. An activity dump naming `AdPersonalizationActivity` can therefore describe Hushfeed settings rather than TikTok's ad controls. Record the intent and visible screen together. The physical-device pause check in the [runtime report](runtime-results-2026-10-09.md) used this reused activity with `morphe_settings`.

Settings.java declares runtime setting keys, types, defaults, and availability rules. BaseSettings and Setting in extensions/shared/library provide storage and common behavior. SettingsStatus loads settings and exposes the values that bytecode hooks read. A setting key is persisted on the user's device, so keep existing keys stable across updates. A renamed key needs a migration.

An install-time Morphe patch option is different from an in-app setting. For example, AMOLED dark theme has a color option applied while building the patched APK. Advanced downloads depends on the Settings patch and exposes runtime switches in TikTok's Hushfeed settings. The generated catalog lists those dependencies and patch options.

The detailed in-app settings pages are separate from Morphe Manager's patch categories. Quiet Index groups these pages on the home screen in source version 0.70.1; their category classes and persisted setting keys remain the same:

| Settings page | Category class |
| --- | --- |
| App | ExtensionPreferenceCategory |
| Comments | CommentsPreferenceCategory |
| Diagnostics | DebugPreferenceCategory |
| Downloads | DownloadsPreferenceCategory |
| Feed filter | FeedFilterPreferenceCategory |
| Feed tabs | FeedNavigationPreferenceCategory |
| Feed screen | InterfacePreferenceCategory |
| Inbox | InboxPreferenceCategory |
| Playback | PlaybackPreferenceCategory |
| Privacy | PrivacyPreferenceCategory |
| Screen time | ScreenTimePreferenceCategory |
| Share sheet | SharePreferenceCategory |
| Region | SimSpoofPreferenceCategory |

Translations live in extensions/tiktok/src/main/l10n/. The generator scripts/gen-l10n.py refreshes the English base table and generated translation class. Run it after editing translation tables. The tests compare the sources and generated output.

## Settings design concepts

Design study v0.1.0, October 9, 2026. Quiet Index was selected and is implemented in source version 0.70.1. The images below remain design mockups. The native implementation uses the existing preference pages and setting keys. The published bundle remains 0.69.0, so the source redesign awaits publication.

The previous home repeated Feed filter, Privacy and Screen time as shortcuts above their full rows. Quiet Index replaces that stack with a compact status beside the Hushfeed title, search and seven groups. About Hushfeed sits separately below the groups. Detailed controls remain on their existing pages.

| Concept | Preview | Navigation tradeoff |
| --- | --- | --- |
| Quiet Index | [Open mockup](assets/settings-design-2026-10-09/quiet-index.png) | Selected and implemented in source 0.70.1. Seven grouped destinations keep the home compact. Related pages move one level deeper. |
| Three-domain Workspace | [Open mockup](assets/settings-design-2026-10-09/three-domain-workspace.png) | Experience, Privacy and Tools divide the library. Less scrolling, but users need to learn which tab owns a setting. |
| Focused Controls | [Open mockup](assets/settings-design-2026-10-09/focused-controls.png) | Expandable groups expose common controls in place. Faster adjustments, but expansion state and accidental changes need attention. |

### Category coverage for Quiet Index

| Home destination | Existing pages and actions |
| --- | --- |
| Feed & layout | Feed filter, Feed tabs, Feed screen |
| Playback | Playback |
| Privacy | Privacy |
| Comments & inbox | Comments, Inbox |
| Downloads & sharing | Downloads, Share sheet |
| Screen time | Screen time |
| App & advanced | App, Region, Backup and restore, Diagnostics, Feature Gate Lab, Pause Hushfeed |
| About Hushfeed | Build details, pending What's new, attribution and licenses |

The tabbed concept puts Region beside Privacy. Its Tools tab owns App, maintenance and About. The expandable concept combines Playback with Screen time, puts Region beside Privacy, and keeps maintenance under Tools & backup. Those are proposed groupings, not new patch behavior.

### Native implementation

TikTokPreferenceFragment owns the new group routes through its Hub enum. Existing Section routes still open the detailed pages built by the category classes above. SettingsMenuPreference supplies compact home rows. SettingsHeaderPreference holds the title and compact status, with SettingsSearchEntryPreference beneath it. Opening a related page retains its group in the Back stack. Playback, Privacy and Screen time keep their direct entry points from home.

Search still indexes individual controls and checklist members, including retained aliases for renamed settings. A result opens the existing page and scrolls to the matching row. Pause results open App & advanced. Group visibility follows the available pages from the installed patches. This is a navigation change. It leaves persisted setting keys, defaults, dependency explanations, backup and undo behavior in their existing owners.

The home uses a black base with small outline icons, quiet separators and restrained accents. Compact rows replace the large icon tiles and repeated shortcuts. Detailed pages retain their grouped controls. The mockup uses a 390 by 844 logical frame. Android layout must still be checked at the supported font scales, translated label lengths and light theme.

The compact status has Active, Paused and Restart pending text states. Tapping it opens App & advanced, which holds the detailed status, recovery actions and Pause. The Pause description and paused summary now say that runtime changes pause while saved settings and changes built into the APK remain. They no longer describe Pause as an unpatched app. Mockup switch positions are examples, not captured device settings. No protection score or battery-saving claim is part of the design.

The mockups establish hierarchy and category coverage. They are not evidence of native layout or device acceptance. Use the implementation's rendered screenshots and recorded checks for font scaling, accessibility, interaction and localization. Final build and supported-device acceptance were still in progress when this source note was updated.

## Adding or changing a patch

1. Start from the exact patch name in patches-list.json. Read its Kotlin declaration, dependencies, runtime hook, tests, and the matching README entry.
2. Confirm the behavior against the declared 47.1.4 APK. Record the package, version, and signer. Do not use the 38.3.3 factory APK as a bytecode or resource reference.
3. Put the patch in the closest existing feature package. Use a narrow fingerprint and validate the exact number or shape of matches. PatchContracts.kt provides helpers that fail with a patch-specific message when a match disappears, becomes ambiguous, or changes shape.
4. Decide whether the control belongs in Manager at patch time or in Hushfeed settings at runtime. For a runtime switch, add its stable key and default in Settings.java, connect it to the category row, and inject a hook that reads the setting. Add translation entries when new setting text is introduced.
5. Add a patch test for the selected bytecode or resource contract. Add a runtime test beside the Java feature when behavior can be exercised without TikTok's private runtime. Keep APK-dependent tests tied to the external fixture directory.
6. Regenerate patches-list.json from the built Morphe bundle. Do not hand-edit generated rows.
7. Run the README's test and bundle sequence. The all-patches verifier invokes the Morphe desktop patcher against each declared fixture. Unit tests alone do not prove that the patcher can apply a patch to TikTok.
8. For UI or device-specific behavior, install a signed build only on a test device where the existing TikTok signing key matches. The device helper's -Replace option removes TikTok and its local data, so it is not a safe shortcut for inspecting a factory install.

## Moving to a newer TikTok target

Treat a target update as a new reverse-engineering pass. TikTok can reuse short resource names for unrelated views, change obfuscated method shapes, alter server-backed defaults, or move a feature into a dynamic module.

1. Verify the exact universal APK and any split bundle. Record the package, version name, version code, signer, and APK hash. Update AppCompatibilities.kt and any patch that reads a version code.
2. Re-record the content-marker corpus from real videos with tools/verification-probe/record-markers.ps1. Refresh ContentMarkerCorpusTest inputs and the Feature Gate Lab catalog with :patches:generateGateCatalog.
3. Re-read the target's view tree and dynamic-module owners. Update patches/src/test/resources/view-id-anchors.txt with the owning class and the matching code. Replace stale resource names instead of retaining fallbacks that can resolve to a different view.
4. Review resource optimizer inventories, language-pack files, and resource IDs against the new APK. Keep the path and digest checks version-specific.
5. Set HUSHFEED_FIXTURE_DIR to the reviewed APKs, run the patch and runtime tests, then apply the complete patch set with scripts/verify-all-patches.ps1 and the Morphe desktop CLI. Tests do not invoke the patcher, so passing tests alone is not target approval.
6. Check the changed behaviors on the supported TikTok build. Then update the README target details, changelog, generated catalog, and release facts as one reviewed target move.

## Verification layers

| Check | What it proves |
| --- | --- |
| :extensions:tiktok:test | Runtime Java behavior through Robolectric |
| :extensions:tiktok:lint and :extensions:shared:library:lint | Android API-floor calls and guards |
| :patches:test | Patch logic, contracts, generated documentation, and catalog consistency |
| :patches:generatePatchesList | Catalog generated from the compiled patch bundle |
| :patches:buildAndroid plus :patches:verifyBundle | Bundle payloads, manifest version, checksum, compatibility description, and catalog match |
| scripts/verify-all-patches.ps1 | Each patch applies through the Morphe desktop patcher to every declared APK fixture |
| scripts/validate-release-facts.ps1 | README, catalog, bundle index, fixture results, and release facts agree |
| Device acceptance | The injected runtime hook behaves in the real TikTok UI on the supported version |

The APK fixtures are vendor files outside the repository. Set HUSHFEED_FIXTURE_DIR to their folder. Set HUSHFEED_DESKTOP_JAR to the Morphe desktop CLI jar for the apply-all verification. CONTRIBUTING.md documents the other script inputs and the pre-push checks.

For traffic, background work and battery checks, follow the [runtime observation protocol](runtime-observation.md). It separates actual transfers from API attempts, whole-phone charge from per-app estimates, and paused runtime settings from static APK changes. Its source map identifies the controls that can change the workload. The [October 9 measurements](runtime-results-2026-10-09.md) add a physical-device example on TikTok 47.1.4 with Hushfeed 0.68.0 paused, including capture limits that future checks must handle.

The test commands and their required order are maintained in [README.md](../README.md#building-from-source). The release procedure and fixture setup live in [CONTRIBUTING.md](../CONTRIBUTING.md). Update those instructions when the Gradle task graph or release gates change.

## Updating this guide

Refresh the target table and factory-install note when a new TikTok build is inspected. Update the module map when payload boundaries change. Patch counts are a dated snapshot; patches-list.json remains the authoritative list. Keep device observations tied to the exact TikTok version and mark any behavior that was not reached without an account.

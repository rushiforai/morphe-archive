# Kizu Twitch Patches

Morphe-compatible patches for the Twitch Android app, maintained for Kizu's Twitch enhancements.

This repository contains **Twitch patches only**.

## Included patches

The project is focused on a single user-facing patch:

- **Twitch Enhancement**

Its internal dependencies provide the individual Twitch features, including:

- Third-party 7TV / BTTV emotes
- Third-party emote picker integration
- Emote animation support
- Privacy controls
- UYU/Kizu settings integration
- Twitch ad and promotion handling
- Login and notification compatibility fixes
- Automatic Channel Points bonus claiming

Internal dependencies are deliberately kept hidden from Morphe's user-facing patch list.

## Sources, attribution and reused work

This project is a derivative work assembled from several open-source projects, upstream implementations, public APIs, platform documentation, and reverse-engineering of the target Twitch application. This section distinguishes **code that is directly reused/adapted** from **reference material and upstream lineage**.

### Direct code sources

#### 1. UYU — 'bakwudo/uyu'

**Repository:** https://github.com/bakwudo/uyu

**Role:** Major upstream codebase for the Twitch patch bundle and the base architecture used by this project.

**Used/adapted:**

- Twitch patch structure and patch organization.
- Twitch 31.3.1 targeting and version-specific fingerprints.
- UYU/Kizu settings integration and settings UI.
- Login compatibility implementation.
- Notification compatibility implementation.
- Ad blocking / promotion handling and related runtime hooks.
- Danmaku/chat overlay implementation where retained.
- Channel Points patch structure and Twitch Channel Points model fingerprints.
- Shared extension/runtime utilities and constants.
- Morphe extension packaging and Twitch compatibility plumbing.

The current project modifies and extends UYU's Twitch implementation rather than presenting the inherited portions as wholly original.

#### 2. Hooman's Morphe Patches — 'arandomhooman/hoomans-morphe-patches'

**Repository:** https://github.com/arandomhooman/hoomans-morphe-patches

**Role:** Primary upstream for the third-party Twitch emote implementation.

**Used/adapted:**

- 7TV / BTTV emote loading architecture.
- EmoteCatalog, EmoteSupport, EmoteImageLoader, Emote, and CenteredImageSpan implementation/code.
- Third-party emote retrieval, caching and chat rendering.
- Twitch emote-related fingerprints and hooks where applicable.
- 7TV / BTTV emote data handling and asset URL construction.

The Hooman implementation targets an older Twitch version, so the code here has been adapted for newer Twitch builds and extended with Kizu's picker and animation work.

Hooman's own README identifies ReVanced as part of its upstream lineage; see the indirect upstream section below.

### Framework and build sources

#### 3. Morphe Patches / Morphe Patcher

**Morphe:** https://github.com/MorpheApp  
**Morphe Patches template:** https://github.com/MorpheApp/morphe-patches-template  
**Morphe Patcher:** https://github.com/MorpheApp/morphe-patcher  
**Morphe documentation:** https://github.com/MorpheApp/morphe-documentation

**Used:**

- Morphe patch project/template structure.
- Patch DSL and bytecode-patching APIs.
- Fingerprint and compatibility mechanisms.
- Extension packaging.
- .mpp patch bundle format.
- Build and patch tooling.
- Morphe-specific licensing/NOTICE requirements.

This repository is built as a Morphe patch bundle; Morphe is the patching/build framework, not the source of the Kizu-specific Twitch features.

### Indirect upstream lineage / reference projects

The following projects are **not claimed as direct copied source for the current implementation** unless explicitly noted above. They are included because they are upstream references identified by the projects whose code we adapted, or because they informed specific implementation work.

#### 4. ReVanced

**Repository:** https://github.com/ReVanced/revanced-patches

UYU and Hooman's projects identify ReVanced as upstream/reference work. The current project therefore preserves that attribution lineage for inherited patching patterns and concepts.

This README does **not** claim that every ReVanced implementation is present in this repository.

#### 5. niconico-yt-morphe-patches

**Repository:** https://github.com/david419kr/niconico-yt-morphe-patches

UYU credits this project as a reference for the danmaku overlay design. Any retained danmaku functionality therefore carries that upstream reference.

#### 6. morphe-androidtv-patches

**Repository:** https://github.com/ajstrick81/morphe-androidtv-patches

UYU credits this project as a reference for client-side ad blocking. It is listed here as upstream reference material rather than as a claim that its code was copied wholesale into Kizu.

#### 7. bttv-android

**Repository:** https://github.com/bttv-android/bttv

This project is an independent Android Twitch mod with 7TV/BTTV/FFZ support and automatic Channel Points claiming.

It was used as a **technical reference during development**, particularly when investigating Android-side automatic Channel Points claiming and third-party emote behavior. It is not presented as a direct source of the current Kizu Channel Points implementation.

### Target application and external services

#### 8. Twitch Android

**Target:** Twitch Android 31.3.1 / build 3103016  
**Package:** tv.twitch.android.app

A genuine Twitch APKM was inspected to identify the current app's obfuscated classes, methods, models and UI structures.

**Used for reverse engineering, not copied as source code:**

- Exact Twitch 31.3.1 class/method signatures.
- Channel Points provider/model structure.
- The exact Channel Points claim method used by the target build.
- The actual EmoteUrlUtil.b(String,String) URL helper.
- Native Twitch emote-picker model classes and enums.
- Twitch emote animation-related state/mutation names.
- Runtime behavior needed to target the current Twitch build.

Twitch's application code is proprietary. Its code is not presented here as project source.

#### 9. 7TV

**Project:** https://7tv.app/

**Used:**

- Public 7TV emote-set data/API endpoints.
- 7TV emote IDs and names.
- Static and animated emote asset URLs.
- Emote metadata needed by the third-party emote loader and picker.

The project does not include 7TV's service code.

#### 10. BetterTTV (BTTV)

**Project:** https://betterttv.com/

**Used:**

- Public BTTV emote-set data/API endpoints.
- BTTV emote IDs and names.
- Static and animated emote asset URLs.
- Emote metadata needed by the third-party emote loader and picker.

The project does not include BTTV's service code.

### Android / platform references

#### 11. Android / AOSP

**Android documentation:** https://developer.android.com/  
**AOSP:** https://android.googlesource.com/platform/frameworks/base/

**Used:**

- Android ImageDecoder behavior.
- AnimatedImageDrawable behavior.
- Explicit animation start/repeat behavior.
- Android view, popup, keyboard and input-method behavior used by the picker.
- Standard Android lifecycle and UI APIs used by the extension.

These are platform references, not copied application code.

## What is original or Kizu-specific

The following work is developed specifically for this repository, even where it builds on the upstream implementations above:

- Porting the combined Twitch feature set to Twitch 31.3.1.
- Reverse-engineering Twitch 31.3.1's obfuscated emote-picker and Channel Points structures.
- The Kizu third-party emote picker bridge.
- Integration between the adapted Hooman emote system and Twitch's native emote picker.
- The Kizu picker button and compact standalone picker UI.
- Native-picker lifecycle handling so Twitch's original picker remains in its own view hierarchy.
- Kizu-specific emote search/filter behavior and keyboard handling.
- Twitch-version-specific emote URL hooking.
- Animated 7TV/BTTV emote loading and playback fixes.
- Kizu-specific settings behavior, including third-party emote animation controls.
- Kizu's automatic Channel Points retry logic and integration with Twitch's exact claim method.
- Compatibility fixes and regression repairs made while testing against the target Twitch APK.

Where a component is adapted from another project, the upstream project is identified above rather than treating the adaptation as wholly original.

## Attribution notes

There are several different kinds of dependencies in this project:

| Source | Relationship |
|---|---|
| UYU | **Directly adapted upstream codebase** |
| Hooman's Morphe Patches | **Directly adapted for third-party emotes** |
| Morphe / Morphe Patcher / template | **Build and patch framework** |
| ReVanced | **Indirect upstream lineage/reference** |
| niconico-yt-morphe-patches | **Indirect danmaku reference via UYU** |
| morphe-androidtv-patches | **Indirect ad-blocking reference via UYU** |
| bttv-android | **Independent technical reference for emotes/auto-claim** |
| Twitch Android | **Reverse-engineering target; proprietary, not copied as source** |
| 7TV | **External emote service/API** |
| BTTV | **External emote service/API** |
| Android / AOSP | **Platform/API documentation and behavior reference** |

This distinction is intentional: a project being listed here does not automatically mean its source code was copied into Kizu. The relationship is stated explicitly for each source.

## Add to Morphe

Add this repository as a remote patch source in Morphe Manager:

github.com/K8R8TO/kizu-morphe-patches

Morphe supports GitHub repository patch sources and can keep them updated automatically.

## Building locally

Build the Android patch bundle with:

~~~bash
./gradlew buildAndroid
~~~

The generated .mpp bundle is written to patches/build/libs/.

## License

This project follows the licenses and additional conditions included in the repository's LICENSE and NOTICE files. Upstream licenses and attribution requirements remain applicable to the respective reused/adapted components.

<!-- Kizu feature-chain build verification -->

<!-- settings package fix -->

<!-- runtime trigger -->

<!-- release retrigger -->
\n### Channel Points reverse-engineering archive

The exact Twitch 31.3.1 APKM used for current development, plus the exact PurpleTV 2.4_r2 APK used as a working auto-claim reference, are documented permanently under `reference/channel-points/`. The archive records artifact hashes, split/DEX inventories, relevant Twitch 31.3.1 Channel Points classes and GraphQL operations, PurpleTV's GraphQL claim architecture, and the assessment of historical/Copilot diagnoses.

See: `reference/channel-points/README.md`

The current known-good baseline is documented in `reference/channel-points/BASELINE-1.8.0.md`. Future changes should start from 1.8.0 unless a historical version is explicitly required.




<!-- 1.9.0.16 release workflow trigger -->


<!-- 1.9.0.19 release workflow trigger -->

<!-- 1.9.0.19 release workflow trigger -->

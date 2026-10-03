# Kizu Twitch Patches

Morphe-compatible patches for the Twitch Android app, maintained for Kizu's Twitch enhancements.

This repository contains **Twitch patches only**. It does not contain the Boost for Reddit / Random NSFW patches or any other Reddit patches.

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

Internal dependencies are deliberately kept hidden from Morphe's user-facing patch list.

## Sources, attribution and reused work

This project is a derivative work assembled from several open-source projects and public technical sources. We want to be explicit about what is being reused or adapted rather than presenting those parts as original work.

### 1. UYU — `bakwudo/uyu`

**Repository:** https://github.com/bakwudo/uyu

**Relevant project:** the Android Twitch patch bundle **uyu**, including its Twitch 31.3.1 implementation.

**Used/adapted:**

- UYU's Twitch patch structure and implementation for the Twitch features carried into this project.
- UYU's settings integration and Twitch settings entry.
- UYU's login compatibility implementation.
- UYU's notification compatibility implementation.
- UYU's ad blocking / promotion handling implementation and related runtime hooks.
- UYU's danmaku/chat overlay implementation where applicable.
- UYU's Twitch-version-specific fingerprints, extension/runtime structure and supporting utilities where applicable.
- UYU's Twitch 31.3.1 targeting work as a reference for adapting the project to the same Twitch build.

This project modifies and extends those implementations rather than presenting them as wholly original work.

### 2. Hooman — `arandomhooman/hoomans-morphe-patches`

**Repository:** https://github.com/arandomhooman/hoomans-morphe-patches

**Relevant Twitch implementation:** the **7TV and BTTV emotes** patch.

**Used/adapted:**

- The third-party emote architecture for loading 7TV and BTTV emote sets.
- The `EmoteCatalog`, `EmoteSupport`, `EmoteImageLoader`, `Emote` and `CenteredImageSpan` implementation concepts/code used for third-party emote retrieval, caching, rendering and chat integration.
- The Twitch emote patch/fingerprint approach where applicable.
- The 7TV and BTTV API endpoints used by that implementation.

**Not claimed as original work:** the underlying 7TV/BTTV chat-emote implementation is substantially based on/adapted from Hooman's work. It is being modified here for newer Twitch versions and extended with picker and animation support.

Hooman's repository itself documents its upstream references and prior work. Its current Twitch patch supports Twitch 30.7.2, while this project targets newer Twitch builds.

### 3. Twitch Android application

**Target:** Twitch Android `31.3.1` / build `3103016`

A genuine Twitch APKM was inspected to identify the current app's obfuscated classes, methods, models and emote-picker structures.

**Used for reverse engineering, not copied as source code:**

- Exact Twitch 31.3.1 class/method signatures.
- The actual `EmoteUrlUtil.b(String,String)` URL helper.
- The actual emote-picker model classes and enums.
- The actual Twitch emote animation-related state/mutation names.
- Runtime behavior required to make the patches target the current Twitch build.

The Twitch application itself is proprietary. Its code is not presented here as project source.

### 4. 7TV

**Project/API:** https://7tv.app/

**Used:**

- Public 7TV emote-set data/API endpoints.
- 7TV emote IDs, names and image URLs required to display third-party emotes.
- Animated/static emote asset URLs used by the third-party emote loader.

### 5. BetterTTV (BTTV)

**Project/API:** https://betterttv.com/

**Used:**

- Public BTTV emote-set data/API endpoints.
- BTTV emote IDs, names and image URLs required to display third-party emotes.
- Animated/static emote asset URLs used by the third-party emote loader.

### 6. Android / AOSP documentation

**Android documentation:** https://developer.android.com/

**AOSP:** https://android.googlesource.com/platform/frameworks/base/

**Used:**

- Android `ImageDecoder` / `AnimatedImageDrawable` behavior.
- The requirement to explicitly start animated drawables.
- Infinite animation/repeat behavior used when fixing third-party animated emotes.

## What is original to this repository

The following work is being developed specifically for this project rather than being represented as copied upstream functionality:

- Porting and adapting the combined Twitch features to the target Twitch version.
- Reverse-engineering Twitch 31.3.1's obfuscated emote-picker models.
- The Kizu third-party emote picker bridge.
- Integration between the adapted Hooman emote system and Twitch's native emote picker.
- Twitch-version-specific URL hooking.
- Fixes for animated 7TV/BTTV emote loading and playback.
- Kizu-specific settings behavior, including forcing third-party emote animations on.
- Compatibility fixes and repairs made during testing against the target Twitch APK.

Where a component is adapted from another project, this README identifies that source instead of treating the adaptation as wholly original.

## Add to Morphe

Add this repository as a remote patch source in Morphe Manager:

`github.com/K8R8TO/kizu-morphe-patches`

Morphe supports GitHub repository patch sources and can keep them updated automatically.

## Building locally

Build the Android patch bundle with:

```bash
./gradlew buildAndroid
```

The generated `.mpp` bundle is written to `patches/build/libs/`.

## License

This project follows the licenses and additional conditions included in the repository's `LICENSE` and `NOTICE` files. Upstream licenses and attribution requirements remain applicable to the respective reused/adapted components.

<!-- Kizu feature-chain build verification -->

<!-- settings package fix -->

<!-- runtime trigger -->

<!-- release retrigger -->



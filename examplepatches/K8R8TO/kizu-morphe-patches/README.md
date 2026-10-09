# Kizu Twitch Patches

Morphe-compatible patches for the **Twitch Android app**.

Kizu's goal is simple: add useful Twitch enhancements, privacy/cleanup controls, and third-party emote support while keeping the patch focused on the features that are actually supported and tested.

**Current stable:** [v1.9.2](https://github.com/K8R8TO/kizu-morphe-patches/releases/tag/v1.9.2)  
**Target:** Twitch Android **31.3.1** (tv.twitch.android.app)  
**Format:** Morphe .mpp patch bundle

## Features

### Twitch enhancements

- Automatic **Channel Points** bonus-claiming.
- Choose the default startup tab:
  - Following
  - Live
  - Clips
- **Login compatibility fixes**.
- **Notification compatibility fixes**.
- Third-party **chat rendering** support.

### Home & navigation

- Hide **Stories**.
- Hide **Go Ad-Free / Turbo** from the Following feed.
- Hide **Continue Watching**.
- Hide **Offline Channels**.

### Appearance & cleanup

- Hide **Subscribe / Gift Sub / Bits** controls above chat.
- Hide the **Bits** button.
- Hide the **gift leaderboard**.
- Hide **subscription/promotion** banners.
- Disable Twitch's supported **link disclaimer**.

### Ads

- Twitch **ad blocking**.
- Optional **stream proxy** support.
- Built-in proxy choices and a custom proxy URL.
- Proxy fallback behavior for supported playback paths.

### Third-party emotes

- **7TV** emotes.
- **BTTV** emotes.
- **FFZ / FrankerFaceZ** emotes.
- One master **3rd party emotes** toggle.
- Animated third-party emotes.
- Third-party **emote picker**.
- Third-party **autocomplete**.
- **Zero-width / overlay emotes**.
- Emote caching and image loading.
- Twitch 31.3.1-specific emote URL compatibility.

Kizu's third-party picker is kept separate from Twitch's native emote picker. Twitch's native picker and its native three-button menu are not replaced.

### Chat

- Show **deleted messages**.
- Deleted-message styles:
  - Mod
  - Strikethrough
  - Grey
- **Chat timestamps**.
- **Mention highlighting**.
- Custom mention highlight color.
- Optional mention sound.
- Configurable mention-sound cooldown.

### Privacy

- Disable **Comscore** measurement.
- Disable **Bugsnag / crash reporting**.

## Sources & adapted work

Kizu combines original work with code and implementation ideas adapted from other open-source projects. The table below shows the sources used for features or major parts of the patch.

| Feature / area | Source |
|---|---|
| Twitch patch architecture, settings, login/notification compatibility, ad/promotion handling, shared utilities | [UYU](https://github.com/bakwudo/uyu) |
| 7TV / BTTV / FFZ emotes, emote loading/caching, third-party emote handling | [Hooman's Morphe Patches](https://github.com/arandomhooman/hoomans-morphe-patches) |
| Channel Points auto-claim architecture/reference | [PurpleTV ReVive](https://github.com/alienware377/purpletv-revive) |
| Twitch patching framework and build tooling | [Morphe](https://github.com/MorpheApp), [Morphe Patches](https://github.com/MorpheApp/morphe-patches), [Morphe Patches Template](https://github.com/MorpheApp/morphe-patches-template), [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher), [Morphe Documentation](https://github.com/MorpheApp/morphe-documentation) |
| Additional patching/reference lineage | [ReVanced](https://github.com/ReVanced/revanced-patches), [morphe-androidtv-patches](https://github.com/ajstrick81/morphe-androidtv-patches), [bttv-android](https://github.com/bttv-android/bttv) |

Kizu is responsible for the Twitch 31.3.1-specific adaptation, reverse engineering, integration, settings, compatibility work, and regression fixes.

### Twitch 31.3.1

The actual **Twitch Android 31.3.1 APKM** is the authoritative target for Twitch-specific fingerprints, resources, and bytecode structure.

Donor projects are references for implementation and lineage; their obfuscated Twitch class or method names are not assumed to match Twitch 31.3.1.

### External emote services

Kizu uses the public services/data of:

- [7TV](https://7tv.app/)
- [BetterTTV](https://betterttv.com/)
- [FrankerFaceZ](https://www.frankerfacez.com/)

These services are not included in this repository.

## Licensing

Kizu is licensed under **GNU GPLv3**. See [LICENSE](LICENSE).

Code adapted from upstream projects remains subject to the applicable upstream license and attribution requirements.

The repository also includes [NOTICE](NOTICE) with the Morphe-specific GPLv3 Section 7 notice. In particular, Kizu uses its own project name and branding and only refers to Morphe as the compatibility/build framework.

Twitch is proprietary software and is not owned by Kizu. Kizu does not distribute Twitch's proprietary source code.

## Building

Requirements are the normal Morphe patch development environment with a compatible JDK and Gradle setup.

Build the Android patch bundle with:

~~~bash
./gradlew buildAndroid
~~~

The generated .mpp bundle is produced under:

~~~
patches/build/libs/
~~~

The patch metadata/release files are maintained in the repository so Morphe Manager can consume published releases.

## Development

Kizu targets specific Twitch versions rather than arbitrary versions.

For a supported Twitch build, Kizu:

1. Inspects the actual target APK/APKM.
2. Derives Twitch-specific fingerprints from that build.
3. Implements and tests the feature.
4. Builds the .mpp bundle.
5. Verifies the release metadata.
6. Runtime-tests the patched app before treating the change as complete.

Experimental features stay out of stable releases until they are verified.

## License & attribution

This repository is a combined/derivative project. Upstream projects are credited above, and their respective licenses and attribution requirements continue to apply to the reused components.

Kizu does not claim ownership of Twitch or any upstream project, service, or framework listed in this README.

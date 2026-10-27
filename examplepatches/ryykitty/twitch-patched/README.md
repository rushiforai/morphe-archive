[![Latest Release](https://img.shields.io/github/v/release/ryykitty/twitch-patched?style=for-the-badge&logo=github&color=green)](https://github.com/ryykitty/twitch-patched/releases/latest)
[![Dev Release](https://img.shields.io/github/v/tag/ryykitty/twitch-patched?filter=%2A-dev.%2A&sort=date&label=Dev%20Release&color=orange&style=for-the-badge&logo=github)](https://github.com/ryykitty/twitch-patched/releases?q=prerelease%3Atrue)

# Twitch patches

Independent patches for the official Twitch Android app, compatible with [Morphe](https://morphe.software/).

## Features

Select each feature independently when patching. Included features appear under Twitch's **Settings > Patch settings**; omitted patches do not add settings.

Patch settings include search, emote provider controls and UI customization. Group switches and individual controls let you choose which elements to hide.

| Patch | Behavior |
| --- | --- |
| Block stream ads | Replaces detected preroll and midroll ads with direct Twitch playback. |
| Hide feed and display ads | Hides sponsored feed cards, banners and display ads. |
| Hide Turbo promotions | Hides Twitch Turbo promotions and purchase prompts. |
| Hide subscription discount banners | Hides subscription offers, discount banners and promotional labels. |
| Auto-claim bonus channel points | Automatically claims bonus channel points while watching live streams. |
| BTTV, FFZ and 7TV emotes | Adds global and channel emotes to live chat, replay chat and the emote picker, with animations and tap previews. |
| Reload stream | Reloads live streams with a double-tap control. |
| Show deleted messages | Reveals retained deleted and moderated messages on tap in native and React Native chat. |
| UI settings | Controls player buttons, channel actions, extensions, Hype Trains, leaderboards and fullscreen system bars. |
| Block client-requested ads | Blocks native player ad requests. Restart Twitch after changing this setting. |
| Playback diagnostics | Records playlist metadata and playback counters for troubleshooting. |
| Inspect Twitch APK | Reports the APK package, version and DEX class count without modifying the app. |

Every patch that modifies Twitch includes Patch settings, push notification registration, app-theme fixes and DJ playback settings support. These shared fixes require no separate patch selection. DJ playback uses Twitch's existing player and available renditions.

All feature patches are selected and enabled by default. UI customization options are off by default. Inspection and playback diagnostics are optional. Previously saved settings are retained.

## Compatibility

Supported Twitch versions:

| Version | Version code |
| --- | --- |
| 31.7.0 | 3107006 |
| 31.6.0 | 3106006 |
| 31.5.2 | 3105026 |

Twitch 31.7.0 is the stable baseline. Earlier versions remain supported by the same hooks. Twitch 31.8.0_BETA (13108003) is an experimental target. Verification uses ARM64 on Android 13. See [compatibility data](config/compatibility.json) for build results, device checks and remaining validation.

These patches require Morphe Patcher 2.0.1, available in Morphe Manager 2.2.0 and Morphe Desktop 1.19.1.

Ad blocking is under evaluation. Google Play billing is unavailable in the re-signed app.

Other versions and ABIs require their own hook and device verification.

## Using the patches

1. [Add this patch source to Morphe](https://morphe.software/add-source?github=ryykitty/twitch-patched).
2. Select an original Twitch APK matching a supported version, choose the patches and install the result.

[Releases](https://github.com/ryykitty/twitch-patched/releases) contain `.mpp` patch bundles. These can also be built locally and applied with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop), using an original APK or complete split bundle.

## Building

Install Java 21, Node.js 24, PowerShell 7 and Android SDK Platform 36 with Build-Tools 36.0.0. GitHub Packages dependencies require read access configured through `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties`.

On Windows, run from the repository root:

```powershell
./scripts/bootstrap-tools.ps1
./scripts/check-source.ps1
./scripts/build.ps1
./scripts/test.ps1
npm.cmd ci
npm.cmd test
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. The Gradle equivalent is `./gradlew buildAndroid`; Java/Kotlin tests run through `./gradlew :patches:test :extensions:twitch:testDebugUnitTest :patches:buildAndroid`.

## Contributing

Changes and feature proposals are welcome. Keep pull requests focused on one feature or fix and target `dev`. See [contributing](CONTRIBUTING.md) for setup and verification, and [maintenance](docs/MAINTENANCE.md) for releases.

The [screen inventory](docs/SCREENS.md) lists the playback and settings surfaces covered by the patches. Interface customization modules use the [UI settings registry](docs/UI_SETTINGS.md).

Thanks to [oviron](https://github.com/oviron) for Twitch 31.7.0 support and the original deleted-message patch.

This patchset was developed with AI assistance for code generation, debugging and documentation.

## Issues and feature requests

Use this repository's Issues tab to report ads, bugs, missing UI coverage or request a feature. Reports of any ad that appears are welcome.

Include Twitch and patch-bundle versions, Android version, enabled patches, player layout, approximate time and reproduction steps. For ads, distinguish ad video from a stale countdown or support banner. Channel and screenshots are optional.

Search existing issues before opening a report.

## License

[GPL-3.0](LICENSE), with upstream attribution and naming terms in [NOTICE](NOTICE). Additional retained licenses are under `licenses/` and `patches/src/main/resources/hermes/`. This project is independent of Twitch and the Morphe project.

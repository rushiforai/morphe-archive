# Twitch patches

Independent patches for the official Twitch Android app, compatible with [Morphe](https://morphe.software/).

## Features

Select each feature independently when patching. Included features appear under Twitch's **Settings > Patch settings**; omitted patches do not add settings.

| Patch | Behavior |
| --- | --- |
| Block stream ads | Replaces detected preroll and midroll ads with direct Twitch playback. |
| Hide feed and display ads | Hides sponsored feed cards, banners and display ads. |
| Hide Turbo promotions | Hides Twitch Turbo promotions and purchase prompts. |
| Hide subscription discount banners | Hides subscription offers, discount banners and promotional labels. |
| Auto-claim bonus channel points | Automatically claims bonus channel points while watching live streams. |
| BTTV, FFZ and 7TV emotes | Adds global and channel emotes to chat and the emote picker, with animations, provider settings and tap previews. |
| Reload stream | Reloads live streams with a double-tap control. |
| Block client-requested ads | Blocks native player ad requests. Restart Twitch after changing this setting. |
| Playback diagnostics | Records playlist metadata and playback counters for troubleshooting. |
| Inspect Twitch APK | Reports the APK package, version and DEX class count without modifying the app. |

Every patch that modifies Twitch includes Patch settings, push notification registration, app-theme fixes and DJ playback settings support. These shared fixes require no separate patch selection. DJ playback uses Twitch's existing player and available renditions.

All feature patches are selected and enabled by default. Inspection and playback diagnostics are optional. Previously saved settings are retained.

## Compatibility

Supported Twitch versions:

| Version | Version code |
| --- | --- |
| 31.5.2 | 3105026 |
| 31.4.2 | 3104026 |

Twitch 31.5.2 is the primary target; 31.4.2 remains supported by the same hooks. Verification uses ARM64 on Android 13. See [compatibility data](config/compatibility.json) for build results, device checks and remaining validation.

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

Changes and feature proposals are welcome. Keep pull requests focused on one feature or fix and target `dev`. Follow [AGENTS.md](AGENTS.md) for architecture and hook requirements, and [maintenance instructions](docs/MAINTENANCE.md) for evaluation and releases.

Include the app version, patch selection, tests and device results in your pull request.

This patchset was developed with AI assistance for code generation, debugging and documentation.

## Issues and feature requests

Use this repository's Issues tab to report ads, bugs, missing UI coverage or request a feature. Reports of any ad that appears are welcome.

Include Twitch and patch-bundle versions, Android version, enabled patches, player layout, approximate time and reproduction steps. For ads, distinguish ad video from a stale countdown or support banner. Channel and screenshots are optional.

Search existing issues before opening a report.

## License

[GPL-3.0](LICENSE), with upstream attribution and naming terms in [NOTICE](NOTICE). Additional retained licenses are under `licenses/` and `patches/src/main/resources/hermes/`. This project is independent of Twitch and the Morphe project.

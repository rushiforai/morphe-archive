# Twitch patches

Independent patches for the official Twitch Android app, compatible with [Morphe](https://morphe.software/).

## Features

Select each feature independently when patching. Included features appear under Twitch's **Settings > Patch settings**; omitted patches do not add settings.

| Patch | Behavior |
| --- | --- |
| Block stream ads | Replaces detected live-stream ads with direct Twitch playback from alternate player contexts. Prefers matching video quality. No external stream proxy. |
| Hide feed and display ads | Removes sponsored feed cards and display ads using Twitch's no-ad responses. |
| Hide Turbo promotions | Hides Turbo entries, upsells and purchase buttons. |
| Hide subscription discount banners | Hides subscription offers and promotional labels, while retaining normal subscription actions. |
| Auto-claim bonus channel points | Claims available bonus rewards in live playback. |
| BTTV and 7TV emotes | Renders global and channel emotes in chat with provider previews on tap. |
| Reload stream | Adds a reload button in live-player controls. Double-tap to reload. |
| Block client-requested ads | Suppresses native ad requests. Restart Twitch after changing the setting. |
| Playback diagnostics | Records playlist structure and playback frame counters. Disabled by default. |
| Inspect Twitch APK | Reports package, version and DEX class count during patching. Does not change the app. |

Push notification registration is included automatically with feature patches.

All feature patches are selected and enabled by default. Inspection and playback diagnostics are optional. Previously saved settings are retained.

## Compatibility

Supported Twitch versions:

| Version | Version code |
| --- | --- |
| 31.4.2 | 3104026 |
| 31.3.0 | 3103006 |

Both versions have passed patching and DEX verification. Device testing uses ARM64 on Android 13. Initial checks for 31.4.2 cover settings, stream reloading, emotes and ad blocking; extended testing is ongoing. See [compatibility data](config/compatibility.json) for verification results and remaining checks.

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

# Supperelias2 SBS Patches

Unofficial [Morphe](https://morphe.software) patches for SBS On Demand.

[Add this source to Morphe](https://morphe.software/add-source?github=Supperelias2/sbs-morphe-patches)
 · [Releases](https://github.com/Supperelias2/sbs-morphe-patches/releases)
 · [Report a problem](https://github.com/Supperelias2/sbs-morphe-patches/issues)

## What the patches do

The regular **v1.3.0** source release adds a purple **Morphe settings** row to the
mobile account menu, above App Settings and Language. It contains persistent
toggles for installed patches and optional QoL experiments. Ad removal and the
verified intro/recap correction start enabled; the extra runtime options start
disabled.

Refresh this source normally in Morphe Manager to receive the new patches. The
new QoL patches appear in the **Experimental** category and target mobile SBS
**6.4.0 (16659)**. They remain experimental and still need phone testing. See the
[experimental settings guide](docs/mobile-settings-experimental.md) for features,
defaults, supported versions and test steps.

**Prefer direct VOD stream** removes the video ads played before and during
on-demand videos (pre-roll and mid-roll) by using SBS's direct Akamai stream.

**Prefer direct live stream** removes the extra video ads inserted before or
during live TV. Ads already present in the TV broadcast itself remain.

Both patches use the direct stream when SBS supplies one. If it is unavailable,
the app keeps its normal playback path. The maintainer has confirmed ad removal
and working VOD/live playback on a phone using **6.3.0 (16435)**. See the testing
section below for 6.4.0 validation. Location requirements are unchanged.

## Install with Morphe Manager

1. Open the source link above, or add `https://github.com/Supperelias2/sbs-morphe-patches`
   under **Sources → + → Remote**.
2. Refresh the source to load the latest regular release. Find the new QoL
   patches in the **Experimental** category.
3. Select an original SBS 6.4.0 (16659) APKM for the experimental QoL patches.
   The legacy ad/menu patches also support 6.3.0 (16435). Both playback patches are selected by
   default; you can disable either one if you only want VOD or live changes.
   The compatibility check is automatic.
4. Patch and install using Morphe Manager. A signature conflict with the official
   app may require uninstalling that app, which removes its local data/downloads.
5. Keep Morphe's signing key for future updates. Test start, resume, seeking,
   midstream playback and live playback.

Alternatively import the release's `.mpp` file using **Sources → + → Local**.
Local imports need to be replaced manually for updates. Always patch an original
app file, not an already patched APK.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/Supperelias2/sbs-morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;19 patches total
<details open>
<summary>📦 SBS On Demand&nbsp;&nbsp;•&nbsp;&nbsp;19 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;6.4.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Experimental: automatic intro and recap skipping](#experimental-automatic-intro-and-recap-skipping) | Experimental separate opt-in VOD intro and recap skipping, once per segment and media item. |  |
| [Experimental: binge-watching preset](#experimental-binge-watching-preset) | Adds an opt-in preset button for automatic intros/recaps, uninterrupted watching and a shorter next-episode delay. Individual switches remain available. |  |
| [Experimental: bounded VOD buffer recovery](#experimental-bounded-vod-buffer-recovery) | Experimental opt-in restart after 25 seconds of continuous direct-VOD buffering, with at most two attempts per media session. Live, ads, DRM and player errors are excluded. |  |
| [Experimental: clean paused picture](#experimental-clean-paused-picture) | Adds opt-in hiding of controls while paused, using the synchronized SBS visibility path. Off by default. |  |
| [Experimental: controls timeout](#experimental-controls-timeout) | Adds an opt-in controls timeout to Morphe settings. Normal three-second behavior is preserved by default. |  |
| [Experimental: correct intro and recap seeking](#experimental-correct-intro-and-recap-seeking) | Experimental provider-aware VOD skip correction. Enabled in Morphe settings by default. |  |
| [Experimental: custom seek intervals](#experimental-custom-seek-intervals) | Experimental separate rewind and forward intervals for player and live controls, with matching PiP descriptions. Defaults to 15 seconds. |  |
| [Experimental: customize subtitles](#experimental-customize-subtitles) | Adds optional subtitle size, bottom margin, and high-contrast styling to Morphe settings. Disabled at runtime by default; SBS mobile 6.4.0 only. |  |
| [Experimental: external direct-stream player](#experimental-external-direct-stream-player) | Adds opt-in handoff of direct VOD to an installed video player. DRM content stays in SBS; session/format limitations can apply. |  |
| [Experimental: local playback diagnostics](#experimental-local-playback-diagnostics) | Adds an opt-in provider, resolution, bitrate and buffer overlay. Does not show stream URLs or account data. |  |
| [Experimental: next episode countdown](#experimental-next-episode-countdown) | Adds an opt-in next-episode delay preference. Original autoplay, cancel and watch-credits actions are retained. |  |
| [Experimental: persistent VOD playback speed](#experimental-persistent-vod-playback-speed) | Experimental saved playback speed for direct VOD. Opt-in; live and Google DAI remain at normal speed. |  |
| [Experimental: reduce telemetry](#experimental-reduce-telemetry) | Adds an off-by-default setting to suppress selected navigation, interaction and playback analytics events. SDK initialization remains enabled. |  |
| [Experimental: remember video quality](#experimental-remember-video-quality) | Adds optional remembered bitrate, automatic, and highest-supported quality modes to Morphe settings. Disabled at runtime by default; SBS mobile 6.4.0 only. |  |
| [Experimental: uninterrupted watching](#experimental-uninterrupted-watching) | Adds an opt-in switch to stop inactivity prompts and their player exit. Long-pause stream refresh is preserved. |  |
| [Morphe settings](#morphe-settings) | Adds Morphe settings above App Settings and Language in the account menu. |  |
| [Prefer direct VOD stream](#prefer-direct-vod-stream) | Removes pre-roll and mid-roll video ads by selecting SBS's direct VOD stream when available. |  |
| [Prefer direct live stream](#prefer-direct-live-stream) | Removes extra video ads from live TV by selecting the direct stream when available. Ads in the broadcast remain. |  |
| [SBS playback compatibility check](#sbs-playback-compatibility-check) | Verifies the playback methods required by the VOD and live ad-removal patches. |  |

</details>

<!-- PATCHES_END -->

## Development and testing

Build with `./gradlew buildAndroid`. The bundle is written to
`patches/build/libs/patches-*.mpp`. Local builds need GitHub Packages read access;
never commit credentials. Regular releases are published from `main`; the
semantic release workflow builds releases and updates source metadata.

Validation completed: Gradle build, application to the original APKM using
Morphe Desktop 1.16.0, APK rebuild, and inspection of the modified DEX method.
Both patches together were applied to the original APKM and their guards and
fallback paths inspected in the rebuilt DEX. The live patch also passed a
standalone application/rebuild check on the base APK. The maintainer subsequently
reported successful live playback on a phone. Broader channel/device coverage
remains unverified.

SBS **6.4.0 (16659)** also passes the CLI patch-and-rebuild checks with both
playback patches enabled. The 6.3.0 regression check still passes. Playback on
a device with 6.4.0 has not yet been verified.

The 6.4.0 build with the experimental QoL patches also passes the CLI rebuild,
runtime policy fixtures and inspection of the emitted hooks. The new settings
screen and experimental playback options have not been tested in a device GUI.

See [implementation notes](docs/sbs-playback-preparation.md). When reporting a
problem include app/patch versions, phone and Android version, playback action
and a sanitized patching log. Do not include account tokens or private stream URLs.

See [SBS 6.4.0 QoL research](docs/qol-research-6.4.0.md) for the original investigation
and the [experimental settings guide](docs/mobile-settings-experimental.md) for
the implemented mobile subset and its validation limits.

## License and affiliation

Patch code is licensed under [GPLv3](LICENSE); see [NOTICE](NOTICE).
This project is not affiliated with SBS or the Morphe project. No SBS APKs,
decompiled app sources, account data or signing keys are distributed here.

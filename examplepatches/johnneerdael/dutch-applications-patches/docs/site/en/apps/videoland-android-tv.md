# Videoland Android TV

**Supported app:** 1.117.0 · **Build:** 1622 · **Input:** APKS · **Channel:** Pre-release

`nl.rtl.videoland.v2`

[Download the original APKS](https://buzzheavier.com/56tfd9zgaf6g){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Watching video can load ads and generate records about viewing activity, the device and the player. This TV build uses the Bedrock player with separate advertising and measurement paths. Use the complete TV split set.

These patches are only in the pre-release bundle (1.17.0-dev.4), not in stable v1.17.0. [Installing development builds](../guides/install.md#test-a-development-build) explains how to turn on pre-release patches for this source.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Video, banner and pause ads | The inspected code has separate requests for ads and ad breaks. | Hide ads returns the existing empty results before those requests are sent. |
| Yospace live video | The player can select an alternative from the received stream list when the ad resource is absent. | The patch uses that existing fallback when a suitable stream is available. |
| Tealium and [Snowplow](../trackers/snowplow.md) | The code collects app, screen and player events with identifiers. Snowplow also creates a startup event. | The inspected initialization, recording and sending paths stop. |
| NPAW and New Relic | Separate player-measurement and app-diagnostic paths are present. | The inspected player analytics and automatic initialization stop. |
| [Google/Firebase](../trackers/firebase.md) and [Meta](../trackers/meta.md) | Automatic measurement, advertising IDs and stored Google CCT uploads were found in code and configuration. | The inspected collection and uploads are disabled. Stored CCT batches complete locally without uploading. |

## What remains and what is still unknown

Content, login, consent, DRM and functional media services still use genuine server results. The patches do not change your subscription. No PairIP was found in this split set, and the observed startup worked without PairIPFix. The app needs Android 7.0 (API 24) or newer.

Playback with both controls and a Premium account is confirmed on a 32-bit ARM Android 14 TV. Ads on the paid ad-supported tier have not been tested yet. Ads already part of a broadcast or stream, and live playback without a suitable fallback, are outside any confirmed removal. [Report a successful test or a problem](https://github.com/johnneerdael/dutch-applications-patches/issues/new?template=videoland_test.yml).

## Available controls

Disable tracking, Hide ads.

Both are on by default, including in Simple mode. When you patch on a phone for a TV, leave Optimize for device architecture off.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against `4ce1498` for TV build 1622: [technical inspection](https://github.com/johnneerdael/dutch-applications-patches/blob/4ce1498035b21de8d427aeed923b980b77289e68/docs/research/2026-10-29-videoland-atv.md) and [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/4ce1498035b21de8d427aeed923b980b77289e68/patches/src/main/kotlin/patches/videolandatv). Code and Android runtime tests check the inspected paths, and the user confirms Premium playback. This is not a complete traffic audit. [How to read the evidence](../reference/methodology.md).

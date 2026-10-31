# Videoland Android TV

**Supported app:** 1.117.0 · **Build:** 1622 · **Input:** APKS

`nl.rtl.videoland.v2`

[Download the original APKS](https://buzzheavier.com/56tfd9zgaf6g){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Videoland can load ads and send records about viewing activity, the device and the player. These stable patches control the inspected advertising and measurement paths and make the catalogue easier to use with a free account. Use the complete TV split set.

Playback and navigation have been tested with both Premium and free accounts. With a free or TV Gemist account, the app keeps the episodes Videoland currently makes available to that account. The patches do not grant a subscription or unlock paid episodes.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Video, banner and pause ads | The inspected code has separate requests for ads and ad breaks. | Hide ads returns the existing empty results before those requests are sent. |
| Yospace live video | The player can select an alternative from the received stream list when the ad resource is absent. | The patch uses that existing fallback when a suitable stream is available. |
| Tealium and [Snowplow](../trackers/snowplow.md) | The code collects app, screen and player events with identifiers. Snowplow also creates a startup event. | The inspected initialization, recording and sending paths stop. |
| NPAW and New Relic | Separate player-measurement and app-diagnostic paths are present. | The inspected player analytics and automatic initialization stop. |
| [Google/Firebase](../trackers/firebase.md) and [Meta](../trackers/meta.md) | Automatic measurement, advertising IDs and stored Google CCT uploads were found in code and configuration. | The inspected collection and uploads are disabled. Stored CCT batches complete locally without uploading. |
| Subscription-only catalogue content | Videoland marks some primary actions as requiring a subscription. A series can contain both available and paid episodes. | Hide unavailable content removes those cards and subscription action buttons while keeping programme information and available episodes. |
| Empty seasons and later pages | An initial page can contain only unavailable episodes, and the app can retain a heading after its final episode disappears. | Later pages can still load. Confirmed empty season sections and their blank space are removed; available seasons remain. |

## What remains and what is still unknown

Login, consent, account rights, replay windows, parental and geographic restrictions, DRM and functional media services still use genuine Videoland results. On a free account, a series may therefore show only a few episodes or seasons. For example, a season with two available episodes keeps those two; seasons containing only subscription-required episodes disappear. Programme information remains accessible. The patch does not make older paid episodes playable. On Premium, content already available to the account remains visible and uses the normal player.

Unknown availability stays visible. An item can still fail when playback is requested if Videoland did not mark it as subscription-required. Loading and error states retain their normal handling, and the filter uses each refreshed account payload without destroying the original cached content.

Testing was performed on a 32-bit ARM Android 14 TV. The paid ad-supported plan has not been separately validated. Ads already embedded in a broadcast or stream, and live playback without a suitable fallback, are outside confirmed removal. No PairIP was found in this split set; Android 7.0 (API 24) or newer is required. [Report a successful test or a problem](https://github.com/johnneerdael/dutch-applications-patches/issues/new?template=videoland_test.yml).

## Available controls

Disable tracking, Hide ads, Hide unavailable content.

All three are on by default, including in Simple mode. They are independent controls. Leave Hide unavailable content off when patching if you prefer the original catalogue and subscription buttons; the other selected controls still apply. When you patch on a phone for a TV, leave Optimize for device architecture off.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026 against `2365dcb` for TV build 1622: [stable acceptance](https://github.com/johnneerdael/dutch-applications-patches/blob/2365dcb23f405fd4b675f8225d2cfce7838ba62c/docs/research/2026-10-30-videoland-stable.md), [technical inspection](https://github.com/johnneerdael/dutch-applications-patches/blob/2365dcb23f405fd4b675f8225d2cfce7838ba62c/docs/research/2026-10-29-videoland-atv.md), [catalogue filtering and season handling](https://github.com/johnneerdael/dutch-applications-patches/blob/2365dcb23f405fd4b675f8225d2cfce7838ba62c/docs/research/2026-10-30-videoland-hide-unavailable.md) and [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/2365dcb23f405fd4b675f8225d2cfce7838ba62c/patches/src/main/kotlin/patches/videolandatv). Native runtime tests and independent bytecode checks cover the inspected changes; the user confirms testing with Premium and free accounts. The TV check also confirmed that empty season headings disappear while available episodes remain. This is not a complete traffic audit. [How to read the evidence](../reference/methodology.md).

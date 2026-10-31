# NPO Start

**Supported app:** 1.48.2-2405 · **Build:** 240497937 · **Input:** APKS

`nl.uitzendinggemist`

[Download the original APKS](https://buzzheavier.com/ys1rjymo12zp){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Watching a programme can load preroll advertising and send audience, player and diagnostic events. The patches cover the Android phone and tablet build on Android 12L (API 32) or newer. Refresh the patch source in Morphe Manager, choose NPO Start and select the complete `npo-start.apks` input. Match build 240497937 as well as the version name; the Android TV input has a different build code.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Preroll and IMA ads | Five concrete preroll getters and an optional IMA loader feed the player. | Hide ads leaves these inputs empty and preserves the existing content-only path. |
| NPO Tag, Topspin and DAM | App and player events enter NPO Tag providers and the Govolte/Topspin and NMO DAM send paths. | Disable tracking empties the provider set and stops the inspected event and session producers. |
| STER targeting | Optional STER configuration and stream-request input provide advertising targeting. | Disable tracking removes those optional inputs while preserving content and DRM fields. |
| Sentry and Bitmovin analytics | The app includes diagnostic and player-measurement SDKs, including a Sentry startup performance provider. | Disable tracking stops the inspected boundaries and automatic collection flags and removes the performance provider. |
| Google telemetry and Cast diagnostics | DataTransport collects events and can upload historical CCT batches. Cast and advertising-ID diagnostics have separate producers. | Disable tracking stops the inspected collection and send boundaries; queued batches receive a typed local fatal response. Four advertising permissions are removed. |
| PairIP and functional media callbacks | This build protects startup, discovery, a receiver with media/audio/network branches and two asynchronous Cast artwork loaders. | Fix PairIP startup restores the exact startup data and functional callbacks, including genuine bitmap Binder requests and cached Cast icon inflation. |

## What remains and what is still unknown

Content, authentication, account/profile functions and DRM remain. NPO continues checking account entitlements, including Plus access. The original phone token-request implementation and its validation callbacks are unchanged. The patches do not create an account, subscription, token or DRM licence.

Broadcast advertising, advertising stitched into a stream and advertising on remote Cast receivers are outside this acceptance. Complete network silence, long-duration playback, every physical audio/network change and every ABI remain unverified. Removing the inspected tracking events can affect event-derived recommendations and history.

The input requires Android 12L (API 32) or newer. Updates between patched builds require the same signing key to retain app data. Use the complete original split set; a phone build and a TV build with the same package and version name are separate supported targets.

## Available controls

Disable tracking, Fix PairIP startup, Hide ads.

All three default on, including in Simple mode. Hide ads and Disable tracking include Fix PairIP startup. Functional Cast artwork and media buttons remain; diagnostic producers are controlled separately.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Validated on 30 October 2026: [phone port and PairIP investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-npo-start-phone.md). All 110,188 original-method contracts pass, together with captured startup/helper and manifest checks. Fifty-one actual-APK cases pass on Android 14 and Android 16 emulators, including real MediaSession delivery, asynchronous bitmap Binder transport and Cast icon cache behavior. Frida identified protected artwork tasks that failed before restoration and delivered their real results afterward. The corrected, Gadget-free APK updated the user's OnePlus Android 16 phone without clearing data; the user retried the failing action and confirmed it works. These checks do not establish complete traffic silence. [How to read the evidence](../reference/methodology.md).

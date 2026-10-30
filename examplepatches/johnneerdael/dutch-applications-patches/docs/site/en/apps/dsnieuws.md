# DS Nieuws

**Supported app:** 22.0.0 · **Build:** 2012316104 · **Input:** APKS · **Channel:** Pre-release

`com.twipemobile.dsmobile`

[Use your own APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Select this file in Morphe Manager to apply the patches.

This Mediahuis news app includes advertising and measurements of reading, interactions and player use. Its newspaper tab embeds a separate Twipe reader with additional logging and Engage Readers measurements. These prerelease controls have passed local patching, signing and decoded-output verification. Device testing remains unverified.

These controls are available in [pre-release v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4).

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising | Kaching receives native ad requests and creates video/audio preroll URLs. The callers already handle disabled results. | Hide ads returns the app's own disabled result for these requests. |
| Audience and interaction measurement | Mediahuis Glitr, Cxense, Google Analytics, Gemius and Comscore receive reading, screen, identity or player events in the inspected code. | Disable tracking stops the identified partner creation, event, attention, segment and video paths. |
| Diagnostics and video quality | Datadog, Mux, the separate Agnoplay data plugin, Firebase and Airship include diagnostics or analytics separate from delivery and push. | The inspected collection and startup paths stop; push registration and content delivery remain. |
| Embedded newspaper reader | The actual Twipe JavaScript contains Kinesis/HTTP logging and Engage Readers initialization, events and timers. | The reader's existing disabled logger transport completes locally, and the inspected Engage Readers paths stop. |
| Consent and Premium UI | Automatic consent, PayOrOk and onboarding lead to separate screens; publisher switches control paywall cards and subscribe buttons. | Skip consent screens persists normal onboarding completion without recording consent. Hide Premium banner hides those promotional surfaces. |

## What remains and what is still unknown

Article bodies and newspaper downloads use genuine server access decisions. Hide Premium banner cannot supply text or editions withheld by the publisher. Login, account status, push delivery, personalisation and alternative billing remain functional paths.

Original-input checks pass, and each selected control first failed on the original as expected. Each individual control and all controls together now pass patching, signing and decoded-output verification. Device testing remains pending. Playback, empty ad containers, offline reading, re-signed acceptance, remote embedded code and actual network traffic remain unverified. Configured destinations are not proof that every service receives traffic.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

All four controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both.

[Control definitions for this prerelease](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.20.0-dev.4/docs/site/en/reference/catalogue.md).

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/bf1741f/docs/dsnieuws-audit.md). The output verifier retains 1200 method contracts and 44 switch mappings. Eleven focused regression tests pass; controlled checks execute the actual emitted reader's telemetry promises. No patched app was installed and no runtime traffic capture was made for this audit. [How to read the evidence](../reference/methodology.md).

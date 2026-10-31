# DS Nieuws

**Supported app:** 22.0.0 · **Build:** 2012316104 · **Input:** APKS

`com.twipemobile.dsmobile`

[Download the original APKS](https://buzzheavier.com/xekgzljrg2lg){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

This Mediahuis news app includes advertising and measurements of reading, interactions and player use. Its newspaper tab embeds a separate Twipe reader with additional logging and Engage Readers measurements. The phone menu showed no Abonneer entry while the genuine Log in path remained available. This confirms the observed menu state; it does not establish article or edition access.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising and sponsored placements | Kaching supplies native ad and preroll requests. Separately, explicit sponsored-content parents contain Shop, Jobat, Zimmo and quiz promotions; DS also has a specifically identified New York Times subscriber banner. | Hide ads returns the app's disabled result for Kaching and filters those marked parent groups plus the exact NYT banner across homepage, article, section and local-group construction paths. The separate bottom-of-page Shop feed is also removed when its identified widget contract matches. |
| Audience and interaction measurement | Mediahuis Glitr, Cxense, Google Analytics, Gemius and Comscore receive reading, screen, identity or player events in the inspected code. | Disable tracking stops the identified partner creation, event, attention, segment and video paths. |
| Diagnostics and video quality | Datadog, Mux, the separate Agnoplay data plugin, Firebase and Airship include diagnostics or analytics separate from delivery and push. | The inspected collection and startup paths stop; push registration and content delivery remain. |
| Embedded newspaper reader | The actual Twipe JavaScript contains Kinesis/HTTP logging and Engage Readers initialization, events and timers. | The reader's existing disabled logger transport completes locally, and the inspected Engage Readers paths stop. |
| Consent and Premium UI | Automatic consent, PayOrOk and onboarding lead to separate screens; the subscription getter also controls the Abonneer menu row. | Skip consent screens persists normal onboarding completion without recording consent. Hide Premium banner hides promotional surfaces and the Abonneer row; the separate genuine Log in path remains available. |

## What remains and what is still unknown

Article bodies and newspaper downloads use genuine server access decisions. Hide Premium banner cannot supply text or editions withheld by the publisher. Login, account status, push delivery, personalisation and alternative billing remain functional paths.

The phone menu showed no Abonneer entry while the genuine Log in path remained available. The owner confirmed the corrected bottom-of-page Shop behavior in Nieuwsblad and approved both apps for stable release after the shared correction. The DS-specific output also passed its own widget and retained-behavior checks. An update dialog traced in static analysis belongs to AuthProvider migration; the reviewed code did not show a code-push path, and this migration is separate from the Play update flow. Playback, server article/edition rights and actual network traffic remain unverified; configured destinations alone do not prove a request was sent.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

All four controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/dsnieuws-audit.md). The current output verifier retains 1242 method contracts and 45 switch mappings. Changed controls and their combined output pass FULL patching, signature and decoded-behavior checks. The final shared Shop correction passed Hide ads and combined-output verification for this app. The owner approved release of both apps; the phone observations cover the tested screens, and no network capture was performed. [How to read the evidence](../reference/methodology.md).

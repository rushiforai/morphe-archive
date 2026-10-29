# Dumpert

**Supported app:** 5.8.0 · **Build:** 22001778 · **Input:** original Play APKS · **Android:** 12L / API 32 or newer

`nl.dumpert`

[Download the original APKS](https://buzzheavier.com/nh0wyw185itn){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The inspected Dumpert app collects central usage statistics and separately sends events for recommendations. The tracking controls cover both sets of measurements. Watching clips and submitting kudos remain possible. These measurements use identifiers: values that can link successive records to the same installation or account.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising | The code builds ad and auction requests with a PPID (publisher-provided ID) or hashed advertising ID, available account and profile IDs, and data about the content, player and consent. | The patch suppresses built-in feed and banner ads and attachments for ads before videos on detail pages and in Shorts. Required player components remain initialized. |
| First-party PostRec | `api-dms.dumpert.nl/api/v1.0/post-rec/…` receives events about views, videos, progress and kudos used for recommendations, optionally including a login token and Cxense ID. | The separate sender stops even when remote configuration enables it. Kudo and favourite submissions are still processed normally. |
| Piano/Cxense and [Comscore](../trackers/additional-services.md#audience-measurement) | The code review traced pageviews, segments, identity links and audience measurement. Central events include data about login and Deluxe. | Collection, targeting, optional PPID, advertising and App Set IDs, and audited queued sends stop. Queue callbacks still report whether a record was actually sent. Old, unsent Piano records may remain until they expire. |
| [Firebase](../trackers/firebase.md) and [Meta/Facebook](../trackers/meta.md) | The audit identified app, screen, purchase, share and video events, identifiers, diagnostics, and session and push statistics. | The patches suppress collection, including attempts to re-enable it while the app runs. They filter previously stored Firebase batches of measurement and diagnostic data before sending. The app is not falsely told they were delivered. Functional services remain. |
| [Didomi](../trackers/didomi.md) | Didomi displays automatic consent screens and also handles initialization, vendor and purpose choices, and preferences you set yourself. | The patch skips automatic screens without saving acceptance or rejection. The consent platform’s optional metrics were not independently isolated. |

## What remains and what is still unknown?

Content, accounts, comments, uploads, real purchases, push and privacy configuration remain. They still use necessary connection and service identifiers. Facebook login and Firebase authentication and configuration remain initialized.

The Cast client and Play Billing library can still send diagnostic data; the exact contents were not fully audited. Remote social players and advertising inserted by the server remain unverified. The patches do not act as a universal web or network filter.

## Available controls

All three are enabled by default in stable **v1.9.0**:

- Hide ads removes native ads and subscription promotions. The local account wording that describes Deluxe or ad-free use, and the hidden Free price, do not grant real Deluxe access. Genuine subscriber product details and management remain.
- Disable tracking includes Hide ads and stops the audited usage measurements, optional identifiers, targeting, diagnostics and queued sends.
- Skip consent screens includes both controls. You can still open privacy settings yourself, and your actual saved choices remain.

See [installation](../guides/install.md), [choosing patches](../guides/choose-patches.md) and the [catalogue](../reference/catalogue.md).

## Evidence

Reviewed **28 October 2026** against main `8ca0ddb`: [implementation audit](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/docs/dumpert-audit.md) and [destination/control catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/README.md#dumpert). After v1.9.0-dev.2, the user approved the stable release, including the account and promotion cleanup. This approval does not establish behaviour on every device or in every billing scenario, and does not provide a complete capture of network traffic. [How to read the evidence](../reference/methodology.md).

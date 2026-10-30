# Dumpert

**Supported app:** 5.8.0 · **Build:** 22001778 · **Input:** APKS

`nl.dumpert`

[Download the original APKS](https://buzzheavier.com/nh0wyw185itn){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The inspected Dumpert app collects central usage statistics and also sends its own events for recommendations. The tracking controls cover both sets of measurements. You can still watch clips and give kudos. These measurements use identifiers, values that can link successive records to the same installation or account.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising | The code builds ad and auction requests with a PPID (publisher-provided ID) or hashed advertising ID, available account and profile IDs, and data about the content, player and consent. | The patch suppresses built-in feed and banner ads and the attachments for ads before videos on detail pages and in Shorts. Required player components stay initialized. |
| First-party PostRec | `api-dms.dumpert.nl/api/v1.0/post-rec/…` receives events about views, videos, progress and kudos for recommendations, optionally with a login token and Cxense ID. | This separate sender stops, even when remote configuration enables it. Kudos and favourites are still processed normally. |
| Piano/Cxense and [Comscore](../trackers/additional-services.md#audience-measurement) | The code review traced pageviews, segments, identity links and audience measurement. Central events include data about login and Deluxe. | Collection, targeting, the optional PPID, advertising and App Set IDs, and the audited queued sends stop. Queue callbacks still report whether a record was actually sent. Old, unsent Piano records can remain until they expire. |
| [Firebase](../trackers/firebase.md) and [Meta/Facebook](../trackers/meta.md) | The audit identified app, screen, purchase, share and video events, identifiers, diagnostics, and session and push statistics. | The patches suppress collection, including attempts to re-enable it while the app runs. They filter previously stored Firebase batches of measurement and diagnostic data before sending, without falsely telling the app that those batches were delivered. Functional services remain. |
| [Didomi](../trackers/didomi.md) | Didomi shows automatic consent screens and also handles initialization, vendor and purpose choices, and preferences you set yourself. | The patch skips the automatic screens without saving acceptance or rejection. The consent platform's optional metrics were not isolated separately. |

## What remains and what is still unknown

Content, accounts, comments, uploads, real purchases, push and privacy configuration keep working. They still use the connection and service identifiers they need. Facebook login and Firebase authentication and configuration stay initialized.

The Cast client and the Play Billing library can still send diagnostic data, and their exact contents were not fully audited. Remote social players and advertising inserted by the server remain unverified. The patches do not act as a general web or network filter. Use the original Android 12L+ Play split set.

## Available controls

Disable tracking, Hide ads, Skip consent screens.

All three are on by default. Hide ads removes native ads and subscription promotions. It shows local account wording that describes Deluxe or ad-free use and hides the Free price, but this does not grant real Deluxe access. Genuine subscriber product details and subscription management remain.

Disable tracking includes Hide ads and stops the audited usage measurements, optional identifiers, targeting, diagnostics and queued sends. Skip consent screens includes both other controls. You can still open the privacy settings yourself, and the choices you actually saved stay in place.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `8ca0ddb`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/docs/dumpert-audit.md) and [destination and control catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/README.md#dumpert). After v1.9.0-dev.2 the user approved the stable release, including the account and promotion cleanup. That approval does not establish behaviour on every device or in every billing scenario, and it is not a complete capture of network traffic. [How to read the evidence](../reference/methodology.md).

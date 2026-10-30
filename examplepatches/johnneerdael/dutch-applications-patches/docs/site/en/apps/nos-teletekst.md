# NOS Teletekst

**Supported app:** 2.8.10 · **Build:** 62 · **Input:** APKS

`com.eoffice.android`

[Download the original APKS](https://buzzheavier.com/xse5agsu2tia){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Reading Teletekst pages generates NOS/NPO audience measurements, and the scoreboard page shows a recurring promotion for the NOS app. The patches stop the inspected measurements and that promotion. No commercial ad loader or paid-content gate wired into the app was found in this version. The user reported successful phone testing and approved main publication on 29 October 2026.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| `topspin.npo.nl/mob-event` | The app queues page and subpage views, navigation, favourite, share and promotion interactions, and visibility activity. Each record carries event, party, session and DAM IDs, timestamps and app, device and screen context. | Disable tracking prevents the NOS/NPO analytics from being built, including its persistent queue and visibility heartbeats. The app gets NOS's own empty tracker instead, so event calls complete normally without building the SDK or inventing a send result. |
| `nmonpoendpoint.2cnt.net` | A separate NMO request sends the DAM identifier (`cs_fpid`) and vendor, with at least 24 hours between submissions. | Disable tracking also prevents this service from being initialized. |
| NOS-app promotion | A native scoreboard dialog promotes the NOS app on the third eligible visit to page 818. | Hide promotions stops the check that triggers it, before the dialog is shown and before promotion visits are counted. Page 818 remains usable. |
| `teletekst-data.nos.nl` | Provides Teletekst content and refresh. | Preserved, along with favourites, sharing and native page rendering. |

## What remains and what is still unknown

Existing local tracking IDs and queued records stay on the device. The patched process does not initialize their SDK. Generated tracking IDs can link activity without an advertising ID or account. Content requests still expose ordinary network information, such as your IP address, to the server.

Google Play security-provider setup and the TV-only informational privacy notice remain. The app bundles dormant Piano/ATInternet code, and its presence is no evidence of active collection. These findings come from source inspection. They are not a decrypted analytics capture or proof of complete phone behaviour. Use the complete original Android 6+ Play split set of this exact version, since the store version can differ.

## Available controls

Disable tracking, Hide promotions.

Both controls are on by default and work independently of each other.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against main `1edd321`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/teletekst-audit.md), [implementation](https://github.com/johnneerdael/dutch-applications-patches/tree/1edd321fd8bb94354f25b2462ebe9e51335740ca/patches/src/main/kotlin/patches/teletekst) and [destinations, data and remaining services](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/privacy/nos-teletekst/README.md). Checks on the original APK and on FULL rebuilt APKs cover both controls separately and together, the native tracker, promotion and lifecycle paths, and 148 retained method graphs. The audit records the user's phone acceptance. That acceptance does not establish a decrypted traffic capture or an exhaustive Android device test matrix. [How to read the evidence](../reference/methodology.md).

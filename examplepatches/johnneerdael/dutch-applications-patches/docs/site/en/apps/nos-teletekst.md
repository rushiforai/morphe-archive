# NOS Teletekst

**Supported target:** 2.8.10 · **Build:** 62 · **Input:** original Play APKS · **Android:** 6 / API 23 or newer

`com.eoffice.android`

[Official app listing](https://play.google.com/store/apps/details?id=com.eoffice.android){ .md-button .md-button--primary }

Use the complete original split set of this exact version. The store version can
differ. See [original files](../guides/downloads.md) and [installation](../guides/install.md).

The patches stop the inspected NOS/NPO audience measurements and
recurring NOS-app promotion. The user reported successful phone testing and approved main publication on 29 October 2026. No application-wired
commercial ad loader or paid-content gate was established in this version.

## Activity and patch effects

| Destination / activity | What the inspected app does | What changes |
| --- | --- | --- |
| `topspin.npo.nl/mob-event` | Queues page/subpage views, navigation, favourite/share/promotion interactions and visibility activity with event/party/session/DAM IDs, timestamps and app/device/screen context. | Disable tracking prevents NOS/NPO analytics construction, including its persistent queue and visibility heartbeats. |
| `nmonpoendpoint.2cnt.net` | An independent NMO request sends the DAM identifier (`cs_fpid`) and vendor, with a minimum 24-hour submission interval. | The same control prevents this service from being initialized. |
| NOS-app promotion | A native scoreboard dialog promotes the NOS app on the third eligible page-818 visit. | Hide promotions stops its predicate before display or promotion visit counting. Page 818 remains usable. |
| `teletekst-data.nos.nl` | Provides Teletekst content and refresh. | Preserved, along with favourites, sharing and native page rendering. |

## Available controls

Both controls are enabled by default and independent of each other.

- Disable tracking returns NOS's native empty tracker. Event calls complete
  normally without constructing the SDK or inventing a send result.
- Hide promotions prevents the identified NOS-app dialog before display.

[Exact catalogue and defaults](../reference/catalogue.md).

## Remaining connections and evidence limits

Existing local tracking IDs and queued records are retained. The patched process
does not initialize their SDK. Generated tracking IDs can link activity without
an advertising ID or account. Content requests still expose ordinary network
information such as IP address to the server.

Google Play security-provider setup and the TV-only informational privacy notice
remain. Bundled dormant Piano/ATInternet code is not evidence of active collection.
These are source-based findings, not a decrypted analytics capture or proof of
complete phone behaviour.

## Evidence

Reviewed on 29 October 2026. Original and FULL rebuilt APK checks cover both
controls separately and together, native tracker/promotion/lifecycle paths and
148 retained method graphs. User-reported phone acceptance is recorded in the audit.
[How to read the evidence](../reference/methodology.md).

[implementation](https://github.com/johnneerdael/dutch-applications-patches/tree/1edd321fd8bb94354f25b2462ebe9e51335740ca/patches/src/main/kotlin/patches/teletekst) · [implementation audit](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/teletekst-audit.md) · [destinations, data and remaining services](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/privacy/nos-teletekst/README.md).

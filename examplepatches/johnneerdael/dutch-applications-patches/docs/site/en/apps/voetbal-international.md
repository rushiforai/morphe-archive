# Voetbal International

**Supported app:** 5.13.52 · **Build:** 910 · **Input:** APKS

`nl.vi`

[Download the original APKS](https://buzzheavier.com/93s2c0j8pw5n){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The patches request complete article bodies through the shipped PXR client, remove the inspected locked Pro overlays, and stop the identified advertising and optional measurements. Your actual account and subscription state stay as they are. The user reported working Pro content and approved publication on main on 29 October 2026. The approved build includes the publisher-marketing filter.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Pro articles | The shipped app-header route returned complete content for two sampled Pro articles. The public route had returned a teaser/paywall. | Read full articles uses that native request path and removes the inspected paywall/carousel overlays. A cached teaser takes the native reload path. |
| Advertising | Display, interstitial, legacy banner and separate feed/single-video ad paths were inspected. JW also supports remotely configured ad schedules and plugins. | Hide ads stops the inspected activation paths before requests or display. Native dismissal and cancellation still continue article navigation. |
| Publisher promotions | The public home feed contained five `marketingBlock` records, including the reported print-special promotion. | Hide ads removes the native Marketing type before grid layout and stops its renderer for cached entries. Changed campaign titles and destinations do not get past this filter. |
| Reading and viewing measurements | Firebase, comScore, BlueConic and JW player analytics contain independent collection paths. Screen/article/player context and optional identifiers can support audience measurements and profiles. | Disable tracking blocks the audited entries, identifier lookups, known stored uploads and JW analytics activation. |
| Consent setup | Startup requests a remote advertising-consent update. The manual form has a separate entry point. | Skip consent screens stops both entries before forms appear. It does not store acceptance or rejection. The local age check for betting features remains. |

## What remains and what is still unknown

Article PRO labels can remain as metadata while a full body is readable. The patches do not create a paid account or subscription. Video licensing and other server-controlled benefits remain with the publisher.

Account authentication, Billing, live scores, push infrastructure and required player resources remain. These functional services can still exchange identifiers and IP information. Unknown transport names and remote web content fall outside complete tracking suppression. Ads embedded in the media stream are not proven removed.

Use the complete original Android 12L+ Play split set for this version.

## Available controls

Disable tracking, Hide ads, Read full articles, Skip consent screens.

All four are on by default. Read full articles works independently of the privacy controls. It preserves genuine authentication, purchases and subscription state, and strips the headers it adds from redirects outside the permitted article route.

Hide ads suppresses the inspected display and video advertising and the publisher marketing cards, while articles, content playback and navigation keep working. Disable tracking includes Hide ads and also blocks optional identifiers, profiling and the known stored measurement paths. Skip consent screens includes both privacy controls. It stops consent forms at startup and when reopened manually, before they appear, without recording acceptance or rejection.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against `07ea928`: [implementation](https://github.com/johnneerdael/dutch-applications-patches/tree/07ea928617664f5bc7e271d6d4afc80bae058e7b/patches/src/main/kotlin/patches/vi), [implementation audit](https://github.com/johnneerdael/dutch-applications-patches/blob/07ea928617664f5bc7e271d6d4afc80bae058e7b/docs/voetbal-international-audit.md) and [destinations, data and remaining services](https://github.com/johnneerdael/dutch-applications-patches/blob/07ea928617664f5bc7e271d6d4afc80bae058e7b/docs/privacy/voetbal-international/README.md). Checks on the original and rebuilt APKs run the changed application paths with explicit platform and SDK boundaries. They do not establish complete behaviour on a phone and include no decrypted traffic capture. [How to read the evidence](../reference/methodology.md).

# TVgids.nl

**Supported app:** 7.0.16 · **Build:** 106691 · **Input:** APK

`nl.tvgids`

[Download the original APK](https://buzzheavier.com/tgxpzbzghwec){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Using the guide can send page, item, campaign and event context to the publisher's OSB collector, together with an account link, session ID, advertising ID and, when you allow it, your location. A push message received in the background triggers a separate report with a device ID. The app also contains Comscore, Sentry, Facebook and Firebase measurement and native advertising.

TVgids.nl is in the stable bundle from v1.19.0. The user tested the app on a phone, including the removal of the automatic consent screen, and approved the release.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| OSB collection and consent page | Page, item, campaign and event context with account linkage, a session ID, the advertising ID and location when permission is given. The consent page URL can use a cached `osb-cduid`, the advertising ID or the Android ID. | Disable tracking stops session ID creation, identifier collection and publication, foreground events, location and resume work, the queue and the final upload. Manual consent and configuration remain; the consent page URL gets an empty `cduid`. |
| OSB background push report | A `received_background` POST with a device ID, app and device User-Agent and notification, campaign and push fields. It bypasses the foreground collector. | Disable tracking stops the report before the device ID lookup and request construction. Firebase setup and cache cleanup keep their original code. |
| [Comscore](../trackers/additional-services.md#audience-measurement) | Audience and page measurement, publisher and site configuration, content and category values and a generated `cs_fpid`. The contacted hosts and payloads were not captured. | The start, configuration, page and identifier paths in the app and the native collector stop. This is app and media measurement; there is no evidence of microphone recording. |
| Sentry | Error and crash diagnostics with associated context; the full runtime payload was not observed. | Disable tracking follows the empty-DSN decision into the SDK's no-op state and stops native activation and the inspected startup providers. The DSN value and native libraries remain in the APK. |
| [Meta/Facebook](../trackers/meta.md) | App event names and parameters, an anonymous app-device GUID, optional advertising ID attribution, app identity and install attribution. | Event and advertising ID settings, event processing, timers, reading and sending stored events, and attribution jobs are blocked. Core initialization, settings and login you start yourself remain, so functional Facebook requests can still occur. |
| [Firebase](../trackers/firebase.md) messaging measurement | Delivery metrics can include message and installation identity, project and package details, priority, TTL, topic and campaign labels. Export is off by default here, but restored preferences or API calls can turn it on. No Firebase Analytics registrar was found. | Receive and open analytics and re-enabling export are blocked. Stored batches lose their delivery and client metrics. Batches with only telemetry are discarded through the app's own error handling; other event types keep their real outcomes and retries. |
| Advertising and promotions | Native ad SDK startup and loading, an ad-only configuration request, house-ad fallbacks, the NLZIET promotional bar with affiliate parameters and explicitly branded home items. | Hide ads removes the ad slots and their reserved space, house-ad fallbacks, the NLZIET bar and branded home items, and stops the ad-only configuration request and native ad startup and loading. Not every possible ad hostname is listed. |

## What remains and what is still unknown

The guide, search, editorial content, account services, saved items, manual privacy choices and functional messaging keep working. Firebase Installations, FCM tokens, topics, notifications and reminders remain, and the patch does not make these identifiers anonymous. Channel banners without a proven advertising marker stay, as do provider and media links you open yourself. External players, embeds such as YouTube and Instagram, and linked services can collect data on their own. Functional services still receive requests and ordinary connection information.

The original consent converter stores a local `ANALYTICS_STORAGE=GRANTED` label even when you reject advertising consent. Tracking stays blocked after either choice, and that label alone is no evidence of an upload. Local history and records held by providers are not erased. Whether the server accepts the consent page with an empty `cduid` still needs phone testing. No phone traffic capture was made and we do not claim a complete absence of tracking. Use an original standalone APK of this exact version, on Android 8.0 (API 26) or newer.

## Available controls

Disable tracking, Hide ads, Skip consent screens.

All three are on by default. Disable tracking includes Hide ads, and Skip consent screens includes both.

Skip consent screens stops the automatic consent screen after the app's own initialization has finished, before the consent page URL is built or opened. When you open the consent screen yourself, the original URL and navigation stay. Existing choices remain and no accepted or rejected answer is stored on your behalf. The tracking dependency keeps the optional collectors blocked whatever consent is cached.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against main `1817cc2`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/1817cc2/docs/tvgids-nl-audit.md), [destinations, data and remaining services](https://github.com/johnneerdael/dutch-applications-patches/blob/1817cc2/docs/privacy/tvgids-nl/README.md) and [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/1817cc2/patches/src/main/kotlin/patches/tvgids). Native execution of the consent change passes 54 cases across the three packaged architectures, including the manual consent route, and rejects nine deliberate mutants. FULL rebuild, signing and decoding checks pin 270 original Android method graphs and the 24 native libraries, and bounded instruction tests run on the three packaged architectures (arm64-v8a, armeabi-v7a and x86_64). They do not render the Flutter interface, deliver real push messages or prove that all traffic is gone. [How to read the evidence](../reference/methodology.md).

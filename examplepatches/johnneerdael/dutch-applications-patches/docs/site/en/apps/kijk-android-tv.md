# KIJK Android TV

**Supported app:** 7.2.7 · **Build:** 10003 · **Input:** APKS

`com.talpa.kijk`

[Download the original APKS](https://buzzheavier.com/oh3usdc9o9xi){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The TV app loads its interface and video player from KIJK's servers in a WebView. Watching a programme can request client video ads and pause ads, and the hosted player loads measurement scripts from several providers. That player can change on the server without an APK update. In Morphe Manager, refresh the patch source, choose KIJK Android TV and select `kijk-atv.apks` as the original input. The phone app is a separate target.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| FreeWheel video ads and pause ads | The hosted player requests FreeWheel ad decisions and attaches client ad schedules (VAST/VMAP). A separate path shows pause ads. | Hide ads returns an empty schedule for the identified FreeWheel decisions, removes the client ad schedule and stops pause-ad display. The content source stays the same. |
| Advertising ID and ID5 | A native bridge passes the advertising ID to the hosted app. The hosted configuration enables ID5 identity matching and keeps a cached ID5 identifier. | Disable tracking removes the advertising-ID result, reports ad tracking as limited, turns the ID5 setting off, clears the cache and blocks matching requests. |
| Tealium and TVA measurement | The hosted player loads Tealium tags and KIJK's TVA measurement script. The exact event fields were not captured. | Disable tracking replaces the TVA script with an empty response and answers TVA and Tealium calls locally with empty or no-content responses. |
| Conviva, Google Analytics and Sentry | The hosted configuration enables player measurement through Conviva, usage measurement through Google Analytics and error reporting through Sentry. | Disable tracking turns these settings off and blocks matching requests. |
| Hosted app and its cache | The interface and player scripts come from `prd.smarttv.talpavideo.nl`. The `/android/sw.js` service worker can serve cached, unmodified files that bypass the patch. | The patch applies its changes before the scripts run and stops that one worker from registering. Other content stays original. |

## What remains and what is still unknown

Content, accounts, OneTrust consent and DRM services still receive functional requests, and their operators still see ordinary connection information. The patches do not create an account entitlement or a DRM licence. Broadcast ads and ads already stitched into the stream are outside the verified client-ad changes. The checks so far do not establish that every tracking request has stopped.

Start with a clean installation. An older installation can keep a service worker that serves the unpatched player from its cache. Clearing app data also removes sign-in and consent choices.

Seeking beyond the buffered video, live streams, casting and midroll transitions still need broader testing. If playback changes, report the app version, the selected patches and the programme or channel. Keep credentials and account tokens out of reports. Use the complete original TV APKS on Android 8.1 (API 27) or newer.

## Available controls

Disable tracking, Enable WebView debugging, Hide ads.

Hide ads and Disable tracking are on by default. Enable WebView debugging is off by default. It allows local inspection of the hosted player, so leave it off for everyday use.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against `2190e42`: [TV research and test evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/2190e42b1877badaca7a8e1e520e83aa7e95d90a/docs/research/2026-10-29-atv.md), [destinations and data](https://github.com/johnneerdael/dutch-applications-patches/blob/e2c30be/docs/privacy/kijk-android-tv/README.md) and [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/2190e42b1877badaca7a8e1e520e83aa7e95d90a/patches/src/main/kotlin/patches/kijkatv). Free episodes have played on Android 9 and Android 14 TVs. On the Android 9 box, Widevine playback and pause and resume were observed, and a FreeWheel decision was intercepted. The user confirmed ad-free playback on the target Android 14 TV. These are bounded playback tests, not a complete traffic capture. [How to read the evidence](../reference/methodology.md).

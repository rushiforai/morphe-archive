# KIJK Android TV: destinations and data

Target: `com.talpa.kijk` **7.2.7 / 10003**, original Android TV APKS.
These notes summarize the [request policy](../../../extensions/atv/src/main/java/patches/atv/KijkPolicy.java).
The phone app is a separate target. Host rules/configuration are not a complete
traffic capture or a field-by-field account of what each provider received.

| Destination and evidence | Purpose and data scope | Patch effect / remaining service |
| --- | --- | --- |
| `fwmrm.net` family — inspected FreeWheel decision rule; interception observed in the recorded playback test | Client advertising decisions and schedules. Full request fields were not captured. | Hide ads supplies empty VMAP for the identified decisions and stops the inspected client schedule/pause-ad paths. Broadcast/server-stitched ads remain outside this evidence. |
| `static.kijk.nl/(prod,acc,dev)/js/tva.min.js` — inspected hosted measurement script | TVA app/player measurement; full event payload fields remain unverified. | Disable tracking replaces this exact script path with an empty response and provides bounded TVA call sinks. Other static content remains. |
| `tiqcdn.com`, `tealiumiq.com` families — inspected Tealium request rules | Tag loading and measurement collection; exact runtime event payloads remain unverified. | Disable tracking supplies empty JavaScript or no-content measurement responses for these rules. |
| `id5-sync.com` family — inspected identity configuration/cache and request rule | Identity matching; the code/configuration includes ID5 state and a cached identifier. | Disable tracking pins the identified settings off, clears the inspected ID5 cache and blocks matching requests. |
| `conviva.com` family — inspected configuration/request rule | Player/audience measurement; exact transmitted fields remain unverified. | Disable tracking pins the identified setting off and blocks matching measurement requests. |
| `google-analytics.com`, `analytics.google.com` families — inspected configuration/request rules | App/site usage measurement; exact runtime fields remain unverified. | Disable tracking pins the identified setting off and blocks matching requests. |
| `sentry.io` family — inspected configuration/request rule | Error/diagnostic measurement; exact runtime context remains unverified. | Disable tracking pins the identified setting off and blocks matching requests. |
| `prd.smarttv.talpavideo.nl` — functional hosted application | App HTML, player scripts and configuration. The remote frontend can change independently of the APK. | Original functional content remains; the wrapper applies the inspected ad/privacy changes before scripts execute. The specific `/android/sw.js` cache worker is disabled so stale assets cannot bypass the policy. |
| Account, OneTrust consent, content/CDN and DRM endpoints — exact runtime host inventory incomplete | Genuine consent/account requests, media and license delivery; ordinary connection information remains visible to service operators. | These services remain. The patch does not create an account entitlement or DRM license and does not establish anonymity. |

The native advertising-ID result is removed and advertising limitation is reported
when Disable tracking is selected. WebView debugging is a separate, off-by-default
control. Use the [app guide](../../site/en/apps/kijk-android-tv.md) for clean-install
and service-worker acceptance limits. Recorded free-VOD/DRM/pause/resume checks do
not establish complete network silence; live streams, remote seeking, casting,
pairing and premium media have separate acceptance scope.

[All app READMEs](../README.md).

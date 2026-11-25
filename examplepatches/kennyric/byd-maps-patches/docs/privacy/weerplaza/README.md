# Weerplaza

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Use the original Play Store split APK set (Android 8+).

| Patch | Effect |
| --- | --- |
| Hide ads | Disables native and video ad loaders, removes app ad containers and filters evidenced ads in the app's WebViews. |
| Hide Premium banner | Hides Premium menus, automatic promotions and locked-feature upsells. |
| Disable tracking | Disables identified analytics, advertising identifiers, optional telemetry and known WebView collectors. Includes Hide ads. |
| Skip consent screens | Bypasses automatic cookie and ad-or-Premium prompts without recording acceptance. Includes Disable tracking and Hide ads. |
| Fix Google Maps | Supplies the authorized community Maps key after re-signing. Included by the other Weerplaza patches; the separate Firebase configuration stays unchanged. |

These controls do not create a subscription.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `googletagmanager.com`, `google-analytics.com` | **Fetched web source + SDK integration:** the weather webapp loads a GTM/GA tag; analytics measures app/web activity. Loader presence does not prove a completed event upload. | Known web hosts blocked and inventoried native analytics disabled by Disable tracking. |
| `analytics.infraloods.nl` | **Fetched iframe source:** a Plausible-style script configured for `fotoloods.nl` page measurement. | Collector/script host covered by the web policy; photo content retained. |
| `stats.bluebillywig.com`, `scorecardresearch.com`, `sentry.io`, `report.error-report.com`, `pushalert.co` | **Audited web policy:** video/audience measurement, diagnostics and push-related measurement destinations. Exact remote payloads not captured. | Known requests blocked in the audited WebView; inventoried native video/diagnostic sinks also stopped. |
| `api.privacy-center.org/v1/events`, `/v1/sync`; `imweather.com/api/auth/_log` | **Path-specific policy:** consent event/sync and auth diagnostic routes. Other routes serve functional privacy/authentication. | Only identified routes blocked; no blanket authentication/consent host block. |
| `doubleclick.net`, `googlesyndication.com`, `googleadservices.com`, `adnxs.com`, `pubmatic.com`; `html-load.com`, `content-loader.com`, `css-load.com`, `html-load.cc`, `img-load.com`, `ad-delivery.net`, `cadmus.script.ac` | **Audited ad policy:** creative loaders/ad delivery and associated measurement. A blocklist match is not a per-host traffic capture. | Hide ads blocks the identified resources and native loaders; weather, Maps, purchases and functional push retained. |

</details>

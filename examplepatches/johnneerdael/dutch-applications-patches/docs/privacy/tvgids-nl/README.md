# TVgids.nl (research only)

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Version **7.0.16**. [Research evidence](../../research/2026-10-28/tvgids-nl.md). No controls published yet.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Status / functional boundary |
| --- | --- | --- |
| `voorkeuren.tvgids.nl` | **Traced OSB foreground/config/CMP:** page/event/impression and page/item/campaign context, account ID, cached OSB ID or advertising-ID/Android-ID fallback, plus permission-dependent location collection. | No control released yet. Consent/context updates share owners with uploads and need separate treatment. |
| `voorkeuren.tvgids.nl/v1/_` | **Traced independent background-push POST:** `received_background`, device_unique_id, device/app User-Agent and notification/campaign/push fields. | No control released yet. Blocking only foreground page/event methods would miss this sender; real notification delivery/reminders must remain functional. |
| `b.scorecardresearch.com`, `sb.scorecardresearch.com`, `udm.scorecardresearch.com`, `census-app.scorecardresearch.com` | **Traced Comscore integration / native-library destinations:** NMO content/category measurement, generated FPID and site context. All three packaged native ABIs contain these hosts; transfers were not captured. | No control released yet. This evidence concerns app/media measurement, not microphone recording. |
| `sentry02.isource.nl` | **Configured Dart Sentry integration:** diagnostics. Its initialization also invokes the actual application runner. | No control released yet. A replacement must still call the app runner; merely disabling its entry would stop startup. |
| `json.tvgids.nl/v7/`, `tvgidsassets.nl`; YouTube/Instagram and remote embeds | **Functional/mixed services:** guide/editorial/account, ad configuration and images including house-ad fallback assets; external players can add separate collection. | No control released yet. Native ad acknowledgement, Dart layout/house fallback and video ads need coordinated handling; ARM64 was examined, other AOT ABI behavior remains unverified. |

</details>

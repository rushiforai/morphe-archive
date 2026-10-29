# FTM

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the original Play Store split APK set, **2.6.8 / 58**, Android 12L+. FTM loads its live website inside a native WebView, so the controls preserve its existing browser client, audio, locale, sharing and notification bridges.

| Patch | Effect |
| --- | --- |
| Hide ads | Hides positively classified automatic book-shop announcements while preserving service notices, manual forms and the existing share-toolbar close behavior. |
| Disable tracking | Blocks the identified web collector hosts and comments-visibility collector, suppresses native FCM analytics exports and removes the five identified Eventor storage keys after page load. Includes Hide ads. |
| Skip consent screens | Skips the account offer after edition selection as a guest, and hides the automatic cookie notice. Keeps edition selection, manual login and existing consent values. Includes Disable tracking. |
| Hide Premium banner | Hides the observed automatic trial promotions, subscription trust nugget and account-required thumbnail decoration; suppresses the article marketing decision through its supported empty response. |
| Read full articles | Prevents the known article decision flow from deleting body content already supplied by the website; preserves its normal completion callbacks. |

Individual and combined artifacts passed off-device checks, including the emitted request policy, callback completion, retained app components and Android call kinds. Real-browser checks cover the publisher's CSS priority, later stylesheet changes and future cards. Phone checks reached the final article paragraph and confirmed podcast playback. Read-only comparisons found the same editorial paragraphs in three anonymous article responses and the same audio file in one anonymous podcast response. The user confirmed the installed permanent overlay fix and approved stable release on 2026-10-28. The user approved the post-edition guest skip and its earlier navigation refinement for stable publication on 2026-10-28. The edition Continue action uses the original guest route before the account page loads; manual login remains available. These samples do not prove universal or permanent access or recover withheld content. Other ad containers, temporary identifier creation before cleanup and some first-party request classifications remain open. See the [FTM audit](../../FTM_TRACKING_AUDIT.md).

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `insight.ftm.nl` | **Inspected web sender:** Matomo page, error and event measurement. | Host/subdomains blocked in the app WebView by Disable tracking. |
| `eventor.ftm.nl` | **Inspected web sender:** event uploads and identifier updates; five Eventor local-storage keys support this linkage. | Requests blocked; those five keys cleaned after page completion. Temporary identifier creation before cleanup remains a limit. |
| `glitchtip.ftm.nl` | **Inspected web sender:** Sentry/GlitchTip errors and diagnostic context. | Host/subdomains blocked. |
| `diffuser-cdn.app-us1.com` | **Inspected web integration:** ActiveCampaign tracking loader/collector. | Host/subdomains blocked; loader blocking is distinguished from proof of an uploaded event. |
| `www.ftm.nl/activecampaign/event/create/view_comments/{id}`, `www.ftm.eu/activecampaign/event/create/view_comments/{id}` | **Inspected sender:** records which article comments became visible. | Only the evidenced numeric-ID route blocked. Account, comments functionality, article/audio, history and functional push remain. |

</details>

# NRC

**Supported app:** 5.12.24 · **Build:** 626 · **Input:** APK

`com.twipemobile.nrc`

[Download the original APK](https://buzzheavier.com/qhawp9l19uhc){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The inspected NRC app uses services for measuring article engagement, attention time and audience, and for personalisation. The patches stop the inspected measurements while retaining article delivery and account-session renewal.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Chartbeat](../trackers/additional-services.md#editorial-analytics) and [Parsely](../trackers/additional-services.md#editorial-analytics) | The app integrations and web destinations traced in code measure reading and article engagement. | The identified measurements in the app and known web measurement signals stop; functional [Parsely](../trackers/additional-services.md#editorial-analytics) recommendations remain. |
| [Comscore](../trackers/additional-services.md#audience-measurement) and Piano/Cxense | The code review traced audience measurement and requests for profiles and segments. The app contains several possible destinations; this does not prove they were all contacted. | The identified code that starts partner services, analytics and profiles stops; the original starting values for segments (user groups) remain, and sessions can still be renewed. |
| [Firebase](../trackers/firebase.md) and Mediahuis | The audit identified events, properties, user IDs, attention time and code that sends data to partners. | The patch suppresses the identified sending methods, diagnostic collection and push analytics. |
| First-party appview domains | The audited source and web-request rules name known destinations for click measurement, tags and Sophi. | The patch blocks known measurement requests; the exact data sent to external services was not captured. |

## What remains and what is still unknown

The content and edition server retains the actual guest `phone_id` and session and account state.

Hide newspaper tab removes navigation to an unavailable feature and does not grant newspaper download access. Advertising printed inside an editorial image remains visible when a separate ad element is hidden. Read full articles retains received text elements and cannot supply text the server withholds. Use the original Android 6+ APK.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Hide newspaper tab, Read full articles, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NRC_PATCH_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).

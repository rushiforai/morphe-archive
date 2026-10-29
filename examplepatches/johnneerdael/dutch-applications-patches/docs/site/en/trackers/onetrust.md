# OneTrust: what happens behind a privacy preference screen?

## Why is a consent provider on a tracker site?

OneTrust provides a **consent management platform**, often shortened to CMP. Its mobile SDK supplies a banner, a preference centre and vendor lists. These help an app ask for and manage choices about data use. A privacy screen may need network requests to work. Its presence does not prove that every request measures behaviour. [OneTrust SDK reference](https://developer.onetrust.com/onetrust/docs/onetrust-sdk-reference).

Other parts of the app can read saved consent choices. A callback is code run when something changes, such as a consent choice. Whether the measurement code actually follows that choice depends on how those parts are connected. Looking at the banner alone cannot tell you that.

## Can managing choices itself exchange data?

OneTrust's documented save/log API supports app and SDK information, a consent string and optional identity or cross-device fields. A **consent string** is an encoded representation of choices; it is not encryption that makes the information secret. These API capabilities are not proof that Buienradar invokes that exact route or enables identity synchronisation. [Save and log consent API](https://developer.onetrust.com/onetrust/docs/save-and-log-consent).

**Hypothetical example:** a privacy screen fetches the current vendor list, remembers a choice and notifies an analytics library. Those are three different operations. Hiding the screen alone need not stop the library, while blocking the whole consent service may prevent you changing a choice later.

## What did we find in Buienradar?

In [Buienradar 7.4.8](../apps/buienradar.md), OneTrust configuration remains at startup, with `mobile-data.onetrust.io` and `geolocation.1trust.app` identified as retained service destinations. The audit also traces a consent callback that grants Firebase analytics storage. The tracking patch therefore stops analytics collection and prevents it from being re-enabled. Hiding the banner alone would leave that code in place. A geolocation-named host alone does not establish transmission of GPS coordinates. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

## What does skipping the screen mean here?

**Skip consent screens** bypasses the automatic Pay-or-OK and OneTrust displays. It includes the tracking and ad controls, writes neither acceptance nor rejection, and keeps manual Privacy settings available. According to the audit, the app's cache treats unanswered OneTrust groups as not granted.

The findings do not show what every connected sender does. They also do not provide a legal assessment of consent. The app still exchanges functional settings and ordinary network metadata. No decrypted traffic capture was added for this documentation.

Evidence reviewed **28 October 2026**. Continue with [consent](../learn/consent.md), [Firebase](firebase.md) and [methodology](../reference/methodology.md).

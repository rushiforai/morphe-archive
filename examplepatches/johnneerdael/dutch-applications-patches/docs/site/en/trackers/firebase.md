# Firebase: why is one name not one kind of data collection?

## Which Firebase component are we discussing?

Firebase is Google's collection of app services. **Analytics** measures events and user properties and can define audiences. **Crashlytics** reports failures and can receive custom logs, keys and user identifiers. These are different collection systems, with different controls. [Firebase Analytics](https://firebase.google.com/docs/analytics), [customising crash reports](https://firebase.google.com/docs/crashlytics/android/customize-crash-reports).

Other components deliver push notifications, provide installation identity or fetch remote configuration. An **installation ID** identifies an installation for a service; a **push token** lets a service address notifications to it. The app still exchanges data with identifiers when those functions remain available, even if optional analytics is disabled. Firebase In-App Messaging, which displays marketing messages inside an app, is also distinct from Cloud Messaging notification delivery.

## Why do diagnostic records need attention?

**Hypothetical example:** a crash report contains a failure location, the previous screen name and a custom account reference. That may help reproduce a bug. The screen name and account reference also add information that can be sensitive, even when used for a technical purpose. Our investigations do not claim that all apps attach account details to every crash.

## What did the inspected apps do?

[Buienalarm 4.32.0](../apps/buienalarm.md) contains code for app events, properties and user IDs, Crashlytics logs, exception reports and custom fields, Sessions and notification measurement. The patch stops these inspected optional functions. Installations, Remote Config and notification delivery remain available; the audit treats those components separately. [Buienalarm investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md).

In [Weeronline 3.61.0](../apps/weeronline.md), the app explicitly enables Crashlytics at startup and forwards app logs. The patch therefore also prevents the app from enabling collection during use, alongside changing the manifest settings. Performance code around functional HTTP requests remains in place, with measurement disabled. The advice API still receives a Firebase installation ID. `firebase-settings.crashlytics.com` is a configuration host, not evidence of the crash-upload destination. [Weeronline investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [destination clarification](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

## What should “disabled” mean?

The named option stops the inspected analytics, diagnostic or notification-measurement functions in that app version. The patch does not delete every Firebase component. [Flitsmeister](../apps/flitsmeister.md) likewise suppresses optional Firebase collectors while retaining the token functions needed for the app to work; the news apps retain functional installation, configuration and push paths.

## What changes in RTL Nieuws?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Disable tracking** reduces optional usage and error measurement, including known records already waiting to be sent. The patch suppresses analytics IDs, properties and events, crash logs and extra error data, performance and session measurement, and notification-delivery statistics. It also filters eight known CCT transport names from stored batches. CCT is the inspected sending layer here. Records with unknown transport names remain, including older cached records whose names were not verified.

Firebase Auth, Installations and configuration remain available. The standard options also retain push delivery. The separate [Swrve expert option](swrve.md) disables push and automatic FCM initialisation without removing those shared Firebase services. Exact upload hosts for RTL's Firebase measurement were not established. This does not prove complete network silence. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

## What changes in Omroep Brabant?

In [Omroep Brabant 11.1.0](../apps/omroep-brabant.md), **Disable tracking** stops the inspected usage, crash, session and notification measurements and optional advertising IDs. It also blocks restored measurement uploads and filters four known stored record types: Crashlytics reports, app-quality sessions, FCM client events and client metrics. Unknown transport names remain. Useful installation, configuration and push services remain available, so their requests can still carry service identifiers and IP information. Exact measurement upload addresses were not pinned. [Omroep Brabant audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

Evidence reviewed **28 October 2026**. No new packet capture establishes complete silence. See [identifiers](../learn/identifiers.md), [the glossary](../reference/glossary.md) and [methodology](../reference/methodology.md).

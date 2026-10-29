# Meta/Facebook: what can an app send without a Facebook screen?

## What is embedded in the app?

The Facebook Android SDK is a library that connects apps to Meta services. Different modules have different jobs: App Events measures activity, while Audience Network supplies advertising. The SDK can also support social login or embedded content. The presence of the Facebook name alone does not tell us which module runs. [Official Android SDK source](https://github.com/facebook/facebook-android-sdk).

An **app event** is a record such as opening the app or making a purchase. It can be submitted explicitly by app code or collected through an automatic SDK feature. An **advertising ID** is a device advertising identifier; an SDK can also maintain other identifiers, so removing that one value does not by itself stop events.

## Why does “I never logged into Facebook” not settle the question?

**Hypothetical example:** a weather app includes a purchase-event call and an installation-level ID. It can invoke that call without ever showing a Facebook login screen. This illustrates a technical distinction between using a social account and an app communicating with the service; it is not a captured purchase from your phone.

Privacy International's **December 2018** investigation used traffic inspection to show automatic Facebook SDK transfers in other Android apps, including without Facebook login. It shows why startup and automatic collection also need examination. It does not establish what these inspected 2026 versions transmitted. [Privacy International investigation](https://www.privacyinternational.org/appdata).

## What did we find in the weather apps?

[Buienalarm 4.32.0](../apps/buienalarm.md) contains App Events startup and consent code, purchase-related calls and a separate executable Audience Network file. The patch disables the startup providers and prevents consent choices from re-enabling collection. Where the app expects a logger during startup, the patch supplies an object that records nothing. It also stops the identified purchase-related calls and removes the advertising file. The audit did not establish an exact Meta upload host. [Buienalarm investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md).

[Weeronline 3.61.0](../apps/weeronline.md) has a startup provider, a consent controller enabling collection and a purchase logger. The patch suppresses these paths and optional advertising-ID collection. The SDK constructs Graph destinations; an explicit `graph.facebook.com` reference also serves functional Instagram content. Blocking the whole host would have a broader effect than stopping app events. [Weeronline investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [destination evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

## What remains uncertain?

The findings identify the code examined and what the patch stops. They do not establish every possible transfer during use or later matching operation on a server. No claim about resale, retention or a particular person's Meta profile follows from them.

Evidence reviewed **28 October 2026**. Read [identifiers](../learn/identifiers.md), [consent](../learn/consent.md) and [methodology](../reference/methodology.md).

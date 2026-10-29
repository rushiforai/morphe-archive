# RevenueCat: where does subscription handling end and optional telemetry begin?

## Why is a purchase service discussed here?

RevenueCat helps apps handle subscriptions, receipts and customer entitlements. An **entitlement** is the service's record that a customer may use a paid feature. These functions require the app to exchange customer and purchase data. Those requests are not all optional tracking.

The service also supports **customer attributes**: named properties attached to a customer record. The documentation describes custom attributes and reserved fields for contact details or other system identifiers. Such values can support analysis and targeted offers. This is product capability, not evidence that our weather apps send every supported attribute. [RevenueCat customer attributes](https://www.revenuecat.com/docs/customers/customer-attributes).

## Why do additional identifiers matter?

**Hypothetical example:** subscription customer `R123` also has analytics installation ID `F456` saved against its record. That value can link the previously separate records, even when neither ID contains a name. A purchase receipt and an optional analytics ID have different jobs, so a privacy change should examine them separately.

An app may queue attributes locally before uploading them. A **setter** is a function that supplies a value. Stopping it can leave previously supplied values waiting in an **upload queue** to be sent later. The inspected patches therefore sometimes also stop the functions that send saved attributes.

## What did we find in the weather apps?

[Buienalarm 4.32.0](../apps/buienalarm.md) supplies a Firebase app-instance ID and `subscription_type`. The inspected SDK supports optional identifier collection, functions for attributes not yet synchronised, paywall and advertising events, and diagnostics. **Disable tracking** stops these optional functions, including uploads of saved attributes. Customer identity, receipts, access to paid features and transaction responses remain available. The exact RevenueCat upload hostname was not established. [Buienalarm investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md).

[Weeronline 3.61.0](../apps/weeronline.md) suppresses diagnostics and its optional Firebase attribute, but the purchase service still sends events when the payment screen (paywall) is shown. SDK destinations include `api-diagnostics.revenuecat.com`, `api.revenuecat.com` and `api-paywalls.revenuecat.com`; an endpoint declaration does not prove every endpoint was contacted. [Weeronline investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [destination evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

[Weerplaza 3.13.1](../apps/weerplaza.md) also stops the inspected optional attributes, queued-event sending and diagnostic functions while keeping purchase APIs available. [Weerplaza investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERPLAZA_TRACKING_AUDIT.md).

## What is not established?

These controls do not create a subscription, fabricate a receipt or delete historical server records. They do not show that all network requests or purchase measurements have stopped, or establish how long servers keep data.

Evidence reviewed **28 October 2026**. See [identifiers](../learn/identifiers.md) and [methodology](../reference/methodology.md).

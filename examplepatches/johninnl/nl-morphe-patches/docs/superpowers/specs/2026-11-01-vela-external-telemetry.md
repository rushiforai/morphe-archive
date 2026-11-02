# Vela external navigation telemetry through Morphe

## Delivery and target

Implement Morphe patches and an extension for the supplied original Vela 0.5.2621 APK (app.vela, code 46210, minSdk 26, signing certificate 29938b4858063e42e677ff95c901cd48248a7f032a3ae85f9b9e5617568b0d36). The Vela source tag v0.5.2621 is a read-only reference. Do not ship a fork/rebuilt Vela app or modify the user's Vela checkout. Pin native hooks against the exact R8 artifact and validate them on the actual patched APK.

## Required behavior

- Add provider selection to Vela's navigation settings: Vela/native, De-Waze and Flitsmeister. Persist it in Vela's settings; expose corresponding native Android Auto settings.
- Consume the shared navigation broadcast protocol and all supported advertised road alerts. Preserve provider identities, field validity, observation ages, partial/estimated labels and source selection. Never combine stale/foreign-source zone averages.
- Feed Vela's native current-speed and road-limit widgets on phone and Android Auto, and its warning/voice logic. Extend the native navigation UI with average-speed check progress, observed average, remaining distance and advance warnings. Use Flitsmeister's overlay as an information-layout reference, within Vela's own palette, typography and map safe areas.
- Integrate speed cameras, mobile/police traps and the other advertised road warnings. Advance warnings require actual approach data; extend the provider Morphe exporters where that data is currently absent rather than fabricating it from an already-active zone.
- Selecting an external provider temporarily suppresses Vela's Flock display, warnings and optional fetch work while either supported provider advertises fresh usable data. Restore Vela's Flock behavior when neither advertises; retain the user's saved Flock preference throughout.
- Missing/expired external values fall back visibly to Vela's own current speed/limit/road alerts; clear partial zone averages on stale, disabled, source switch, session change or zone exit. A selected provider's disappearance must not leave stale numbers on either display.
- Providers continue running in the background without their overlays. Vela renders the integration itself; no separate companion overlay. Preserve Vela's route/location behavior, speech mute, units, theme and existing controls.

## Verification

Guard package/version/certificate and exact DEX anchors. Apply/rebuild the supplied original APK through the production Morphe bundle, separately and alongside defaults. Test primitive parser/age/identity/session validation, source switching/fallback, pre-warnings and alert deduplication, Flock suppression/restoration, units and partial-average semantics. Install the patched release artifact on an owned emulator; exercise real provider broadcasts with both phone and Android Auto surfaces, mock driving, dark/light styles, stale/disconnect behavior and configuration changes. Validate actual UI rendering and ART verification; physical driving is a separate scope and must be described accurately. Ship bilingual patch documentation and the shared protocol changes with appropriate app-scoped release notes. Generated versions/catalogs remain owned by release automation.

## Native integration constraints

Vela's MapScreen is at compiler/ART size limits. Add functionality through existing child widgets and navigation/rendering holders. Do not add calls/parameters to MapScreen. The artifact obfuscates Compose and app classes; use explicit guarded native bindings, with original source references and actual DEX evidence. Do not bundle duplicate Compose/runtime/car-framework classes into the extension.

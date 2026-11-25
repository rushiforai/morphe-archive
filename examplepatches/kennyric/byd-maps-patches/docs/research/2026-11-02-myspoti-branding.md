# Myspoti custom branding

The `Custom branding` resource patch is included in the normal Dutch App
Patches bundle alongside `Gearslip personal library`. It is opt-in and targets
`app.myspoti.stable`. Options are `customName` and `appIcon`; the latter has
Original plus the six supplied icon presets. Empty names preserve the original
label. Branding is selected when patching, rather than in Myspoti settings.

The application and explicit launcher activity/alias labels/icons are updated.
The widget label follows the original application label. The selected artwork
has a regular PNG fallback and adaptive background/foreground layers. App
package identity, source attribution, internal artwork and account behavior
remain under Myspoti's control. No Myspoti source code was copied.

Validation uses the actual publisher Myspoti 2.3.0 / 1121 arm64-v8a APK.
`scripts/myspoti/verify_branding.py` rebuilds every icon and checks image bytes,
resolved labels, independent options, punctuation and resource-like names,
unchanged DEX for branding alone, and combined Gearslip selection. Build with
`:patches:buildAndroid :patches:test`; run the script as documented alongside it.

This local build does not constitute a published release or device acceptance.
The generated version and release metadata remain owned by release automation.

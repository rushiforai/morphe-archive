# Mapa Turystyczna

Package: `pl.mapa_turystyczna.app`  
Supported input: **1.16.6 (153)**, XAPK  
Patches: **Local Premium** and **Hide Premium prompts**, opt-in

The patch changes the local access check used by navigation, offline map controls and advertising, plus the Premium boolean emitted to the UI. It does not create an order, change account data or send a purchase/activation request. Downloading maps still depends on the server accepting the request.

The subscription screen can still show the account's real status. This is intentional: the account model also drives purchase verification and refresh handling. Forcing its active flag when there is no order makes that code dereference a null order.

## Hide Premium prompts

Removes the Premium entry from the navigation drawer and stops the trial offer notification. Opening the patched app also clears an offer already in the notification tray.

This patch includes Local Premium as a dependency. Its access checks also suppress the trial dialogs for offline maps and routes, and the Premium offers in the advertising banner. Recording, navigation, download and app update notifications are unaffected. Account and billing data are not changed.

Rebuild a clean XAPK with **Hide Premium prompts** selected, install it and open the app once to clear the old notification.

## Google Play

The inspected build has no PairIP `LicenseClient` or `VMRunner`. Installer checks found in bundled libraries are not evidence of a startup license screen. There is no separate Play Store Fix for this version. If a rebuilt app shows such a screen, report the exact input version and attach the startup log.

## Validation

This patch is experimental and disabled by default. Compilation and patching checks do not replace a device test. Check launch, navigation, the offline map list and an actual map download, both signed out and signed in. Refresh the account and restart the app. Record any download error separately from UI access.

Local Premium modifies only the two local feature checks. Billing, account verification and the Premium order model remain unchanged.

Verified on 2026-09-19 with bundle **1.26.0** and Morphe Desktop **1.16.0**:

- GitHub Actions compiled and published the bundle successfully.
- Morphe merged the supplied XAPK, applied Hide Premium prompts with its Local Premium dependency, rebuilt resources and all DEX files in FULL mode and signed the APK. No patch failed.
- The output check confirmed both feature changes, the disabled trial notification gate, cancellation of notification 102 and the hidden Premium menu item. Every other method matched the original APK, including account/order handling and the other notification paths.
- Launch, navigation and server responses have not been tested on a device. This build also uses Google Maps; certificate restrictions on its API key, if configured by the developer, may affect a re-signed APK. No API key or signature spoofing is included.

Input XAPK SHA-256: `27d7083a9a6a58fdd580ea0c764fb0ba1a9a810f397580cbee492f8dbe3639f2`  
Base APK SHA-256: `87387e49566d1d93fbeff99d5924c1d961641c7b4e230b2107b4f8984a6b7655`

To repeat the DEX checks after patching in FULL mode:

```shell
python -m pip install androguard==4.1.4
python scripts/check_hiking_map_input.py original.xapk --patched patched.apk --hidden-prompts
```

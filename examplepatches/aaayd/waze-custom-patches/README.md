# Waze Custom Patches

Google Maps and OLED themes, Google Maps report icons, normal-sized detailed
report markers, a local badge selector, unlocked driver moods and Android Auto setup.
Eight separate patches in one Morphe source.

## Install with Morphe

1. Install [Morphe](https://morphe.software/) and [add this patch source](https://morphe.software/add-source?github=aaayd/waze-custom-patches&name=Waze%20Custom%20Patches).
2. Download the **original ARM64 `.apkm`** from the [latest release](https://github.com/aaayd/waze-custom-patches/releases/latest).
3. In Morphe, choose Waze and select that file from Downloads. Select the features you want from the eight independent patches listed below.
4. Patch and install Waze, then open it and sign in.

Prefer a ready-made app? Install the **patched ARM64 `.apk`** from the same release.
It uses a different signing key from phone-built copies. For an existing Morphe
installation, update through Morphe using the same key.

### If the source will not download

In **Sources > + > Remote**, paste:

```text
https://raw.githubusercontent.com/aaayd/waze-custom-patches/refs/heads/main/patches-bundle.json
```

Or download the `.mpp` from the latest release and select it through
**Sources > + > Local**.

## Choose your patches

- **Selectable map themes:** Original, Google Maps and OLED map colours.
- **Selectable report icon packs:** switch between Waze and Google Maps icons.
- **Detailed report icons at normal sizes:** detailed markers at the expected size, including when zoomed out.
- **Rank badge selector:** change your local badge appearance.
- **Unlock driver moods:** expose the bundled moods.
- **Android Auto setup:** include the installer and setup prompt for the Android Auto fix.
- **Speed camera sound below speed limit:** enable camera audio at or below the limit.
- **Android Auto police alert distance:** adjust when police/enforcement heads-up alerts appear.

Enable any combination. The ready-made APK includes all eight.

## Themes and icons

Open **Waze > Settings > Map display**:

- **Themes:** choose Original, Google Maps or OLED separately for light and dark mode.
- **Icon pack:** Google Maps is the default when no pack has been selected. You can switch to Waze original. Existing choices are kept.
- Tap **Apply & restart** after changing a theme or icon pack.

Traffic, road closures, blocked lanes and stopped-car reports use red icons in
the Google Maps pack. Enable **Detailed report icons at normal sizes** to keep
specific report artwork when zooming out.

Missing or incompatible individual icons keep Waze's artwork. Check the patch
log or **Icon pack > Icon warnings** for details. Missing badge artwork hides only
that choice. Unrecognisable hooks or a broken icon schema still stop the affected patch.

## Police alert distance

Enable **Android Auto police alert distance**, then open
**Waze > Settings > Map display > Police alert distance**.

Enter **50 to 10,000 metres** and tap **Apply**. The default is **1,200 metres**.
The screen shows Waze's live values for normal roads, freeways and fallback.
**Use original** restores the distances captured before the first override.
Use it before removing this patch if you want those original values back.

This changes the Android Auto heads-up distance settings. Waze still needs an
available report, and spoken warnings follow its own rules. Actual in-car alert
timing needs your test; automated checks verify the patch and config handling.

## Speed camera sound below the limit

Enable **Speed camera sound below speed limit** when patching. No extra setup
is needed. Keep speed camera **Alert while driving** enabled in Waze and use
**Sound on** or **Alerts only**. This does not override mute or add missing cameras.
The setting is reapplied at startup and after configuration updates. Waze may
persist the native setting even after this patch is removed. Driving audio still
needs a device test; automated checks verify the setting and hooks.

## Waze missing from Android Auto?

1. Include the **Android Auto setup** patch when patching Waze. Install and start [Shizuku](https://shizuku.rikka.app/guide/setup/) using wireless debugging. Phone-only setup requires Android 11 or later.
2. Open Waze and sign in. Accept **Android Auto setup**, or open it from **Settings > Map display > Android Auto setup**.
3. Install the included **Waze AA Installer** when prompted. Allow Waze to install apps if Android asks.
4. Open Waze AA Installer, grant it Shizuku access and tap **Repair Android Auto visibility**. Confirm the Waze update in Android's installer.
5. Open **Android Auto > Customise launcher** and enable Waze, then reconnect to the car.

This reinstalls your current Waze without uninstalling it or clearing its data.
For future patches, choose **Waze AA Installer** in Morphe's installer chooser.
Start Shizuku again after restarting your phone. If the setup row is missing,
repatch with **Android Auto setup** enabled. Themes are optional.

## Supported Waze versions

The bundle supports **5.24.90.901**, **5.24.5.0**, **5.24.0.2**, **5.21.0.0** and
**5.18.5.0**, ARM64. All eight patches are build-tested on these versions. Use
the original package provided with the latest release.

Nightly builds discover internal hooks and native icon offsets automatically,
including renamed classes, moved helper methods and older report-table layouts.
[Ten-version compatibility results](reports/compatibility-2026-10-04/README.md). Refresh the Morphe source and use the
new release's original APK when an update is available. If Waze changes a feature's
structure enough that it cannot be identified reliably, publication stops and
the previous release remains available. Phone and Android Auto behaviour still
needs testing.

## Updates

The repository checks for new Waze releases every night at **00:00 UTC**.
It builds and publishes only when Waze's upstream versionCode increases, with
no downgrade in its version number. Patch bundle updates alone do not trigger a release.
Morphe's source updater supplies new patch bundles. If a new Waze version cannot
be patched successfully, the previous working release stays available.

[Build and release notes](BUILDING.md)

Police-distance hook adapted from [dowjames](https://github.com/dowjames/morphe-patches#android-auto-police-alert-distance). [Third-party notices](THIRD_PARTY_NOTICES.md).

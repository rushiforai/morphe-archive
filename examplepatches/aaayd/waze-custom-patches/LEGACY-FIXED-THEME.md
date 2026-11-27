For the new selectable light/dark themes and OLED editor support, see [Theme selector](THEME-SELECTOR.md). This replaces the fixed-colour patch described below.

For the independently selectable report-sizing patch in the same theme bundle, see [Report icon sizing](REPORT-ICON-SIZING.md).

# Waze Maps Skin v2

A Morphe skin patch for original **Waze 5.24.5.0 (1030732)**. It assigns RGB values sampled from Google Maps reference captures to Waze's map layers, including roads, water, parks, labels and navigation routes.

## Files

- `dist/waze-maps-skin-2.0.0.mpp`: Morphe bundle containing JVM classes and Android DEX.
- `dist/waze-5.24.5.0-google-colours-v2-arm64.apk`: merged, patched, signed ARM64 APK, Android 10+.
- `dist/waze-maps-skin-source.zip`: patch sources, build scripts and public reference captures.
- `dist/validation-v2-arm64.json`: automated parser and colour checks.
- `dist/device-validation-v2.json`: device observations and limitations.
- `references/google-colour-provenance.json`: selected RGB values and matching pixels in each reference.

The older 1.0.0 and 32-bit APKs in this workspace have not been updated to this palette.

## Colour matching

| Map role | Day | Night |
| --- | --- | --- |
| Background | #F6F5F5 | #1C2A40 |
| Parks | #C3F1D5 | #144A57 |
| Water | #90DAEE | #00102E |
| Major roads | #D8E0E7 | #3E5A77 |
| Motorways | #8BA5C1 | #3E5A77 |
| Minor roads | #CFD9E3 | #3E5A77 |
| Road labels | #44566D | #C4CCD7 |
| Selected route | #450EFB | #450EFB |
| Alternative route | #B8C9FE | #B8C9FE |

These are exact recorded RGB samples from the Google Maps live JavaScript sample at Hyde Park/Paddington and Google Maps web directions. They are not an export of Google's proprietary style specification. The sampled web route is violet. Its day route colours are reused at night; a Google phone night navigation route was not sampled.

Waze's renderer, geometry, labels and available land-use categories differ from Google's. Raster compression, zoom and antialiasing also affect the reference pixels. A device screenshot confirms the new night background is exactly #1C2A40, but some filled areas have small rendering differences from their assigned RGB values. Whole-screen pixel equivalence is not claimed. Waze menus, controls, traffic and incident states retain their existing appearance.

## What the patch changes

Each of the day/night skins under both `assets/res/skins/default/` and `assets/res/skins/default/experiment/` receives 49 palette replacements plus explicit `Colors` overrides: 197 in day mode and 194 at night. These bypass the Lua lighten/darken/saturation transforms that made v1's colours drift from its palette.

The compiled manifest versionCode increases from **1030732 to 1030733**. Waze only re-extracts bundled skins when the package build number exceeds the cached resource version. This triggers its normal resource upgrade while retaining user data. An in-place install with the old versionCode was observed to keep v1's cached colours. Future revisions need a new, higher resource build number; reinstalling the same version does not reliably refresh skins.

Original DEX, native libraries, rendering scripts, geometry and traffic arrays remain unchanged. Patch compatibility is limited to original Waze 5.24.5.0 with certificate SHA-256 `03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7`. Missing expected files or colour fields fail patching. The versionCode edit refuses an unexpected original build number.

## Use in Morphe

1. Import `waze-maps-skin-2.0.0.mpp` as a local source.
2. Select the original Waze 5.24.5.0 ARM64 APKM and enable **Google Maps-style map skin**. Morphe merges the splits.
3. Patch and install the result. No root is required.

Android requires the same signing key for an in-place update. The supplied APK uses this project's Desktop key; Morphe Manager normally uses its own key. Keep one signing workflow to retain app data. The currently installed phone build and supplied APK use the same Desktop key.

### Android Auto installation on the tested phone

Morphe Manager 1.33.0's built-in "Install as Play Store" did not produce the installer metadata Android Auto accepted on this Android 16 phone. The working method uses a temporary content-provider helper and launches Google Package Installer from ADB with the Play Store installer extra. It produces:

```
installerPackageName=com.android.vending
initiatingPackageName=com.google.android.packageinstaller
originatingPackageName=com.android.shell
packageSource=3
```

The v2 update was installed using this method; the helper was removed afterwards. Details and reproducible commands are in `references/android-auto-installer-investigation.md`, with helper source under `tools/installer-handoff`. An ordinary ADB install can overwrite the working source metadata.

## Validation

- All four modified skins execute through Waze's original Lua environment, schema, validator and native callback parser without warnings.
- All 197/194 explicit day/night colour assignments are checked against the theme files.
- Parser entry counts and native callback keys remain unchanged; changes affect colour entries only.
- Original app DEX, native libraries, rendering scripts and traffic arrays are checked unchanged.
- Final APK manifest is checked for versionCode 1030733; comparison with the previous merged APK found only the one-byte version increment.
- APK signature and 16 KiB ZIP alignment pass.
- The phone reports versionCode 1030733 and the working Android Auto installer metadata. Waze launches and renders the new night theme. Day/night Lua validation covers both themes; a full day/night navigation drive and Android Auto car display have not been tested.
- This modifies bundled assets; server-driven resource replacement is not disabled.

## Build

Requires JDK 21, Android SDK platform 36/build-tools 36.0.0, and network access for dependencies. The build pins and verifies Morphe Desktop 1.18.0 (Patcher 1.15.0).

```powershell
.\Build.ps1
& "$env:JAVA_HOME\bin\java.exe" -Xmx1536m -jar tools\morphe-desktop.jar patch -p dist\waze-maps-skin-2.0.0.mpp -o dist\waze-5.24.5.0-google-colours-v2-arm64.apk -r dist\patch-result-v2-arm64.json downloads\waze-5.24.5.0-arm64.apkm
python scripts\validate_skins.py downloads\waze-arm64\base.apk dist\waze-5.24.5.0-google-colours-v2-arm64.apk --report dist\validation-v2-arm64.json
```

Validation needs Python `lupa`. `scripts/build_sampled_themes.py` regenerates theme properties and provenance from the saved reference images and original extracted base APK, and additionally needs Pillow. Google reference capture scripts use Playwright/Chromium. Reference images are retained for measurement; they are not packaged into Waze or the MPP.

## Sources

- Google live sample: https://maps-docs-team.web.app/samples/map-simple/dist/
- Google directions reference: https://www.google.com/maps/dir/Hyde+Park,+London/Westminster+Abbey,+London/
- Waze ARM64: https://www.apkmirror.com/apk/waze/waze-gps-maps-traffic-alerts-live-navigation/waze-navigation-live-traffic-5-24-5-0-release/waze-navigation-live-traffic-5-24-5-0-2-android-apk-download/
- Original APKM SHA-256: `3d2c2f113fa4129f70afb46785d986e3a67489aac87a8e976f68663365c71d65`.
- Morphe Desktop: https://github.com/MorpheApp/morphe-desktop/releases/tag/v1.18.0

Patch source is GPL-3.0; see LICENSE and NOTICE. Waze remains proprietary. Google reference images remain their respective owners' material and are not licensed as patch code. This is an independent custom patch.

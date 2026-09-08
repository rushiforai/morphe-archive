# Reconstruction record

## Inputs

- Supplied APK: `Morphed_SOUNDCLOUD.apk`
  - SHA-256: `f713de5bb25bcf4df9b649b1df610295c848d99340cab99f14baad4c7c510651`
  - Package: `com.soundcloud.android`
  - Version name: `2026.08.26-release`
  - Version code: `369070`
  - Minimum SDK: `32`
  - Target SDK: `36`
- Supplied repository archive: `morphe-patches-main (2).zip`
  - SHA-256: `377d830dbc605a5e6bb101a3232decf4851add0bfb0062a049abe5175c906a16`
- Supplied apktool: `apktool_3.0.3.jar`
  - SHA-256: `dbf930b076c6b9be08d57c449cacefc3bdd6b71ebd59b3066fc0e1f5b14f9423`

## Scope retained from the supplied APK

### Download button hook

- Public SoundCloud URL caching for track and playlist URNs.
- Track-page, playlist-page, track-bottom-sheet, and playlist-bottom-sheet click interception.
- Track and playlist download-state normalization.
- Native Downloads-library/settings suppression while the hook is enabled.
- External package selection through Android `ACTION_SEND`.
- Download label/icon normalization for already-downloaded menu variants.

### Hide Cast icon

- Visibility filtering for the menu-item Cast implementation.
- Visibility filtering for the direct `ThemeableMediaRouteButton` implementation.

### Settings

- Download-hook enabled switch.
- External package-name field.
- Cast-icon hiding switch.

## Explicitly excluded

- Home-section filtering.
- Upload, inbox, and notification icon hiding.
- Bottom Create-button hiding.
- Bottom-navigation icon-only mode.
- Every other navigation or hide option found in the supplied APK.

The decompiled APK itself is not redistributed in this repository.

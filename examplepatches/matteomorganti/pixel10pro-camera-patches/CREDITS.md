# Credits

This repository combines and adapts other people's work. Every imported file keeps a header that states where it came from and what was changed.

## Akshayykadam/Pixel-Camera

- Repository: https://github.com/Akshayykadam/Pixel-Camera
- Commit used: `10b75fab7c4036a836061d3619aea1a9c0845bec` (2026-11-23)
- Author: Akshay Kadam
- License: GPL-3.0 (`LICENSE` file, GNU GPL version 3)
- Taken from it:
  - `patches/.../pixelcamera/{looks,quickaccess,creator,photosaving,portrait,clone}/` and `PixelCameraPatchUtils.kt`. Modified: compatibility, fail-loud lookups, 11.0-only hooks removed, Looks gallery redirect removed.
  - `patches/src/main/resources/TomteInitHelper.dex`, `PortraitControllers.dex`, `QuickAccessControllers.dex`. Unmodified.
  - `reference/smali/Tomte*.smali`, the sources of `TomteInitHelper.dex`. Unmodified.

## Gamer92000/pixelcamera-patches

- Repository: https://github.com/Gamer92000/pixelcamera-patches
- Commit used: `8d4507460484f3cd070d7f9f0c724ed429f62486` (2026-07-26)
- Author: Gamer92000
- License: GPL-3.0-or-later
- Taken from it:
  - repository layout, Gradle build, extension module, CI workflows, `.github/scripts/write_bundle_json.py`;
  - the "Use third-party gallery" and "Use third-party gallery on lock screen" patches (`gallery/`) and the `GalleryRedirect.java` extension, adapted to 11.1.040;
  - `tools/dexscan.py`, `tools/apksigcert.py`, `tools/verify_fingerprints.py` (the last one adapted to 11.1).

## Other references

- Morphe patches template (https://github.com/MorpheApp/morphe-patches-template): `util/PatchListGenerator.kt`, by way of Gamer92000.
- Akash-Sriram/morphe-google-photos (https://github.com/Akash-Sriram/morphe-google-photos, commit `059419c675379a6a4e94f1592c66f4072aa881c2`): read for reference only, no code copied. Its Google Photos GmsCore patch defines how the package, the `mars` actions and the authority are renamed. "Use Morphe Google Photos" applies the same mapping on the camera side.
- MorpheApp/morphe-patches (commit `c4818af779bab85505e5e9169d0789b422bb99cd`): read for the universal patch names and the plugin/patcher versions.

## License of this repository

New code written for this repository is GPL-3.0-or-later. The files taken from Akshayykadam are GPL-3.0 (version 3 only), so the combined work is distributed under **GPL-3.0** (see `LICENSE`).

`PortraitControllers.dex` and `QuickAccessControllers.dex` contain Pixel Camera classes (© Google) modified by the upstream author. They are not original GPL-covered code.

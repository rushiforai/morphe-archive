# Android Auto screenshot provenance

Captured on 2026-11-01 from the user's OnePlus 15 (Android 16), with permission, using Android CLI screen capture over USB ADB. These are actual app screens, not generated illustrations.

- Shizuku-Next 14.0.30-next: Running home screen.
- Android Settings: Wireless debugging enabled, Pair device with pairing code.
- KingInstaller 2.4: Shizuku enabled, Root disabled; no APK selected.
- Morphe Manager 2.3.0: installer selection, KingInstaller highlighted. The reinstall flow was cancelled without confirming installation.
- Android Auto 17.9.664044-release: settings and Customise Launcher with Flitsmeister checked. Android Auto was temporarily enabled to capture these screens, then restored to its prior disabled-user state. No launcher checkboxes were changed.

Assets under `assets/images/android-auto/` are cropped to remove notification/status bars and irrelevant screen regions, resized to 720 pixels wide and encoded as WebP. The live IP address and port are covered in the Wireless debugging capture. App controls and visible states were not altered. English screens are shared by both guide translations with localized instructions and alt text.

The captures demonstrate the visible settings and installer choices. They do not demonstrate a fresh install, new wireless pairing, a working Waze car session, or in-car navigation.

References checked while writing:

- https://developer.android.com/training/cars/testing#unknown-sources
- https://github.com/fcaronte/KingInstaller
- https://github.com/rushiranpise/Shizuku-Next
- https://shizuku.rikka.app/guide/setup/

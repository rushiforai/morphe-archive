# Install apps for Android Auto

If a patched app works on your phone but is missing from Android Auto, try installing through **KingInstaller with Shizuku enabled**. This is the supported installation route in this guide for [Flitsmeister](../apps/flitsmeister.md). Keep its startup and privacy patches enabled.

## Prepare

- [Install and start Shizuku-Next](shizuku.md), or keep a compatible service that already works.
- [Download KingInstaller](https://github.com/fcaronte/KingInstaller/releases) and install its APK.
- Patch the exact original app files in Morphe Manager.

Root is not required. Check that Shizuku is running before installation, including after a reboot.

## Install the patched app

1. In Morphe’s installer selection, choose the separate **KingInstaller** entry. The built-in **Shizuku** entry is a different option.
2. In KingInstaller, enable **Shizuku** and approve its access request. Grant file access if requested. Leave **Root** off.
3. Tap **Install as king**.
4. Confirm **Update** for an existing patched app, or **Install** for a first installation. Keep the same signing key for updates to retain app data.
5. Open the app on your phone and complete setup or login as needed.
6. Open Android Auto settings → **Customize launcher** and enable the app. Reconnect to the car if the launcher has not refreshed.

If KingInstaller is missing from Morphe’s choices, export the **patched APK**, open KingInstaller and select that APK. Do not select the original APKS/APKM archive or use the ordinary file-manager installer.

Use the same KingInstaller workflow for future updates.

## If the app is still missing

Check that Shizuku is running, KingInstaller is authorized and **Shizuku** was enabled before **Install as king**. Check Android Auto’s hidden-app list. Android Auto’s **Unknown sources** setting alone may not be enough for Flitsmeister.

Do not uninstall or clear app data just to refresh the launcher. [Report a problem](troubleshooting.md#report-a-problem) with the app/build, Android and KingInstaller versions and your installation steps. Launcher visibility does not guarantee every in-car function works on every setup.

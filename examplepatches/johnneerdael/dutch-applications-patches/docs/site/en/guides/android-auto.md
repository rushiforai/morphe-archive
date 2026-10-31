# Install apps for Android Auto

If a patched app works on your phone but is missing from Android Auto, the installation method can be the cause. For [Flitsmeister](../apps/flitsmeister.md), **KingInstaller with Shizuku enabled** restored the Android Auto launcher entry on the tested phone and emulator. Keep the crash and privacy patches enabled.

## Download and start the tools

- [Install and start Shizuku-Next](shizuku.md), our default for this workflow. The guide includes [downloads](https://github.com/rushiranpise/Shizuku-Next/releases), phone setup and a short comparison of maintained alternatives. Check that the service is running before installing the patched app.
- [Download KingInstaller from its project releases](https://github.com/fcaronte/KingInstaller/releases). Install KingInstaller itself, then reopen Morphe's installer selection if necessary.

Our independent KingInstaller test used Shizuku-Next. If you already have a compatible service running, you do not need to replace it. Check the status after a reboot; automatic recovery depends on the provider and start method. For a television rather than a car, use the separate [Android TV guide](shizuku-tv.md).

## Install through Morphe and KingInstaller

1. Apply the patches in Morphe using the original app files specified on the app page. Install the **patched APK** produced by Morphe, not the original APKS or APKM.
2. In Morphe's **Select installer** screen, select the separate **KingInstaller** entry and confirm. Choosing Morphe's built-in **Shizuku** entry does not use KingInstaller.
3. In KingInstaller, enable **Shizuku**. Allow KingInstaller to access Shizuku when prompted, and grant its requested file access if needed. Leave **Root** off for this tested non-root workflow.
4. Tap **Install as king**.
5. Confirm **Update** in Android's installation screen, or **Install** for a first installation. When updating an existing patched app, keep its signing key and update it in place; do not uninstall it to troubleshoot a missing launcher entry.
6. Open the app on your phone and complete any required sign-in or setup. Reopen Android Auto settings, open **Customize launcher**, and check that the app appears and is enabled. Reconnect Android Auto to the car if its launcher has not refreshed.

If KingInstaller is not offered in Morphe, **save/export the patched APK** from Morphe. Open KingInstaller, select that saved APK, and continue from step 3. Opening the APK in a file explorer and accepting the ordinary system installer does not use the tested KingInstaller workflow.

Shizuku needs to be running for this installation. Repeat the KingInstaller workflow for later patched-app updates so that the installation source is preserved.

## Why the installer choice matters

Android Auto checks the app's recorded installation source as well as its car support. In the tested Morphe Manager 2.3.0 paths, the built-in **System installer** and **Shizuku** options did not leave the required source for Flitsmeister, even with **Install as Play Store** enabled. KingInstaller's Shizuku mode uses a different installation path and produced the source accepted by the inspected host.

Android Auto's **Developer mode** and **Unknown sources** checkbox alone did not solve this for Flitsmeister's Car App Library category. The [Android documentation](https://developer.android.com/training/cars/testing#allow-unknown-sources) explains that the unknown-sources exception does not apply to apps built with that library. Keep your Flitsmeister crash fix enabled; changing the installation method does not require a patch rollback.

## If the app is still missing

Check that Shizuku was running, that KingInstaller was authorized, and that you installed with **Install as king** after enabling Shizuku inside KingInstaller. Check Android Auto's hidden-app list under **Customize launcher**. Do not start by clearing app data or uninstalling.

The user confirmed success on the physical phone. Independent testing with KingInstaller 2.4, Shizuku-Next, Android 16 and Android Auto 17.9 also restored a checked Flitsmeister launcher entry. This establishes launcher visibility on those setups, not every phone, another app's compatibility or a complete driving session. See the [installation-source investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-flitsmeister-android-auto-installer.md) for the technical evidence. If it still fails, [report the app/build, Android version, KingInstaller version and installation steps](troubleshooting.md#report-something-useful).

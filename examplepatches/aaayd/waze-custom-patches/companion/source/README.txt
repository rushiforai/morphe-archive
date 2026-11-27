Waze AA Installer 1.0.0

Install waze-aa-installer-1.0.0.apk once. This is a separate Android app, not a
Waze patch, root module, or replacement for Morphe.

Using Morphe
1. Start Shizuku through wireless debugging and allow Waze AA Installer access.
2. Patch Waze in Morphe as usual.
3. Choose Waze AA Installer when Morphe asks which installer to use.
4. Tap Update in Google's normal Android installer.
5. Return to Waze AA Installer. It checks the actual installation source.
6. Check Android Auto > Customise launcher for Waze.

Morphe's installer settings are under Settings > System > Installer. Enable
the installer selection prompt to choose this adapter for Waze while keeping
other apps on their usual installer. The adapter intentionally accepts only
com.waze, so a global default will reject other apps.

Start Shizuku again after restarting the phone. Android 11+ supports doing
this through wireless debugging entirely on the phone; a computer is not
needed for subsequent installations.

Repair an existing installation
Open this app and tap Repair Android Auto visibility. It stages the currently
installed Waze APK and re-installs the exact same signed build through the
Shizuku handoff. It never uninstalls Waze or clears its data. The same signing
certificate and a non-older version are required for updates from Morphe.

How it works
Morphe sends an ACTION_VIEW intent with an APK content URI and read grant.
The app copies it into private storage and checks package, certificate,
version and the presence of the ARM64 native library. A Shizuku UserService,
running as shell UID 2000, launches Google Package Installer with the Play
Store installer extra. This reproduces the ADB handoff previously verified
on the test phone; it does not perform a silent pm install.

The read-only APK provider accepts only the app itself, shell and Google
Package Installer. Its per-install URI token expires after success or an
explicit discard. No network permission, broad storage access, background
service or automatic uninstall is requested. REQUEST_INSTALL_PACKAGES is
declared so Morphe recognises the app as an installer candidate.

The success message requires a newer installation timestamp, the expected
Waze version and signing certificate, installing package com.android.vending
and initiating package com.google.android.packageinstaller. Metadata matching
is not proof of in-car projection; check the Android Auto launcher separately.

Supported/tested environment
OPPO CPH2791, Android 16, Shizuku in ADB mode, Morphe Manager 1.33.0, main
Android profile, merged ARM64 Waze APK. The app requires Android 11+ and
Shizuku 13+. Google Package Installer must be a system app. Other phones and
Android Auto versions have not been tested. Root-mode Shizuku is not used.

Build
Run Build.ps1 with Android SDK platform/build-tools 36.0.0 and Android Studio's
JBR. Shizuku API/provider/aidl/shared 13.1.5 JARs are included and hash-pinned.
The Shizuku MIT license is in lib/LICENSE-Shizuku.txt. The build uses the local
Android debug keystore; signing keys are not included in the source archive.
Preserve your signing key when publishing updates to this installer.

References
https://github.com/RikkaApps/Shizuku-API
https://shizuku.rikka.app/guide/setup/
https://github.com/MorpheApp/morphe-manager/blob/main/docs/installers.md

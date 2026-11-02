package app.danielthemaniel.patches.youtube

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_YOUTUBE = Compatibility(
    name = "YouTube",
    packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        // The background-frame hooks match by shape, so they are not tied to one build. Both targets
        // pass verify_fingerprints.py; only 21.20.405 has been run on a device.
        AppTarget(version = "21.30.216", versionCode = 1561187872, minSdk = 29),
        AppTarget(version = "21.20.405", versionCode = 1561173354, minSdk = 28),
    ),
)
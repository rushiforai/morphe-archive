package app.sni_patch.patches.music.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Taken from Morphe Patches
internal object Constants {
    val COMPATIBILITY_MUSIC = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            // Android 13+
            "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
            // Android 7+
            "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
        ),
        targets = listOf(
            AppTarget(
                version = "7.16.50",
                minSdk = 28,
                isExperimental = true
            ),
            AppTarget(
                version = "7.15.52",
                minSdk = 28,
                isExperimental = true
            ),
            AppTarget(
                version = "7.14.53",
                minSdk = 28,
                isExperimental = true
            ),
            AppTarget(
                version = "7.13.50",
                minSdk = 28
            ),
            AppTarget(
                version = "7.12.51",
                minSdk = 28
            ),
            AppTarget(
                version = "7.11.50",
                minSdk = 28
            ),
            AppTarget(
                version = "7.10.53",
                minSdk = 26
            )
        )
    )
}
package io.github.bryceaspringfield.morphe.patches.youtube

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
            "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
        ),
        targets = listOf(
            AppTarget(
                version = "21.47.483",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.46.522",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.45.82",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.44.528",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.43.523",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.30.216",
                minSdk = 29
            ),
            AppTarget(
                version = "21.28.208",
                minSdk = 29
            ),
            AppTarget(
                version = "21.23.492",
                minSdk = 28
            ),
            AppTarget(
                version = "20.51.39",
                minSdk = 28
            ),
            AppTarget(
                version = "20.26.46",
                minSdk = 26
            )
        )
    )
}

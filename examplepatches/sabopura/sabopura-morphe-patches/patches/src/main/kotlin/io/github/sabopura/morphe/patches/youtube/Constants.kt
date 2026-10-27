package io.github.sabopura.morphe.patches.youtube

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /** The official Morphe patches' stable and newest YouTube targets, plus the newest store build. */
    val YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        description = "Official YouTube Android app verified for API-free danmaku comments and ambient light.",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
            "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a",
        ),
        targets = listOf(
            AppTarget(
                version = "21.20.405",
                minSdk = 28,
                description = "Official Morphe patches' stable target; danmaku fetched and drawn in sync with playback and the see-through watch page shown on the dedicated Android API 36 emulator.",
            ),
            AppTarget(
                version = "21.42.241",
                minSdk = 29,
                description = "Official Morphe patches' newest target; danmaku fetched and drawn in sync with playback and the see-through watch page shown on the dedicated Android API 36 emulator.",
            ),
            AppTarget(
                version = "21.42.243",
                minSdk = 29,
                description = "Media-time hook re-anchored on the progress constructor; danmaku fetched and drawn in sync with playback and the see-through watch page shown on the dedicated Android API 36 emulator.",
            ),
        ),
    )
}

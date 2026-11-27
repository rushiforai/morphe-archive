package app.jimaku.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * The YouTube versions Jimaku was tested on, each a stable target of Morphe's own YouTube
     * patches. The signatures and file type are the ones Morphe declares, from
     * morphe-patches `patches/src/main/kotlin/app/morphe/patches/youtube/shared/Constants.kt`.
     */
    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            // Android 13+
            "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
            // Android 7+
            "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a",
        ),
        targets = listOf(
            AppTarget(
                version = "21.30.216",
                minSdk = 29,
            ),
            AppTarget(
                version = "21.28.208",
                minSdk = 29,
            ),
            AppTarget(
                version = "21.23.492",
                minSdk = 28,
            ),
        ),
    )
}

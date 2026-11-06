package app.ayufa.patches.youtube.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /**
     * YouTube 20.26.46 is the last YouTube version that runs on Android 8.0
     * (minSdk 26), as declared by upstream MorpheApp/morphe-patches
     * (patches/src/main/kotlin/app/morphe/patches/youtube/shared/Constants.kt:
     * "20.26.46 // Last version for Android 8.0").
     *
     * The live latency keeper patch was originally developed and verified
     * against this target; it also supports the modern target below (the
     * media progress fingerprint is the same one upstream uses for both).
     */
    val COMPATIBILITY_YOUTUBE_ANDROID_8 = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
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
                version = "20.26.46", // Last version for Android 8.0
                minSdk = 26
            )
        )
    )

    /**
     * Targets for current Android versions.
     *
     * 21.30.216 is the newest non-experimental target declared by upstream
     * MorpheApp/morphe-patches (the recommended target for current Android).
     * The live chat clutter patch is developed and verified against
     * this target; the live latency keeper supports it as well.
     */
    val COMPATIBILITY_YOUTUBE_MODERN = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
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
                version = "21.30.216",
                minSdk = 29
            )
        )
    )
}

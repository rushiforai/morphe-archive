package app.tvpatches.patches.youtubetv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val YOUTUBE_TV_PACKAGE_NAME = "com.google.android.youtube.tv"

    // Package name used when the app is cloned to run with MicroG-RE (GmsCore).
    const val PATCHED_YOUTUBE_TV_PACKAGE_NAME = "app.tvpatches.android.youtube.tv"

    // SHA-1 of the original signing certificate (CN=ytandroidtv, O=Google Inc.).
    // This is the value GmsCore support needs as "spoofedPackageSignature".
    const val YOUTUBE_TV_SIGNATURE_SHA1 = "61226bdb57cc32c8a2a9ef71f7bc9548e95dcc0b"

    // Main activities (from AndroidManifest.xml of 7.32.300).
    const val SHELL_ACTIVITY = "Lcom/google/android/apps/youtube/tv/activity/ShellActivity;"
    const val COBALT_ACTIVITY = "Ldev/cobalt/coat/CobaltActivity;"

    val COMPATIBILITY_YOUTUBE_TV = Compatibility(
        name = "YouTube for Android TV",
        packageName = YOUTUBE_TV_PACKAGE_NAME,
        // APKMirror offers a single APK variant (armeabi-v7a, Android 7.0+) besides bundles.
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0033,
        // formFactor stays MOBILE (default): with TV, morphe-desktop applies no patches.
        signatures = setOf(
            // SHA-256 of CN=ytandroidtv, O=Google Inc.
            "21199d112cece428c82cb0df221da24ff8674c7a982a83a17a970eec43305b4a"
        ),
        targets = listOf(
            // Tested on two Android TVs (versionCode 732300320).
            AppTarget(version = "7.32.300", minSdk = 24)
        )
    )
}

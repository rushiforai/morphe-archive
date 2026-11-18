package app.afterglow.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /** Extension DEX built from extensions/extension, merged by every Afterglow patch. */
    const val EXTENSION = "extensions/afterglow.mpe"

    /** Root package of the extension classes, in smali form. */
    const val EXTENSION_PACKAGE = "Lapp/afterglow/extension"

    /**
     * YouTube 21.43.523, the Android release that matches the iOS 21.43 work.
     * Signatures are YouTube's own signing certificates.
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
            AppTarget(version = "21.43.523", minSdk = 29),
        ),
    )
}

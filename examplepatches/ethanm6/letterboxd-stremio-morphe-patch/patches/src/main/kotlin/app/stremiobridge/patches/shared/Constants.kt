package app.stremiobridge.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Letterboxd compatibility declaration.
     *
     * version = null means this patch is expected to work with the latest
     * Letterboxd release and all future releases, since the fingerprint
     * matches by class name + method name (not by fixed bytecode offset),
     * making it resilient to most app updates that don't rename the method.
     *
     * Verified against versionCode 495 (3.5.3).
     */
    val COMPATIBILITY_LETTERBOXD = Compatibility(
        packageName = "com.letterboxd.letterboxd",
        name = "Letterboxd",
        apkFileType = ApkFileType.APK,
        appIconColor = "#7B5EA7", // Stremio brand purple — must be a hex String, not Int
        targets = listOf(
            AppTarget(version = null)
        )
    )
}

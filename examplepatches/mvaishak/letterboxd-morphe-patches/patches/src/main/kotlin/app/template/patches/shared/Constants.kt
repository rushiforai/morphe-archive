package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LETTERBOXD = Compatibility(
        name = "Letterboxd", // App name as it appears in the Android launcher.
        packageName = "com.letterboxd.letterboxd",
        apkFileType = ApkFileType.APK, // Change to APKM if you patch a split bundle from ApkMirror.
        appIconColor = 0xFF8000, // Letterboxd brand orange.
        targets = listOf(
            // null version = compatible with any Letterboxd version, not just one pinned build.
            AppTarget(
                version = null
            )
        )
    )
}

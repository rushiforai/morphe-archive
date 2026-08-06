package spooky.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BEELINE = Compatibility(
        name = "Beeline", // App name as it appears in the Android launcher.
        packageName = "co.beeline",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFFCF00, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            AppTarget(version = "4.2.8014")
        )
    )
}

package app.medium.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MEDIUM = Compatibility(
        name = "Medium",
        packageName = "com.medium.reader",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000, // Black Medium logo color
        targets = listOf(
            // Target all versions experimentally
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // Confirmed target versions
            AppTarget(
                version = "5.0.0"
            ),
            AppTarget(
                version = "4.2.0"
            )
        )
    )
}
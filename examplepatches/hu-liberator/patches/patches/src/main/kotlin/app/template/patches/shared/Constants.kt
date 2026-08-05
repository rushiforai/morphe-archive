package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_EXAMPLE = Compatibility(
        name = "Időkép", // App name as it appears in the Android launcher.
        packageName = "hu.idokep.idokep",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF0045, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version you developed your patches for
            // or the last version you have confirmed as 100% working.
            AppTarget(
                version = "4.3.7"
            ),
            AppTarget(
                version = "1.0.2"
            )
        )
    )

    val COMPATIBILITY_MAV_EMMAPP = Compatibility(
        name = "MÁVPlusz", // App name as it appears in the Android launcher.
        packageName = "hu.mav.emmapp",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0x00695C, // App's primary color
        targets = listOf(
            AppTarget(version = "2.4.19-prod") // Works with all versions
        )
    )

}

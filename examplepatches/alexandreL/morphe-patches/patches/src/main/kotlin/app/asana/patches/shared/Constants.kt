package app.asana.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ASANA_REBEL = Compatibility(
        name = "Asana Rebel",
        packageName = "com.asanayoga.asanarebel",
        apkFileType = ApkFileType.APK,
        // Icon background color of the app, shown by Morphe Manager. Must be 0xRRGGBB.
        appIconColor = 0x0B0B0B,
        targets = listOf(
            // Version the patch was written and tested against.
            AppTarget(version = "6.29.0.7409")
        )
    )
}

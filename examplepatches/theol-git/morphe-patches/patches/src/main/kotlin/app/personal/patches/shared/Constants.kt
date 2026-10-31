package app.personal.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PRO_LAUNCHER = Compatibility(
        name = "Pro Launcher",
        packageName = "app.prolauncher",
        apkFileType = ApkFileType.APK,
        // Icon color in Morphe Manager. Set to the icon's background color.
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "v2.4.3"
            )
        )
    )
}

package app.mctoolbox.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MCTOOLBOX = Compatibility(
        name = "Toolbox for Minecraft PE",
        packageName = "io.mrarm.mctoolbox",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3E2723,
        targets = listOf(
            AppTarget(version = "5.4.58")
        )
    )
}

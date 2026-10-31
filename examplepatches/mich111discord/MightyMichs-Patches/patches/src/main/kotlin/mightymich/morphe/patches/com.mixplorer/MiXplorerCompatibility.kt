package mightymich.morphe.patches.com.mixplorer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MiXplorerCompatibility {
    val MIXPLORER = Compatibility(
        name = "MiXplorer",
        packageName = "com.mixplorer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "6.71.15"),
            AppTarget(version = "6.71.14"),
            AppTarget(version = "6.71.12"),
            AppTarget(version = "6.71.10"),
        )
    )
}

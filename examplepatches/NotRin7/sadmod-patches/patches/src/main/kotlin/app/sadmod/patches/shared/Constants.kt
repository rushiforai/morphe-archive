package app.sadmod.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HAPPYMOD = Compatibility(
        name = "HappyMod",
        packageName = "com.happymod.apk",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x22C55E,
        targets = listOf(
            AppTarget(
                version = "3.4.5"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}

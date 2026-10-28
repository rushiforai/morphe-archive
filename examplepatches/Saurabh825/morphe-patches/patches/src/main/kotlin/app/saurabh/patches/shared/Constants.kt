package app.saurabh.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BLABLACAR = Compatibility(
        name = "BlaBlaCar",
        packageName = "com.comuto",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "6.36.0"
            )
        )
    )
}

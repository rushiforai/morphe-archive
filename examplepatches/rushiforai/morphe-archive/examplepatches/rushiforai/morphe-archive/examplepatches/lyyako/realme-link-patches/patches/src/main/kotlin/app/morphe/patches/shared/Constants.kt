package app.morphe.patches.realmelink.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_REALMELINK = Compatibility(
        name = "Realme Link",
        packageName = "com.realme.link",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x927DFD,
        targets = listOf(
            AppTarget(version = null)
        )
    )
}
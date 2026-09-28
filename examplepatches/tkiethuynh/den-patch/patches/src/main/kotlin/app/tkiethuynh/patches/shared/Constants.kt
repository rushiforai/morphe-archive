package app.tkiethuynh.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MISA = Compatibility(
        name = "MISA Money Keeper",
        packageName = "vn.com.misa.sothuchi",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A859,
        targets = listOf(
            AppTarget(version = "93.4")
        )
    )

    val COMPATIBILITY_PROXMAN = Compatibility(
        name = "Proxman",
        packageName = "com.windium.proxman",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x007AFF,
        targets = listOf(
            AppTarget(version = "1.5.1"),
            AppTarget(version = "1.6.0")
        )
    )
}

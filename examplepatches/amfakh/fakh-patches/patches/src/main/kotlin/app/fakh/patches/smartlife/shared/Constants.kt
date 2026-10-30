package app.fakh.patches.smartlife.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SMARTLIFE = Compatibility(
        name = "Smart Life",
        packageName = "com.tuya.smartlife",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "7.12.3", versionCode = 877)),
    )

    val COMPATIBILITY_TUYA_SMART = Compatibility(
        name = "Tuya Smart",
        packageName = "com.tuya.smart",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "7.12.3", versionCode = 870)),
    )

    val COMPATIBILITY_BARDI = Compatibility(
        name = "BARDI Smart Home",
        packageName = "com.bardi.smart.home",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF5A1F,
        targets = listOf(AppTarget(version = "1.5.3", versionCode = 49)),
    )
}

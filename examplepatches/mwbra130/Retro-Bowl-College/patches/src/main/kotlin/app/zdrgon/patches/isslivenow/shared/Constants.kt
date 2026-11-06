package app.zdrgon.patches.isslivenow.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ISS_LIVE_NOW = Compatibility(
        name = "ISS Live Now",
        packageName = "com.nicedayapps.iss_free",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "8.7.3")
        )
    )
}

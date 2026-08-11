package app.atharv.patches.olaelectric.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_OLA_ELECTRIC = Compatibility(
        name = "Ola Electric",
        packageName = "com.olaelectric.companion",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x00D190,
        targets = listOf(
            AppTarget(version = "5.4.0")
        )
    )
}

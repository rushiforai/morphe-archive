package app.zdrgon.patches.businessx.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BUSINESSX = Compatibility(
        name = "BusinessX",
        packageName = "com.shrey_businessx.android",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x0288D1,
        targets = listOf(
            AppTarget(version = "6.5.2", isExperimental = true)
        )
    )
}

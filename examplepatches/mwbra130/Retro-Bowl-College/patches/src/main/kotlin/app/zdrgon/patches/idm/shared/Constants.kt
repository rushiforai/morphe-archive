package app.zdrgon.patches.idm.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IDM = Compatibility(
        name = "1DM: Browser & Video Download",
        packageName = "idm.internet.download.manager",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x6A1B9A,
        targets = listOf(
            AppTarget(version = "20.0")
        )
    )
}

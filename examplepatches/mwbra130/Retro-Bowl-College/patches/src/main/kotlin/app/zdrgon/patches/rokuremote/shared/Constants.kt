package app.zdrgon.patches.rokuremote.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ROKU_REMOTE = Compatibility(
        name = "Roku Remote",
        packageName = "com.swiftsofts.rokuremote",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF9800,
        targets = listOf(
            AppTarget(version = "1.3.2")
        )
    )
}

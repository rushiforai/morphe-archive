package app.paresh.patches.alarmo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ALARMO = Compatibility(
        name = "Alarmo",
        packageName = "com.bytesong.missionalarm",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x6C63FF,
        targets = listOf(
            AppTarget(version = "1.3.7")
        )
    )
}

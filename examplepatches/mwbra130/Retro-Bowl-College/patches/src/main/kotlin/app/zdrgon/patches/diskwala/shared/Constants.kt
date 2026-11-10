package app.zdrgon.patches.diskwala.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DISKWALA = Compatibility(
        name = "DiskWala",
        packageName = "com.diskwalaapp",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE8A317,
        targets = listOf(
            AppTarget(version = "27.3", isExperimental = true)
        )
    )
}

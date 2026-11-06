package app.zdrgon.patches.unifiedremote.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_UNIFIED_REMOTE = Compatibility(
        name = "Unified Remote",
        packageName = "com.Relmtech.Remote",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x43A047,
        targets = listOf(
            AppTarget(version = "3.25.1")
        )
    )
}

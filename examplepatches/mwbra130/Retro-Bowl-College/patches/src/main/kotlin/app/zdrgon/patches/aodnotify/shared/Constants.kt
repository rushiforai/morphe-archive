package app.zdrgon.patches.aodnotify.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_AODNOTIFY = Compatibility(
        name = "aodNotify",
        packageName = "com.jamworks.alwaysondisplay",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x03A9F4,
        targets = listOf(
            AppTarget(version = "6.10")
        )
    )
}

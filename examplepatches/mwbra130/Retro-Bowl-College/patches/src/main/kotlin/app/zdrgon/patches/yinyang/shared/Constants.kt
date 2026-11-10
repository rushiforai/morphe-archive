package app.zdrgon.patches.yinyang.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YIN_YANG = Compatibility(
        name = "Yin Yang Launcher",
        packageName = "com.yinyang.launcher",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x607D8B,
        targets = listOf(
            AppTarget(version = "5.13.1", isExperimental = true)
        )
    )
}

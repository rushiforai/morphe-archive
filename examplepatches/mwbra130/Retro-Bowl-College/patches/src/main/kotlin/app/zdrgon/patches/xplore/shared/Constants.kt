package app.zdrgon.patches.xplore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_XPLORE = Compatibility(
        name = "X-plore",
        packageName = "com.lonelycatgames.Xplore",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "4.52.02", isExperimental = true)
        )
    )
}

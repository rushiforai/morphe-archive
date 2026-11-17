package app.zdrgon.patches.luminar.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LUMINAR = Compatibility(
        name = "Luminar",
        packageName = "com.skylum.luminar",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x7C4DFF,
        targets = listOf(
            AppTarget(version = "4.6")
        )
    )
}

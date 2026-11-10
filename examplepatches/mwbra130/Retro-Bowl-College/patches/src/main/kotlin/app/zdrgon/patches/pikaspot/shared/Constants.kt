package app.zdrgon.patches.pikaspot.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PIKASPOT = Compatibility(
        name = "Pika Spot",
        packageName = "com.pika.dynamicisland",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x7C4DFF,
        targets = listOf(
            AppTarget(version = "1.4.5", isExperimental = true)
        )
    )
}

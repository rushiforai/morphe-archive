package app.morphe.patches.waze.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            AppTarget(version = "5.27.5.0"),
        ),
    )
}

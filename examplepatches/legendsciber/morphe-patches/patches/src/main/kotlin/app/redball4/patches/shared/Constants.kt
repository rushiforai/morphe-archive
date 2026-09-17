package app.redball4.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_REDBALL4 = Compatibility(
        name = "Red Ball 4",
        packageName = "com.FDGEntertainment.redball4.gp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCC0000,
        targets = listOf(
            AppTarget(version = "1.17.03")
        )
    )
}

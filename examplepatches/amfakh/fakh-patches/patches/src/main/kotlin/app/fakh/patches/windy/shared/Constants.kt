package app.fakh.patches.windy.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WINDY = Compatibility(
        name = "Windy",
        packageName = "com.windyty.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0FA0EB,
        targets = listOf(AppTarget(version = "51.3.2", versionCode = 5103023)),
    )
}

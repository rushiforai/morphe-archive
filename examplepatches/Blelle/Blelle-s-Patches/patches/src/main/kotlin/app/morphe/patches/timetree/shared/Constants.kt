package app.morphe.patches.timetree.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TIMETREE = Compatibility(
        name = "TimeTree: Shared Calendar",
        packageName = "works.jubilee.timetree",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x22C55E,
        targets = listOf(
            AppTarget(
                version = "15.34.1"
            )
        )
    )
}

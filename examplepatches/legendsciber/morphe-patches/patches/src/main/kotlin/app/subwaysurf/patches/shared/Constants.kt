package app.subwaysurf.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SUBWAYSURF = Compatibility(
        name = "Subway Surfers",
        packageName = "com.kiloo.subwaysurf",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF9A825,
        targets = listOf(
            AppTarget(version = "3.69.1")
        )
    )
}

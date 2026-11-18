package app.morphe.patches.moviebox

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME_ONEROOM = "com.community.oneroom"

    val COMPATIBILITY_MOVIEBOX = Compatibility(
        name = "MovieBox",
        packageName = PACKAGE_NAME_ONEROOM,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5500,
        targets = listOf(
            AppTarget(version = null),
            AppTarget(version = "4.0.03.0930.03"),
            AppTarget(version = "4.0.03.0922.03"),
            AppTarget(version = "4.0.03.0918.03"),
            AppTarget(version = "4.0.03"),
            AppTarget(version = "4.0.02")
        )
    )
}

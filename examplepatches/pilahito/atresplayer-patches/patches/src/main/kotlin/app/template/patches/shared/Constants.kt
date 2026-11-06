package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ATRESPLAYER = Compatibility(
        name = "atresplayer",
        packageName = "com.a3.sgt",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A1A1A,
        targets = listOf(
            AppTarget(
                version = "5.8.0"
            )
        )
    )
}

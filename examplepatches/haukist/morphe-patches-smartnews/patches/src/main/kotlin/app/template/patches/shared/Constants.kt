package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SMARTNEWS = Compatibility(
        name = "SmartNews",
        packageName = "jp.gocro.smartnews.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE60012,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "26.10.30"
            )
        )
    )
}

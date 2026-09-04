package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val YT_STUDIO_PACKAGE_NAME =
        "com.google.android.apps.youtube.creator"

    val YT_STUDIO_COMPATIBILITY = Compatibility(
        name = "YouTube Studio",
        packageName = YT_STUDIO_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000,
        targets = listOf(
            AppTarget(
                version = null
            )
        )
    )
}

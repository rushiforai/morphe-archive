package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val GOOGLE_PHOTOS_COMPATIBILITY = Compatibility(
        name = "Google Photos",
        packageName = "com.google.android.apps.photos",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4285F4,
        targets = listOf(
            AppTarget(version = "7.92.0.977185651"),
            AppTarget(version = "7.80.0.929302933"),
            AppTarget(version = null, isExperimental = true)
        )
    )
}

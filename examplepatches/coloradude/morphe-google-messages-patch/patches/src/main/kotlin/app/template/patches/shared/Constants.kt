package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GOOGLE_MESSAGES = Compatibility(
        name = "Google Messages",
        packageName = "com.google.android.apps.messaging",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "messages.android_20261020_00_RC01.phone_dynamic")
        )
    )
}

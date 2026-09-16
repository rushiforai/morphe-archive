package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    const val GOOGLE_PHONE_PACKAGE_NAME =
        "com.google.android.dialer"

    val GOOGLE_PHONE_COMPATIBILITY = Compatibility(
        name = "Google Phone",
        packageName = GOOGLE_PHONE_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4285F4,
        targets = listOf(
            AppTarget(
                version = "236.0.969488611-downloadable"
            )
        )
    )
}

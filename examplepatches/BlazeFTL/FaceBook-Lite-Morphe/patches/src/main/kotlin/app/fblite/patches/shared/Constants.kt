package app.fblite.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** Only 536.0.0.11.107 is supported. The extensions name obfuscated classes of that build. */
    val COMPATIBILITY_FACEBOOK_LITE = Compatibility(
        name = "Facebook Lite",
        packageName = "com.facebook.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1877F2,
        targets = listOf(
            AppTarget(
                version = "536.0.0.11.107"
            ),
        )
    )
}

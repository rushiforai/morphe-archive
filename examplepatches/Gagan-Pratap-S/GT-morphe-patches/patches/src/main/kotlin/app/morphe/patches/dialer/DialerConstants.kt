package app.morphe.patches.dialer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DialerConstants {
    val COMPATIBILITY_GOOGLE_DIALER = Compatibility(
        name = "Phone",
        packageName = "com.google.android.dialer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(
                version = "241.0.996790549"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}

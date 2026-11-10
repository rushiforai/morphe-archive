package app.fbpatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FACEBOOK = Compatibility(
        name = "Facebook",
        packageName = "com.facebook.katana",
        // APKMirror ships this version as an .apkm bundle.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1877F2,
        targets = listOf(
            AppTarget(version = "585.0.0.47.54")
        )
    )
}

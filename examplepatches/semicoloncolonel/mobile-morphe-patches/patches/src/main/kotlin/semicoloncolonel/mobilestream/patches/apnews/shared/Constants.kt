package semicoloncolonel.mobilestream.patches.apnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "AP News",
        packageName = "mnn.Android",
        description = "The AP News app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE11B22,
        targets = listOf(
            AppTarget("6.32.1 PROD", versionCode = 10464),
            AppTarget("6.32 PROD", versionCode = 10459),
            AppTarget("6.31.2 PROD"),
        )
    )
}

package semicoloncolonel.mobilestream.patches.slickdeals.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Slickdeals",
        packageName = "net.slickdeals.android",
        description = "The Slickdeals deals community app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A6EBF,
        targets = listOf(AppTarget("6.36.0", versionCode = 1591))
    )
}

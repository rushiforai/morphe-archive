package semicoloncolonel.mobilestream.patches.slickdeals.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Slickdeals",
        packageName = "net.slickdeals.android",
        description = "The Slickdeals deals community app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A6EBF,
        targets = listOf(devTarget("6.36.0", versionCode = 1591))
    )
}

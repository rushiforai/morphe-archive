package semicoloncolonel.mobilestream.patches.whitehouse.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "White House",
        packageName = "gov.whitehouse.app",
        description = "The official White House app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A2240,
        targets = listOf(
            AppTarget("47.7.11", versionCode = 154),
            AppTarget("47.7.8"),
        )
    )
}

package semicoloncolonel.mobilestream.patches.whitehouse.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "White House",
        packageName = "gov.whitehouse.app",
        description = "The official White House app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A2240,
        targets = listOf(AppTarget("47.7.8"))
    )
}

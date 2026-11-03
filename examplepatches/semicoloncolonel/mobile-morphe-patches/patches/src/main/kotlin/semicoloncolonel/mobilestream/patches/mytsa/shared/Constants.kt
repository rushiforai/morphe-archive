package semicoloncolonel.mobilestream.patches.mytsa.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MyTSA",
        packageName = "gov.dhs.tsa.mytsa",
        description = "The TSA's MyTSA app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0F2B5B,
        targets = listOf(AppTarget("5.1.0"))
    )
}

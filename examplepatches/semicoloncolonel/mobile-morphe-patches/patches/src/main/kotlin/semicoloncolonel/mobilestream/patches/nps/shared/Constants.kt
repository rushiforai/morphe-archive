package semicoloncolonel.mobilestream.patches.nps.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NPS",
        packageName = "gov.nps.mobileapp",
        description = "The National Park Service app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2B4423,
        targets = listOf(AppTarget("2.15.0"))
    )
}

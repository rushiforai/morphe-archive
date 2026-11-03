package semicoloncolonel.mobilestream.patches.fema.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "FEMA",
        packageName = "gov.fema.mobile.android",
        description = "The FEMA app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x13366D,
        targets = listOf(AppTarget("3.2.1"))
    )
}

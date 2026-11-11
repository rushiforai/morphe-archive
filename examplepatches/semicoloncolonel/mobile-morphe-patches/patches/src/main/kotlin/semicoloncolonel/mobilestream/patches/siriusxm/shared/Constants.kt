package semicoloncolonel.mobilestream.patches.siriusxm.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "SiriusXM",
        packageName = "com.sirius",
        description = "The SiriusXM app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0000EB,
        targets = listOf(AppTarget("2610.4.0")),
    )
}

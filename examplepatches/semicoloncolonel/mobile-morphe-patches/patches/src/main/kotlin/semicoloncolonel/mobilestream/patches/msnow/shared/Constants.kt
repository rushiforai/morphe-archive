package semicoloncolonel.mobilestream.patches.msnow.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MS NOW",
        packageName = "com.nbcnews.msnbc.mobile",
        description = "The MS NOW (formerly MSNBC) app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A2240,
        targets = listOf(AppTarget("14.6.0"))
    )
}

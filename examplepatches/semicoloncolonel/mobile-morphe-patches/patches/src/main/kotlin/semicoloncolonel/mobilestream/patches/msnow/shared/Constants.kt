package semicoloncolonel.mobilestream.patches.msnow.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MS NOW",
        packageName = "com.nbcnews.msnbc.mobile",
        description = "The MS NOW (formerly MSNBC) app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A2240,
        targets = listOf(AppTarget("14.6.0"), devTarget("14.7.1", versionCode = 1405990))
    )
}

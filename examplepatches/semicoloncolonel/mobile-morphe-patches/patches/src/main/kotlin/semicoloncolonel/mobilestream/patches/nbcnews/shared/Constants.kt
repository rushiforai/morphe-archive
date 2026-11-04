package semicoloncolonel.mobilestream.patches.nbcnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NBC News",
        packageName = "com.zumobi.msnbc",
        description = "The NBC News app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A0A0A,
        targets = listOf(AppTarget("15.0.1"))
    )
}

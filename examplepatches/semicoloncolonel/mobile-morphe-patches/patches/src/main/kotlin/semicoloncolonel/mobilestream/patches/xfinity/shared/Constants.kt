package semicoloncolonel.mobilestream.patches.xfinity.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Xfinity",
        packageName = "com.xfinity.digitalhome",
        description = "The Xfinity app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6138F5,
        targets = listOf(AppTarget("6.14.0-2"), devTarget("6.16.0-2", versionCode = 61600002))
    )
}

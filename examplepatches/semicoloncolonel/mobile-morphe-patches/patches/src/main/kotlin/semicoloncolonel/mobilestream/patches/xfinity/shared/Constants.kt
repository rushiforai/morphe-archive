package semicoloncolonel.mobilestream.patches.xfinity.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Xfinity",
        packageName = "com.xfinity.digitalhome",
        description = "The Xfinity app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6138F5,
        targets = listOf(AppTarget("6.14.0-2"))
    )
}

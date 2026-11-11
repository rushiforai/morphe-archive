package semicoloncolonel.mobilestream.patches.cnbc.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CNBC",
        packageName = "com.cnbc.client",
        description = "The CNBC business news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x005594,
        targets = listOf(AppTarget("8.8.2")),
    )
}

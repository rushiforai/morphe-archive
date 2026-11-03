package semicoloncolonel.mobilestream.patches.att.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "myAT&T",
        packageName = "com.att.myWireless",
        description = "The myAT&T app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x009FDB,
        targets = listOf(AppTarget("2026.10.1"))
    )
}

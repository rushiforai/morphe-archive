package semicoloncolonel.mobilestream.patches.verizon.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "My Verizon",
        packageName = "com.vzw.hss.myverizon",
        description = "The My Verizon app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xEE0000,
        targets = listOf(AppTarget("22.2.5"))
    )
}

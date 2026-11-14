package semicoloncolonel.mobilestream.patches.verizon.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "My Verizon",
        packageName = "com.vzw.hss.myverizon",
        description = "The My Verizon app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xEE0000,
        targets = listOf(
            devTarget("22.3.5", versionCode = 576),
            AppTarget("22.2.5"),
        )
    )
}

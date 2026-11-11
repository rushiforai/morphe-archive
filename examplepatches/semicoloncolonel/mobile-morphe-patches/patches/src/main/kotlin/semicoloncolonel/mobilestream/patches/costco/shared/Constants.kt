package semicoloncolonel.mobilestream.patches.costco.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Costco",
        packageName = "com.costco.app.android",
        description = "The Costco Wholesale shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x005DAB,
        targets = listOf(AppTarget("26.10.2.2")),
    )
}

package semicoloncolonel.mobilestream.patches.ebay.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "eBay",
        packageName = "com.ebay.mobile",
        description = "The eBay shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0064D2,
        targets = listOf(
            devTarget("6.244.0.1", versionCode = 6244001),
        )
    )
}

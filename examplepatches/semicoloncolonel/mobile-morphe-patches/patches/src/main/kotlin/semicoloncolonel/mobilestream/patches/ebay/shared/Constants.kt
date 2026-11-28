package semicoloncolonel.mobilestream.patches.ebay.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "eBay",
        packageName = "com.ebay.mobile",
        description = "The eBay shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0064D2,
        targets = listOf(
            AppTarget("6.244.0.1", versionCode = 6244001, isExperimental = true),
        )
    )
}

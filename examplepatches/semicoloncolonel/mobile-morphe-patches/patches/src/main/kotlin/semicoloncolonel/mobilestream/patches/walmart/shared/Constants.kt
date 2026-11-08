package semicoloncolonel.mobilestream.patches.walmart.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Walmart",
        packageName = "com.walmart.android",
        description = "The Walmart shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0071DC,
        targets = listOf(devTarget("26.42.1"))
    )
}

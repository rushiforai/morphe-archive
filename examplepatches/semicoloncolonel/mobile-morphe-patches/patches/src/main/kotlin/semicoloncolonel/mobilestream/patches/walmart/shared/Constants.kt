package semicoloncolonel.mobilestream.patches.walmart.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Walmart",
        packageName = "com.walmart.android",
        description = "The Walmart shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0071DC,
        targets = listOf(
            AppTarget(version = "26.42.1"),
            // Google Play is still rolling 26.42.2 out (2026-11-08), so it
            // stays experimental until Play serves it to everyone.
            AppTarget(version = "26.42.2", isExperimental = true),
        )
    )
}

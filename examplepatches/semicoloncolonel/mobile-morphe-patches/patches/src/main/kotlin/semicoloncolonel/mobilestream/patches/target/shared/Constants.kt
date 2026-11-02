package semicoloncolonel.mobilestream.patches.target.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Target",
        packageName = "com.target.ui",
        description = "The Target shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget("2026.43.0"))
    )
}

package semicoloncolonel.mobilestream.patches.mgm.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MGM+",
        packageName = "com.epix.epix.now",
        description = "The MGM+ phone app (formerly Epix).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xC9A227,
        targets = listOf(AppTarget("240.0.2026240000"))
    )
}

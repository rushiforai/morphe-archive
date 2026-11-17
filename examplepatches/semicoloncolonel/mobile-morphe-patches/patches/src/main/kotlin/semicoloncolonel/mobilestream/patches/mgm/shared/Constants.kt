package semicoloncolonel.mobilestream.patches.mgm.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MGM+",
        packageName = "com.epix.epix.now",
        description = "The MGM+ app (formerly Epix), for phones (240.0.2026240000) and Android TV (241.0.2026241001).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xC9A227,
        targets = listOf(
            AppTarget("240.0.2026240000", description = "Phone build"),
            AppTarget("241.0.2026241001", description = "Android TV build"),
        )
    ).splitByBundle(
        phoneDescription = "The MGM+ phone app (formerly Epix).",
        tvDescription = "The MGM+ app.",
    )
}

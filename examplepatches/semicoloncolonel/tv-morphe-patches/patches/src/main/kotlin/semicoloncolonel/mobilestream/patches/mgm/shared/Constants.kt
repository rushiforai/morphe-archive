package semicoloncolonel.mobilestream.patches.mgm.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MGM+",
        packageName = "com.epix.epix.now",
        description = "The MGM+ app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xC9A227,
        targets = listOf(
            AppTarget("241.0.2026241001"),
        ),
        formFactor = FormFactor.TV,
    )
}

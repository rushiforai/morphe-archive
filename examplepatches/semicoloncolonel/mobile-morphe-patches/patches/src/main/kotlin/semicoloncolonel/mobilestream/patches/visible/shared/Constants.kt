package semicoloncolonel.mobilestream.patches.visible.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Visible",
        packageName = "com.visiblemobile.flagship",
        description = "The Visible app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1800FF,
        targets = listOf(AppTarget("3.0.5"))
    )
}

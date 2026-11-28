package semicoloncolonel.mobilestream.patches.visible.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Visible",
        packageName = "com.visiblemobile.flagship",
        description = "The Visible app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1800FF,
        targets = listOf(
            AppTarget("3.0.6", versionCode = 300060),
            devTarget("3.0.7", versionCode = 300071),
            AppTarget("3.0.5"),
        )
    )
}

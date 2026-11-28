package semicoloncolonel.mobilestream.patches.sundancenow.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Sundance Now",
        packageName = "com.dramafever.docclub",
        description = "The Sundance Now streaming app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF5B400,
        targets = listOf(AppTarget("5.0.25.2"), devTarget("5.0.30.1", versionCode = 1031111)),
    )
}

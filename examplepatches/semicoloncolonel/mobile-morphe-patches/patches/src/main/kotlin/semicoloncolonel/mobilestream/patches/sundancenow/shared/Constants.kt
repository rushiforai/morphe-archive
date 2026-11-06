package semicoloncolonel.mobilestream.patches.sundancenow.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Sundance Now",
        packageName = "com.dramafever.docclub",
        description = "The Sundance Now streaming app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF5B400,
        targets = listOf(AppTarget("5.0.25.2")),
    )
}

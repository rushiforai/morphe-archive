package semicoloncolonel.mobilestream.patches.walgreens.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Walgreens",
        packageName = "com.usablenet.mobile.walgreen",
        description = "The Walgreens app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE31837,
        targets = listOf(AppTarget("118.0"))
    )
}

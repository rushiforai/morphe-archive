package semicoloncolonel.mobilestream.patches.walgreens.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Walgreens",
        packageName = "com.usablenet.mobile.walgreen",
        description = "The Walgreens app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE31837,
        targets = listOf(
            devTarget("118.1", versionCode = 729118110),
            AppTarget("118.0"),
        )
    )
}

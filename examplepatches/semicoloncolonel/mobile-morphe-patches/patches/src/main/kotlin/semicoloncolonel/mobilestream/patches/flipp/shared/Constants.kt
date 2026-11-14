package semicoloncolonel.mobilestream.patches.flipp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Flipp",
        packageName = "com.wishabi.flipp",
        description = "The Flipp weekly ads and deals app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0095DA,
        targets = listOf(devTarget("115.0.0", versionCode = 1632))
    )
}

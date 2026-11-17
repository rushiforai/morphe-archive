package semicoloncolonel.mobilestream.patches.flipp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Flipp",
        packageName = "com.wishabi.flipp",
        description = "The Flipp weekly ads and deals app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0095DA,
        targets = listOf(AppTarget("115.0.0", versionCode = 1632), AppTarget("116.0.0", versionCode = 1635))
    )
}

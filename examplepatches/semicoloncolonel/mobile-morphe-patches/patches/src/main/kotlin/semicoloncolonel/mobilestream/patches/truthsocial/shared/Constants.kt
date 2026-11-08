package semicoloncolonel.mobilestream.patches.truthsocial.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Truth Social",
        packageName = "com.truthsocial.android.app",
        description = "The Truth Social phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5448EE,
        targets = listOf(devTarget("1.28.3", versionCode = 1279)),
    )
}

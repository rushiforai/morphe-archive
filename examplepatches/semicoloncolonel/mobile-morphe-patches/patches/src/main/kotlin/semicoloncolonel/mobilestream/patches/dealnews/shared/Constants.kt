package semicoloncolonel.mobilestream.patches.dealnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "DealNews",
        packageName = "com.dealnews.android.ui",
        description = "The DealNews deals app. Needs the Pairip license-check patch to run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE4002B,
        targets = listOf(
            AppTarget(version = "10.7.2", versionCode = 377, isExperimental = true),
            devTarget("10.7.1", versionCode = 375),
        )
    )
}

package semicoloncolonel.mobilestream.patches.dealseek.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "DealSeek",
        packageName = "com.dealseekorg.dealseek",
        description = "The DealSeek shopping-deals app. Needs the Pairip license-check patch to " +
            "run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6329,
        targets = listOf(
            AppTarget("1.65.0", versionCode = 518),
            devTarget("1.66.17", versionCode = 522),
            devTarget("1.67.0", versionCode = 523),
            AppTarget("1.64.0"),
        )
    )
}

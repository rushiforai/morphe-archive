package semicoloncolonel.mobilestream.patches.dealseek.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "DealSeek",
        packageName = "com.dealseekorg.dealseek",
        description = "The DealSeek shopping-deals app. Needs the Pairip license-check patch to " +
            "run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6329,
        targets = listOf(AppTarget("1.64.0"))
    )
}

package semicoloncolonel.mobilestream.patches.kouponai.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Koupon",
        packageName = "com.kouponai",
        description = "The Koupon (KouponAI) promo code and price drop app. APKMirror does not carry it, so " +
            "install it from Google Play and patch it with \"Use installed app\".",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2B2B2B,
        targets = listOf(AppTarget("3.1.6", versionCode = 189))
    )
}

package semicoloncolonel.mobilestream.patches.retailmenot.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "RetailMeNot",
        packageName = "com.whaleshark.retailmenot",
        description = "The RetailMeNot coupons and cash back app. Needs the Pairip license-check patch to run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6A2C91,
        targets = listOf(AppTarget(version = "10.0.6", versionCode = 100129))
    )
}

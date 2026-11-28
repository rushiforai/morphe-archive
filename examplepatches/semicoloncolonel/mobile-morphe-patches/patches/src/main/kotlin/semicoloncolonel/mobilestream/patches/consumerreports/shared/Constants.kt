package semicoloncolonel.mobilestream.patches.consumerreports.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Consumer Reports",
        packageName = "org.consumerreports.ratings",
        description = "The Consumer Reports product-reviews and ratings app. A React Native app, so " +
            "its native code is in a separate part of the bundle: patch the Google Play copy with " +
            "\"Use installed app\", or the full .apkm, not a single .apk.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00AC4C,
        targets = listOf(AppTarget("5.25.0-1326", versionCode = 52501326, isExperimental = true)),
    )
}

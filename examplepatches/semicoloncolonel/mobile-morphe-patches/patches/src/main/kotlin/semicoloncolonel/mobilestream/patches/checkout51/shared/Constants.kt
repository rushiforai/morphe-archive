package semicoloncolonel.mobilestream.patches.checkout51.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Checkout 51",
        packageName = "com.c51",
        description = "The Checkout 51 grocery cash back app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF15A29,
        targets = listOf(AppTarget(version = "9.22.10", versionCode = 39425))
    )
}

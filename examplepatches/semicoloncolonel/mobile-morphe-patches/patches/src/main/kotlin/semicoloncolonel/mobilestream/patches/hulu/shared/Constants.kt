package semicoloncolonel.mobilestream.patches.hulu.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Hulu",
        packageName = "com.hulu.plus",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1CE783,
        targets = listOf(AppTarget("6.34.0+18552420-google"))
    )
}

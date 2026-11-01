package semicoloncolonel.mobilestream.patches.espn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ESPN",
        packageName = "com.espn.score_center",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget("8.27.0"))
    )
}

package semicoloncolonel.mobilestream.patches.primevideo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Prime Video",
        packageName = "com.amazon.avod.thirdpartyclient",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1399FF,
        targets = listOf(AppTarget("3.0.477.1447"))
    )
}

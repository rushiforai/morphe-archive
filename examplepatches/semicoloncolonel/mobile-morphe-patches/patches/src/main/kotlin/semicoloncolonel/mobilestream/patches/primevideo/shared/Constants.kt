package semicoloncolonel.mobilestream.patches.primevideo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Prime Video",
        packageName = "com.amazon.avod.thirdpartyclient",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1399FF,
        targets = listOf(
            devTarget("3.0.480.847", versionCode = 480000847),
            AppTarget("3.0.480.747", versionCode = 480000747),
            AppTarget("3.0.479.847"),
        )
    )
}

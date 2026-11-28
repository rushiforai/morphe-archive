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
            AppTarget("3.0.481.1947", versionCode = 481001947),
            devTarget("3.0.481.2447", versionCode = 481002447),
            devTarget("3.0.481.2847", versionCode = 481002847),
            devTarget("3.0.482.1447", versionCode = 482001447),
            devTarget("3.0.482.2147", versionCode = 482002147),
            AppTarget("3.0.480.847", versionCode = 480000847),
            AppTarget("3.0.480.747", versionCode = 480000747),
            AppTarget("3.0.479.847"),
            AppTarget("3.0.480.647", versionCode = 480000647),
            AppTarget("3.0.477.1447", versionCode = 477001447),
        )
    )
}

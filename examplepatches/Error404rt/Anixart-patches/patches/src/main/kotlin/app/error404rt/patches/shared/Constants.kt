package app.error404rt.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ANIXART = Compatibility(
        name = "Anixart",
        packageName = "com.swiftsoft.anixartd",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF4D6D,
        targets = listOf(
            AppTarget(version = "10.0")
        )
    )
}

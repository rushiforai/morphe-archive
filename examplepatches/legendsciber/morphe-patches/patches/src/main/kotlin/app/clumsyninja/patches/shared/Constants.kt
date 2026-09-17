package app.clumsyninja.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CLUMSYNINJA = Compatibility(
        name = "Clumsy Ninja",
        packageName = "com.naturalmotion.clumsyninja",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6F00,
        targets = listOf(
            AppTarget(version = "1.33.5")
        )
    )
}

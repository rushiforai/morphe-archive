package app.kyurem39.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MPVEX = Compatibility(
        name = "mpvEx",
        packageName = "app.marlboroadvance.mpvex",
        apkFileType = ApkFileType.APK,
        // Background color of the launcher icon.
        appIconColor = 0x2F282C,
        targets = listOf(
            // Play Store flavor, universal APK.
            AppTarget(version = "1.3.1-playstore"),
        )
    )
}

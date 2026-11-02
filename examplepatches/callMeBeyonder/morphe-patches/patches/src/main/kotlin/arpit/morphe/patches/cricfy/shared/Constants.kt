package arpit.morphe.patches.cricfy.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CRICFY_TV = Compatibility(
        name = "CRICFy TV",
        packageName = "com.cricfytv.sports",
        apkFileType = ApkFileType.APK,
        // Deep navy of the app icon.
        appIconColor = 0x002060,
        targets = listOf(
            AppTarget(
                version = "7.3"
            ),
            AppTarget(
                version = "7.4"
            ),
        )
    )
}

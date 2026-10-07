package app.linkedin.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PACKAGE = "Lapp/linkedin/extension"

    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        // The "Android 10+" APKMirror variant is a plain APK (newer 12L+ builds are bundles only).
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A66C2,
        targets = listOf(
            AppTarget(
                version = "4.1.1255.1"
            ),
            AppTarget(
                version = "4.1.1258"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}

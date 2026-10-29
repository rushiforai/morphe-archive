package app.fakh.patches.linkedin.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PACKAGE = "Lapp/fakh/extension/linkedin"

    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        // 4.1.1264 is only on APKMirror as a bundle; Morphe merges APKM splits itself.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A66C2,
        targets = listOf(
            // Morphe recommends the newest supported version, so keep the newest tested one last.
            AppTarget(
                version = "4.1.1264"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}

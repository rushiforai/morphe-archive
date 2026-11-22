package app.fakh.patches.linkedin.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PACKAGE = "Lapp/fakh/extension/linkedin"

    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        // LinkedIn is only on APKMirror as a bundle; Morphe merges APKM splits itself.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A66C2,
        targets = listOf(
            // Morphe recommends the newest supported version, so keep the newest tested one last.
            AppTarget(
                version = "4.1.1264",
                versionCode = 217200
            ),
            AppTarget(
                version = "4.1.1267",
                versionCode = 217500
            ),
            AppTarget(
                version = "4.1.1269",
                versionCode = 217700
            ),
            AppTarget(
                version = "4.1.1270",
                versionCode = 217800
            ),
            AppTarget(
                version = "4.1.1272",
                versionCode = 218000
            ),
            AppTarget(
                version = "4.1.1275",
                versionCode = 218300
            ),
            AppTarget(
                version = "4.1.1276",
                versionCode = 218400
            ),
            AppTarget(
                version = "4.1.1278",
                versionCode = 218600
            )
        )
    )
}

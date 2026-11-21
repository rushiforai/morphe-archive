package app.badfella.patches.linkedin.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val LINKEDIN_PACKAGE = "com.linkedin.android"
    /** Original signing certificate used for Firebase registration and microG identity. */
    const val LINKEDIN_SIGNATURE = "443cb997718d0ac5162888bae5e4724582862676"

    const val EXTENSION_PACKAGE = "Lapp/badfella/extension/linkedin"

    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        // The "Android 10+" APKMirror variant is a plain APK (newer 12L+ builds are bundles only).
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A66C2,
        targets = listOf(
            // Morphe recommends the newest supported version, so keep the newest tested one last.
            AppTarget(
                version = "4.1.1267",
            ),
            AppTarget(
                version = "4.1.1271",
                versionCode = 217900,
                description = "Version 4.1.1271, build 217900.",
            ),
            AppTarget(
                version = "4.1.1272",
                versionCode = 218000,
                description = "Version 4.1.1272, build 218000.",
            ),
            AppTarget(
                version = "4.1.1275",
                versionCode = 218300,
                description = "Version 4.1.1275 beta, build 218300.",
            ),
            AppTarget(
                version = "4.1.1276",
                versionCode = 218400,
                description = "Version 4.1.1276 beta, build 218400.",
            ),
            // Every patch resolves its targets by class, method and instruction shape rather than by
            // offsets or a version pin, so later LinkedIn builds can be patched without a code change.
            // Morphe flags this target as experimental and still checks each patch's own anchors.
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Any version (experimental). Every patch verifies its own anchors.",
            ),
        ),
    )
}

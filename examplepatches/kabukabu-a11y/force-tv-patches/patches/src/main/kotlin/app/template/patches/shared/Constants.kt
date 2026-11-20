package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ZANGETSU = Compatibility(
        name = "Zangetsu",
        packageName = "com.spyou.watch_app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B1B1F,
        targets = listOf(
            // Universal target: no version pin. The fingerprints anchor on
            // stable string literals in Zangetsu's own (unobfuscated) code,
            // so the patch is expected to keep working across app updates,
            // which Zangetsu ships frequently.
            AppTarget(
                version = null
            ),
            // Developed and verified against the official 2.3.6 arm64 build.
            AppTarget(
                version = "2.3.6"
            )
        )
    )
}

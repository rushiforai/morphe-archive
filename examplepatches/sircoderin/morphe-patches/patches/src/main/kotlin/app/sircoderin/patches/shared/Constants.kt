package app.sircoderin.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KVAESITSO = Compatibility(
        name = "Kvaesitso",
        packageName = "de.mm20.launcher2.release",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4F46E5,
        targets = listOf(
            // Developed and verified against the official GitHub release.
            AppTarget(version = "1.41.0"),
            // The patched method is a stable, unobfuscated class name; likely fine on later versions.
            AppTarget(version = null, isExperimental = true),
        )
    )
}

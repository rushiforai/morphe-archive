package app.threadripper.patches.youtube

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000,
        targets = listOf(
            // Version the hooks were developed and verified on.
            AppTarget(version = "21.16.256"),
            // The hooks match media3 structure, not obfuscated names, so other versions may work.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}

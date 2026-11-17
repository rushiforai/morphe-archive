package app.zdrgon.patches.drapes.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DRAPES = Compatibility(
        name = "Drapes",
        packageName = "com.codeswitch.drapes",
        // Matsen's source file is an XAPK bundle: Morphe merges the split
        // bundle (base + config.arm64_v8a/en/es/xxhdpi) into a single APK
        // before patching.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFFB300,
        targets = listOf(
            AppTarget(version = "3.9.3"),
        ),
    )
}

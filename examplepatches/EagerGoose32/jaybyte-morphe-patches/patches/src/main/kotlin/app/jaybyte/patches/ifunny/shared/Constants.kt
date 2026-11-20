package app.jaybyte.patches.ifunny.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION = "extensions/extension.mpe"
    const val EXTENSION_PKG = "Lapp/jaybyte/extension/ifunny"

    val COMPATIBILITY_IFUNNY = Compatibility(
        name = "iFunny",
        packageName = "mobi.ifunny",
        // iFunny ships as a split bundle; Morphe merges it.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFCC00,
        targets = listOf(
            // Developed and verified against this version.
            AppTarget(version = "10.45.14"),
        ),
    )
}

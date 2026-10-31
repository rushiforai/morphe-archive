package app.southstar21.patches.instagram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        // APKMirror only ships Instagram as split bundles.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE1306C,
        targets = listOf(
            // Hooks target unobfuscated lifecycle methods, so newer versions
            // will probably work too, but only this one is verified.
            AppTarget(
                version = "439.0.0.37.89"
            ),
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}

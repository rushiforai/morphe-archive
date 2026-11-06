package app.jofslash.patches.quora.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_QUORA = Compatibility(
        name = "Quora",
        packageName = "com.quora.android",
        // APKMirror ships Quora as a bundle (APKM).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xB92B27,
        targets = listOf(
            AppTarget(version = "3.2.42"),
            AppTarget(version = "3.2.30"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}

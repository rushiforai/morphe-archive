package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GOSPEL_LIBRARY = Compatibility(
        name = "Gospel Library",
        packageName = "org.lds.ldssa",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B5E7B,
        targets = listOf(
            AppTarget(version = null, isExperimental = true),
            AppTarget(version = "7.9.1"),
            AppTarget(version = "7.8.0")
        )
    )
}

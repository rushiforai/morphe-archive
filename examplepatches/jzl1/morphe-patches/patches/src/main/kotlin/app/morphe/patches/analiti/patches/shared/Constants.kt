package lab.analiti.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_ANALITI = Compatibility(
    name = "analiti",
    packageName = "com.analiti.fastest.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1B5E20,
    targets = listOf(
        AppTarget(
            version = "2026.10.98884",
            description = "",
        ),
        AppTarget(
            version = "2026.10.98554",
            description = "",
        ),
    ),
)

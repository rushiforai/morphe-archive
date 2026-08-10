package app.template.patches.findthefire.premium

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType

val FIND_THE_FIRE_COMPATIBILITY = Compatibility(
    name = "Skimboarding",
    packageName = "com.findthefirellc.findthefire",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0xFF6B35,
    targets = listOf(
        AppTarget(version = "1.0.0", versionCode = 19)
    )
)

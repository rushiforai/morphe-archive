package app.paresh.patches.cricbuzz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CRICBUZZ = Compatibility(
        name = "Cricbuzz",
        packageName = "com.cricbuzz.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B5E20,
        targets = listOf(
            AppTarget(version = "16.02.05")
        )
    )
}

package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    val TEAMS_COMPATIBILITY = Compatibility(
        name = "Teams",
        packageName = "com.microsoft.teams",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6264A7,
        targets = listOf(AppTarget(version = "1416/1.0.0.2026152302", versionCode = 2026152325))
    )

}

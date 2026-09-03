package app.shadowfight.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SF2 = Compatibility(
        name = "Shadow Fight 2",
        packageName = "com.nekki.shadowfight",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A1A1A,
        targets = listOf(
            AppTarget(version = "2.46.0", isExperimental = true)
        )
    )
}

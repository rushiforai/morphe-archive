package app.paresh.patches.habitkit.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HABITKIT = Compatibility(
        name = "HabitKit",
        packageName = "com.roehl.habitkit",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(version = "1.15.2")
        )
    )
}

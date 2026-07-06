package app.paresh.patches.ticktick.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TICKTICK = Compatibility(
        name = "TickTick",
        packageName = "com.ticktick.task",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4870F8,
        targets = listOf(
            AppTarget(version = "8.0.6.1")
        )
    )
}

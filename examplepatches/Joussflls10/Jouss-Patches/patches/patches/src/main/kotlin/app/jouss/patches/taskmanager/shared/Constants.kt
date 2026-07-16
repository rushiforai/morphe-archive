package app.jouss.patches.taskmanager.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TASKMANAGER = Compatibility(
        name = "TaskManager",
        packageName = "com.rk.taskmanager",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "1.5.0")
        )
    )
}

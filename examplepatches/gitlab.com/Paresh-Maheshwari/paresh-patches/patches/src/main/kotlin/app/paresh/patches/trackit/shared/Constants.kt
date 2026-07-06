package app.paresh.patches.trackit.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TRACKIT = Compatibility(
        name = "TrackIt",
        packageName = "app.vinztech.trackit",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(version = "1.5.5")
        )
    )
}

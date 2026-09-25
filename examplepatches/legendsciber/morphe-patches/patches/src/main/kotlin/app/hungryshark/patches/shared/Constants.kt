package app.hungryshark.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HUNGRYSHARK = Compatibility(
        name = "Hungry Shark",
        packageName = "com.fgol.HungrySharkEvolution",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0D47A1,
        targets = listOf(
            AppTarget(version = "14.5.0")
        )
    )
}

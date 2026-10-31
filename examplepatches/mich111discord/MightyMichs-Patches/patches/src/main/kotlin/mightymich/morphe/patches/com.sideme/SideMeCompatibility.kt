package mightymich.morphe.patches.com.sideme

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object SideMeCompatibility {
    val SIDEME = Compatibility(
        name = "SideMe",
        packageName = "com.sideme",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6C5CE7,
        targets = listOf(
            AppTarget(version = "1.19.5")
        )
    )
}

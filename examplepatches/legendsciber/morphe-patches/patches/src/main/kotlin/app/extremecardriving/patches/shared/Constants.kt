package app.extremecardriving.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ECD = Compatibility(
        name = "Extreme Car Driving Simulator",
        packageName = "com.aim.racing",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A237E,
        targets = listOf(
            AppTarget(version = "7.13.1")
        )
    )
}

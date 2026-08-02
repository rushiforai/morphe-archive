package software.zarko.patches.sunrisealarm

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SUNRISE_ALARM = Compatibility(
        name = "Sunrise Alarm: Wake-Up Light",
        packageName = "com.laironcorp.sunrisealarm",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFA500,
        targets = listOf(
            AppTarget(version = "1.3.8"),
        ),
    )
}

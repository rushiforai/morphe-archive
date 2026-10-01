package mightymich.morphe.patches.com.clover.daysmatter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DaysMatterCompatibility {
    val DAYS_MATTER = Compatibility(
        name = "Days Matter",
        packageName = "com.clover.daysmatter",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "2.0.57")
        )
    )
}

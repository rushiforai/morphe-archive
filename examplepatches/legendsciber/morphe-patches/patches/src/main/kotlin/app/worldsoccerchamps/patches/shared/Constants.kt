package app.worldsoccerchamps.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WSC = Compatibility(
        name = "World Soccer Champs",
        packageName = "com.monkeyibrow.worldsoccerchamps",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B5E20,
        targets = listOf(
            AppTarget(version = "11.5.1")
        )
    )
}

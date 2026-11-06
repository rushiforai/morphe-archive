package app.zdrgon.patches.retrobowlcollege.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RETRO_BOWL_COLLEGE = Compatibility(
        name = "Retro Bowl College",
        packageName = "com.newstargames.retrobowlcollege",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B3A5C,
        targets = listOf(
            AppTarget(version = "1.1.2"),
        ),
    )
}

package app.mightymorphing.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val JOEY = Compatibility(
        name = "Joey",
        packageName = "o.o.joey",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6A00,
        targets = listOf(
            AppTarget(
                version = "2.1.6.5",
            ),
        ),
    )
}

package app.libby.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_LIBBY = Compatibility(
        name = "Libby: Read Library Books",
        packageName = "com.overdrive.mobile.android.libby",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1F1F1F,
        targets = listOf(
            AppTarget(version = "9.5.0"),
        ),
    )
}

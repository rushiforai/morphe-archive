package mightymich.morphe.patches.com.dashdramas

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MyDramaCompatibility {
    val MY_DRAMA = Compatibility(
        name = "My Drama",
        packageName = "com.dashdramas",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3F51B5,
        targets = listOf(
            AppTarget(version = "1.81.0"),
            AppTarget(version = "1.82.0", isExperimental = true),
            AppTarget(version = "1.86.0", isExperimental = true),
            AppTarget(version = "1.87.0", isExperimental = true),
        ),
    )
}

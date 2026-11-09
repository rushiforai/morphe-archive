package mightymich.morphe.patches.com.finch.finch

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object FinchCompatibility {
    val FINCH = Compatibility(
        name = "Finch",
        packageName = "com.finch.finch",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x7CB342,
        targets = listOf(
            AppTarget(version = "3.73.235"),
            AppTarget(version = "3.73.0", isExperimental = true),
            AppTarget(version = "3.72.0", isExperimental = true),
        ),
    )
}

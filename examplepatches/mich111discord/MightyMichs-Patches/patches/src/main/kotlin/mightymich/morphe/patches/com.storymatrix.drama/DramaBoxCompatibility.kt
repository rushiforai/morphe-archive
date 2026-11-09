package mightymich.morphe.patches.com.storymatrix.drama

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object DramaBoxCompatibility {
    val DRAMABOX = Compatibility(
        name = "DramaBox",
        packageName = "com.storymatrix.drama",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE91E63,
        targets = listOf(
            AppTarget(version = "7.0.0"),
            AppTarget(version = "6.9.3", isExperimental = true),
            AppTarget(version = "6.4.0", isExperimental = true),
        ),
    )
}

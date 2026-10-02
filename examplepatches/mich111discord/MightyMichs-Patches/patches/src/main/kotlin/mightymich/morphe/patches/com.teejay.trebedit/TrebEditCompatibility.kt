package mightymich.morphe.patches.com.teejay.trebedit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TrebEditCompatibility {
    val TREBEDIT = Compatibility(
        name = "TrebEdit",
        packageName = "com.teejay.trebedit",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722, // Orange color
        targets = listOf(
            AppTarget(version = "3.6.7"),
            AppTarget(
                version = null,
                isExperimental = false 
            )
        )
    )
}

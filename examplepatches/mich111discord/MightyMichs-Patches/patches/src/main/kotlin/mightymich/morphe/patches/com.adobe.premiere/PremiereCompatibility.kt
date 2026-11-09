package mightymich.morphe.patches.com.adobe.premiere

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PremiereCompatibility {
    val PREMIERE = Compatibility(
        name = "Adobe Premiere",
        packageName = "com.adobe.premiere",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x9999FF,
        targets = listOf(
            AppTarget(version = "26.5.0"),
            AppTarget(version = "26.4.1", isExperimental = true),
            AppTarget(version = "26.3.0", isExperimental = true),
        ),
    )
}

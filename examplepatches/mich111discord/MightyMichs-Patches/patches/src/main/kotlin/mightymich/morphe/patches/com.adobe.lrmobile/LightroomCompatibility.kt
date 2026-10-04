package mightymich.morphe.patches.com.adobe.lrmobile

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object LightroomCompatibility {
    val LIGHTROOM = Compatibility(
        name = "Adobe Lightroom",
        packageName = "com.adobe.lrmobile",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A8E1,
        targets = listOf(
            AppTarget(version = "9.1.1")
        )
    )
}

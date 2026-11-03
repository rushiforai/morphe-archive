package mightymich.morphe.patches.com.adobe.photoshop.retail

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PhotoshopCompatibility {
    val PHOTOSHOP = Compatibility(
        name = "Adobe Photoshop",
        packageName = "com.adobe.photoshop.retail",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x001E36,
        targets = listOf(
            AppTarget(version = "1.7.0.2322"),
            AppTarget(version = "1.7.0", isExperimental = true),
        ),
    )
}

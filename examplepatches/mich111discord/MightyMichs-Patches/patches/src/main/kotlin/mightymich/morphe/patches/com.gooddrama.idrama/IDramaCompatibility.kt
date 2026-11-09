package mightymich.morphe.patches.com.gooddrama.idrama

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object IDramaCompatibility {
    val IDRAMA = Compatibility(
        name = "iDrama",
        packageName = "com.gooddrama.idrama",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2B7BFF,
        targets = listOf(
            AppTarget(version = "1.36.5"),
            AppTarget(version = "1.36.4", isExperimental = true),
            AppTarget(version = "1.36.3", isExperimental = true),
        ),
    )
}

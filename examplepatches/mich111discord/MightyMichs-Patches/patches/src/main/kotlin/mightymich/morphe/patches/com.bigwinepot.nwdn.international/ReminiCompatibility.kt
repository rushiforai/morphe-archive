package mightymich.morphe.patches.com.bigwinepot.nwdn.international

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ReminiCompatibility {
    val REMINI = Compatibility(
        name = "Remini",
        packageName = "com.bigwinepot.nwdn.international",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}

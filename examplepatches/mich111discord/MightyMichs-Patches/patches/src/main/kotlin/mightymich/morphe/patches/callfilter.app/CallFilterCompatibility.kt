package mightymich.morphe.patches.callfilter.app

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object CallFilterCompatibility {
    val CALL_FILTER = Compatibility(
        name = "Callfilter.app",
        packageName = "callfilter.app",
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

package mightymich.morphe.patches.callfilter.app

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object CallFilterCompatibility {
    val CALLFILTER = Compatibility(
        name = "Call Filter",
        packageName = "callfilter.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1976D2,
        targets = listOf(
            AppTarget(version = "1.50.2"),
            AppTarget(version = "1.50.1", isExperimental = true),
            AppTarget(version = "1.50.0", isExperimental = true),
        ),
    )
}

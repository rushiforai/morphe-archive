package mightymich.morphe.patches.bin.mt.plus

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MTManagerCompatibility {
    val MT_MANAGER = Compatibility(
        name = "MT Manager",
        packageName = "bin.mt.plus",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "2.26.10"),
            AppTarget(version = "2.26.9", isExperimental = true),
            AppTarget(version = "2.26.8", isExperimental = true),
        ),
    )
}

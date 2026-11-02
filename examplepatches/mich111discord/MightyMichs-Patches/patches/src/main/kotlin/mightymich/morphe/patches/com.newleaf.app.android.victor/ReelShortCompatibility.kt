package mightymich.morphe.patches.com.newleaf.app.android.victor

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ReelShortCompatibility {
    val REELSHORT = Compatibility(
        name = "ReelShort",
        packageName = "com.newleaf.app.android.victor",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE50914,
        targets = listOf(
            AppTarget(version = "4.2.20"),
            AppTarget(version = "4.2.00", isExperimental = true),
        ),
    )
}

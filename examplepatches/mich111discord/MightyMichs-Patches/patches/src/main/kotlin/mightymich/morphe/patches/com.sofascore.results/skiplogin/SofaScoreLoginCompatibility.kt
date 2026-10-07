package mightymich.morphe.patches.com.sofascore.results.skiplogin

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object SofaScoreLoginCompatibility {
    val SOFASCORE_LOGIN = Compatibility(
        name = "SofaScore",
        packageName = "com.sofascore.results",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x354BED,
        targets = listOf(
            AppTarget(version = "26.09.21"),
            AppTarget(
                version = null,
                isExperimental = false
            )
        )
    )
}

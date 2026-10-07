package mightymich.morphe.patches.com.sofascore.results.unlockpremium

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object SofaScorePremiumCompatibility {
    val SOFASCORE_PREMIUM = Compatibility(
        name = "SofaScore",
        packageName = "com.sofascore.results",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x354BED,
        targets = listOf(
            AppTarget(version = "26.09.21")
        )
    )
}

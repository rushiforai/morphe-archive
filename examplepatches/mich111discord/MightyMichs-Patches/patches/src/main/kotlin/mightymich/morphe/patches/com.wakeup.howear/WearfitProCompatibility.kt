package mightymich.morphe.patches.com.wakeup.howear

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object WearfitProCompatibility {
    val WEARFIT_PRO = Compatibility(
        name = "Wearfit Pro",
        packageName = "com.wakeup.howear",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF2196F3.toInt(),
        targets = listOf(
            AppTarget(version = "5.5.83")
        )
    )
}

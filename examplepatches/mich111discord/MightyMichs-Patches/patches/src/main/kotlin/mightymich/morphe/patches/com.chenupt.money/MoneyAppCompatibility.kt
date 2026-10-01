package mightymich.morphe.patches.com.chenupt.money

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MoneyAppCompatibility {
    val MONEY_APP = Compatibility(
        name = "记账助手",
        packageName = "com.chenupt.money",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "3.16.0")
        )
    )
}

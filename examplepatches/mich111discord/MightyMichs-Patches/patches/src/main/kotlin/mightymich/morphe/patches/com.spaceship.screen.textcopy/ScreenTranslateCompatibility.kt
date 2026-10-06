package mightymich.morphe.patches.com.spaceship.screen.textcopy

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ScreenTranslateCompatibility {
    val SCREEN_TRANSLATE = Compatibility(
        name = "Screen Translate",
        packageName = "com.spaceship.screen.textcopy",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "7.5.00112"),
            AppTarget(version = "v7.5.00112")
        )
    )
}

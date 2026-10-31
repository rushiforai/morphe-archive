package app.ratbanana.patches.gaminghub.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PACKAGE = "Lapp/ratbanana/extension/gaminghub"

    val COMPATIBILITY_GAMING_HUB = Compatibility(
        name = "Gaming Hub",
        packageName = "com.samsung.android.game.gamehome",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4A2A8C,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true
            ),
            AppTarget(
                version = "8.0.05.8"
            )
        )
    )
}

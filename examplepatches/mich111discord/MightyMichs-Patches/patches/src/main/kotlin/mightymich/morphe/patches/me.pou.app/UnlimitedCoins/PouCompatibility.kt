package mightymich.morphe.patches.me.pou.app.UnlimitedCoins

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PouUnlimitedCoinsCompatibility {
    val POU_UNLIMITED_COINS = Compatibility(
        name = "Pou",
        packageName = "me.pou.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x8BC34A,
        targets = listOf(
            AppTarget(version = "1.4.135")
        )
    )
}

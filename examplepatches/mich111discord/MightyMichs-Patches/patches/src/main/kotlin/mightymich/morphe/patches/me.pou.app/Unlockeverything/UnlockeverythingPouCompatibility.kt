package mightymich.morphe.patches.me.pou.app.Unlockeverything

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object PouUnlockEverythingCompatibility {
    val POU_UNLOCK_EVERYTHING = Compatibility(
        name = "Pou",
        packageName = "me.pou.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x8BC34A,
        targets = listOf(
            AppTarget(version = "1.4.135")
        )
    )
}

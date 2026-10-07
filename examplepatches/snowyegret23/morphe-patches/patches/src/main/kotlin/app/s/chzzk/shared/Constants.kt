package app.s.chzzk.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CHZZK = Compatibility(
        name = "Chzzk",
        packageName = "com.navercorp.game.android.community",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00FFA3,
        signatures = setOf("0b8b8523bb4aeffa346e4bdd4fbf7d193450569aa14aaad4adfd94a3f7b227bb"),
        targets = listOf(
            AppTarget(
                version = "3.14.0",
                minSdk = 26,
            ),
        )
    )
}

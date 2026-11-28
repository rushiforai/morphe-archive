package semicoloncolonel.mobilestream.patches.nfl.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NFL",
        packageName = "com.gotv.nflgamecenter.us.lite",
        description = "The NFL phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x013369,
        targets = listOf(
            AppTarget(version = "61.0.19", description = "Phone build"),
            devTarget("61.0.21", versionCode = 1357073, description = "Phone build"),
            devTarget("61.0.22", versionCode = 1357188, description = "Phone build"),
            AppTarget("61.0.18", versionCode = 1356680, description = "Phone build"),
        )
    )
}

package semicoloncolonel.mobilestream.patches.nfl.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NFL",
        packageName = "com.gotv.nflgamecenter.us.lite",
        description = "The NFL app, for phones (61.0.19 and 61.0.18) and Android TV (18.27.0).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x013369,
        targets = listOf(
            AppTarget(version = "61.0.19", description = "Phone build"),
            AppTarget("61.0.18", versionCode = 1356680, description = "Phone build"),
            AppTarget("18.27.0", description = "Android TV build"),
        )
    ).splitByBundle(
        phoneDescription = "The NFL phone app.",
        tvDescription = "The NFL app.",
    )
}

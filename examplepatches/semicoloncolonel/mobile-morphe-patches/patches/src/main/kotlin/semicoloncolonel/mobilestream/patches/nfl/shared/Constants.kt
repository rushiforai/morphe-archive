package semicoloncolonel.mobilestream.patches.nfl.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NFL",
        packageName = "com.gotv.nflgamecenter.us.lite",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x013369,
        targets = listOf(AppTarget("61.0.18"))
    )
}

package semicoloncolonel.mobilestream.patches.nfl.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NFL",
        packageName = "com.gotv.nflgamecenter.us.lite",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x013369,
        targets = listOf(devTarget("61.0.19"))
    )
}

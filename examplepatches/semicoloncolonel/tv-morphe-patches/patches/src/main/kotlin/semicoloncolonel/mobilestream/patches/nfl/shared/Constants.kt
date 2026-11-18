package semicoloncolonel.mobilestream.patches.nfl.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NFL",
        packageName = "com.gotv.nflgamecenter.us.lite",
        description = "The NFL app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x013369,
        targets = listOf(
            AppTarget("18.27.0"),
        ),
        formFactor = FormFactor.TV,
    )
}

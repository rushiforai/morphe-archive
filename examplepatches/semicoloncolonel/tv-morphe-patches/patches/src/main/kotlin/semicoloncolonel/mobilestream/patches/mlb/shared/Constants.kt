package semicoloncolonel.mobilestream.patches.mlb.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MLB",
        packageName = "com.bamnetworks.mobile.android.gameday.atbat",
        description = "The MLB app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002D72,
        targets = listOf(
            AppTarget("26.21.0.76"),
        ),
        formFactor = FormFactor.TV,
    )
}

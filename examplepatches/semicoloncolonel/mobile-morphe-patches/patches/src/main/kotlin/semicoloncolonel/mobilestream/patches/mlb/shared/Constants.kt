package semicoloncolonel.mobilestream.patches.mlb.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MLB",
        packageName = "com.bamnetworks.mobile.android.gameday.atbat",
        description = "The MLB app (one app for phones and Android TV).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002D72,
        targets = listOf(AppTarget("26.21.0.49")),
    )
}

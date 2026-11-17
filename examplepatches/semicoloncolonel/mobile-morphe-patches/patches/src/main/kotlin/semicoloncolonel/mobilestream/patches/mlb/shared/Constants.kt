package semicoloncolonel.mobilestream.patches.mlb.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MLB",
        packageName = "com.bamnetworks.mobile.android.gameday.atbat",
        description = "The MLB app, for phones (26.21.0.49) and Android TV (26.21.0.76).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002D72,
        targets = listOf(
            AppTarget("26.21.0.49", description = "Phone build"),
            AppTarget("26.21.0.76", description = "Android TV build"),
        ),
    ).splitByBundle(
        phoneDescription = "The MLB phone app.",
        tvDescription = "The MLB app.",
    )
}

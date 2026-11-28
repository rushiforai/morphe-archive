package semicoloncolonel.mobilestream.patches.mlb.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "MLB",
        packageName = "com.bamnetworks.mobile.android.gameday.atbat",
        description = "The MLB phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002D72,
        targets = listOf(
            AppTarget("26.21.0.49", description = "Phone build"),
            devTarget("26.22.0.41", versionCode = 100004811, description = "Phone build"),
        ),
    )
}

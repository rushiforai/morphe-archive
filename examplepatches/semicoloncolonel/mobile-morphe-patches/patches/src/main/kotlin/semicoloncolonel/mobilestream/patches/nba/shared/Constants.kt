package semicoloncolonel.mobilestream.patches.nba.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NBA",
        packageName = "com.nbaimd.gametime.nba2011",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1D428A,
        targets = listOf(
            AppTarget("1.3.0", versionCode = 1003018, description = "Phone build"),
            devTarget("1.4.2", versionCode = 1004020, description = "Phone build"),
            AppTarget("1.2.0", versionCode = 1002016, description = "Phone build"),
        )
    )
}

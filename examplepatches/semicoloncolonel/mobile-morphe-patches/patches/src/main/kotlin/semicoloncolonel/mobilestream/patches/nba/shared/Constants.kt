package semicoloncolonel.mobilestream.patches.nba.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NBA",
        packageName = "com.nbaimd.gametime.nba2011",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1D428A,
        targets = listOf(AppTarget("1.2.0"))
    )
}

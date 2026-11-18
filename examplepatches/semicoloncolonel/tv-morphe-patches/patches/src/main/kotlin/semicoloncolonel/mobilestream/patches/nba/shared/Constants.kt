package semicoloncolonel.mobilestream.patches.nba.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    // The Android TV app is a separate codebase (versions 1.1.0.<date>). It plays
    // through the same MediaKind player, so its Skip ads shares the client-side
    // half of the phone patch.
    val COMPATIBILITY = Compatibility(
        name = "NBA",
        packageName = "com.nbaimd.gametime.nba2011",
        description = "The NBA app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1D428A,
        targets = listOf(AppTarget("1.1.0.20261026155843")),
        formFactor = FormFactor.TV,
    )
}

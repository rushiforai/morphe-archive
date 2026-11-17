package semicoloncolonel.mobilestream.patches.nba.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.forTvSource

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NBA",
        packageName = "com.nbaimd.gametime.nba2011",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1D428A,
        targets = listOf(
            AppTarget("1.3.0", versionCode = 1003018, description = "Phone build"),
            AppTarget("1.2.0", versionCode = 1002016, description = "Phone build"),
        )
    )

    // The Android TV app is a separate codebase (versions 1.1.0.<date>). It plays
    // through the same MediaKind player, so its Skip ads shares the client-side
    // half of the phone patch.
    val TV_COMPATIBILITY = Compatibility(
        name = "NBA (Android TV)",
        packageName = "com.nbaimd.gametime.nba2011",
        description = "The Android TV app, not the phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1D428A,
        targets = listOf(AppTarget("1.1.0.20261026155843", description = "Android TV build")),
        formFactor = FormFactor.TV,
    ).forTvSource("The NBA app.")
}

package semicoloncolonel.mobilestream.patches.nba.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

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
        targets = listOf(
            devTarget("1.2.0.20261103221954", versionCode = 6161027),
            devTarget("1.4.0.20261113201204", versionCode = 6163020),
            AppTarget("1.1.0.20261026155843"),
        ),
        formFactor = FormFactor.TV,
    )
}

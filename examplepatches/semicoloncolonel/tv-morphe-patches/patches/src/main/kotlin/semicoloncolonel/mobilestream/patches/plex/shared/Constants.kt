package semicoloncolonel.mobilestream.patches.plex.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Plex",
        packageName = "com.plexapp.android",
        description = "The Plex app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE5A00D,
        targets = listOf(AppTarget("2026.22.0")),
        formFactor = FormFactor.TV,
    )
}

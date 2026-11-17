package semicoloncolonel.mobilestream.patches.plex.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Plex",
        packageName = "com.plexapp.android",
        description = "The Plex app, for phones and Android TV.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE5A00D,
        targets = listOf(AppTarget("2026.22.0")),
    ).splitByBundle(
        phoneDescription = "The Plex app for phones.",
        tvDescription = "The Plex app.",
    )
}

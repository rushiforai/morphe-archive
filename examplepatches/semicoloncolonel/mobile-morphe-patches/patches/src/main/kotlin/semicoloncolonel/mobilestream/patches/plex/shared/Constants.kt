package semicoloncolonel.mobilestream.patches.plex.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Plex",
        packageName = "com.plexapp.android",
        description = "The Plex app for phones.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE5A00D,
        targets = listOf(AppTarget("2026.22.0"), devTarget("2026.23.0", description = "Beta")),
    )
}

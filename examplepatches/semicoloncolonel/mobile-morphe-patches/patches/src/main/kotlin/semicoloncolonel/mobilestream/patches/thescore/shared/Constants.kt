package semicoloncolonel.mobilestream.patches.thescore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "theScore",
        packageName = "com.fivemobile.thescore",
        description = "The theScore sports news and scores app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1B1B,
        targets = listOf(devTarget("26.16.1", versionCode = 40216), AppTarget("26.16.0")),
    )
}

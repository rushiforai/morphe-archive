package semicoloncolonel.mobilestream.patches.thescore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "theScore",
        packageName = "com.fivemobile.thescore",
        description = "The theScore sports news and scores app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1B1B,
        targets = listOf(AppTarget("26.16.0"), AppTarget("26.15.0")),
    )
}

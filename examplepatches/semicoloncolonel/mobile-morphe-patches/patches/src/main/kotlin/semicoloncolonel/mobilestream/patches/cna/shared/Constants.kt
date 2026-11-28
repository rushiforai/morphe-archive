package semicoloncolonel.mobilestream.patches.cna.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CNA",
        packageName = "com.channelnewsasia",
        description = "The CNA (Channel NewsAsia) news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE4002B,
        targets = listOf(AppTarget("2.0.6", versionCode = 2017, isExperimental = true))
    )
}

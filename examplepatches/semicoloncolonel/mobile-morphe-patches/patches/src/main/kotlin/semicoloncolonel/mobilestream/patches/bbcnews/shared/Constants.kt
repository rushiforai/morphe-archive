package semicoloncolonel.mobilestream.patches.bbcnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "BBC: World News & Stories",
        packageName = "bbc.mobile.news.ww",
        description = "The BBC News app outside the UK.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("2026.11.0", versionCode = 10007114))
    )
}

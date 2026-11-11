package semicoloncolonel.mobilestream.patches.newsbreak.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NewsBreak",
        packageName = "com.particlenews.newsbreak",
        description = "The NewsBreak local news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF4462A,
        targets = listOf(AppTarget("26.45.1", versionCode = 26450101))
    )
}

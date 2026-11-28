package semicoloncolonel.mobilestream.patches.xinhua.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Xinhua News",
        packageName = "com.xinhuamm.xinhuanews",
        description = "The Xinhua News app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xD22630,
        targets = listOf(AppTarget("5.4.2", versionCode = 432, isExperimental = true))
    )
}

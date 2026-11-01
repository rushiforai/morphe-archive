package semicoloncolonel.mobilestream.patches.foxnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox News",
        packageName = "com.foxnews.android",
        description = "The Fox News phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x003366,
        targets = listOf(AppTarget("5.49.2"))
    )
}

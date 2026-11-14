package semicoloncolonel.mobilestream.patches.foxnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox News",
        packageName = "com.foxnews.android",
        description = "The Fox News phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x003366,
        targets = listOf(
            devTarget("5.50.0", versionCode = 2026110606),
            AppTarget("5.49.2"),
        )
    )
}

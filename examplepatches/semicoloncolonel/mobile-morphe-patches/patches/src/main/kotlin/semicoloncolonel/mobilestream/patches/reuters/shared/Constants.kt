package semicoloncolonel.mobilestream.patches.reuters.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Reuters",
        packageName = "com.thomsonreuters.reuters",
        description = "The Reuters news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFA6400,
        targets = listOf(AppTarget("7.51.0", versionCode = 1793827556))
    )
}

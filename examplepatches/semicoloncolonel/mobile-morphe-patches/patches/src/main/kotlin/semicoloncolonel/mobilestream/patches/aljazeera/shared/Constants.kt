package semicoloncolonel.mobilestream.patches.aljazeera.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Al Jazeera",
        packageName = "com.aljazeera.mobile",
        description = "The Al Jazeera news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1D174E,
        targets = listOf(AppTarget("12.2.0", versionCode = 23651, isExperimental = true))
    )
}

package semicoloncolonel.mobilestream.patches.usatoday.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "USA TODAY",
        packageName = "com.usatoday.android.news",
        description = "The USA TODAY news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x009BFF,
        targets = listOf(AppTarget("8.15.0")),
    )
}

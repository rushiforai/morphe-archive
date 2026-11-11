package semicoloncolonel.mobilestream.patches.amazon.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Amazon Shopping",
        packageName = "com.amazon.mShop.android.shopping",
        description = "The Amazon Shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x232F3E,
        targets = listOf(AppTarget("32.20.0.100"), AppTarget("32.19.0.100"))
    )
}

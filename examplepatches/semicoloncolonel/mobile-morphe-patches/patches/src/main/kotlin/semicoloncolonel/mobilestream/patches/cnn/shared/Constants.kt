package semicoloncolonel.mobilestream.patches.cnn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CNN",
        packageName = "com.cnn.mobile.android.phone",
        description = "The CNN app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget("26.21.0"))
    )
}

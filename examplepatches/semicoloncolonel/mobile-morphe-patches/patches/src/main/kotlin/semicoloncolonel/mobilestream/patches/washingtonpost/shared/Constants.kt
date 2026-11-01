package semicoloncolonel.mobilestream.patches.washingtonpost.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Washington Post",
        packageName = "com.washingtonpost.android",
        description = "The Washington Post news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x111111,
        targets = listOf(AppTarget("7.18.1"))
    )
}

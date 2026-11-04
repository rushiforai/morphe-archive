package semicoloncolonel.mobilestream.patches.abcnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ABC News",
        packageName = "com.abc.abcnews",
        description = "The ABC News app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A0A0A,
        targets = listOf(AppTarget("8.98.2"))
    )
}

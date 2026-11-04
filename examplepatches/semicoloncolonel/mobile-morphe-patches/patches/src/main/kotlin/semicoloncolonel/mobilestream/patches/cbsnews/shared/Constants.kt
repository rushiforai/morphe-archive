package semicoloncolonel.mobilestream.patches.cbsnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CBS News",
        packageName = "com.treemolabs.apps.cbsnews",
        description = "The CBS News app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A0A0A,
        targets = listOf(AppTarget("5.20"))
    )
}

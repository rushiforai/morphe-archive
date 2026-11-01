package semicoloncolonel.mobilestream.patches.tubi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Tubi",
        packageName = "com.tubitv",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE9181C,
        targets = listOf(AppTarget("10.43.1"))
    )
}

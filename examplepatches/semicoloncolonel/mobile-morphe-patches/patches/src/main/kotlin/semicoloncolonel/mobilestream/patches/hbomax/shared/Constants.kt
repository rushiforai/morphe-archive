package semicoloncolonel.mobilestream.patches.hbomax.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(AppTarget("7.14.0.530"))
    )
}

package semicoloncolonel.mobilestream.patches.yttv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.google.android.apps.youtube.unplugged"

    val COMPATIBILITY = Compatibility(
        name = "YouTube TV",
        packageName = PACKAGE_NAME,
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF0000,
        targets = listOf(AppTarget("10.44.0"))
    )
}

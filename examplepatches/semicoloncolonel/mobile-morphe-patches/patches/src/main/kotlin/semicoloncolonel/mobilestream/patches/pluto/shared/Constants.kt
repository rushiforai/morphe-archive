package semicoloncolonel.mobilestream.patches.pluto.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Pluto TV",
        packageName = "tv.pluto.android",
        description = "The phone app, not the Android TV (leanback) app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xB8B004,
        targets = listOf(AppTarget("17.2.0"))
    )
}

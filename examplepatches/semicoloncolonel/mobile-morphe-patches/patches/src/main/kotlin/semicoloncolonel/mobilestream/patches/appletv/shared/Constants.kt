package semicoloncolonel.mobilestream.patches.appletv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Apple TV",
        packageName = "com.apple.atve.androidtv.appletv",
        description = "The phone app. The package name says androidtv, but this is the phone build.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("3.0.0"))
    )
}

package semicoloncolonel.mobilestream.patches.foxone.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox One",
        packageName = "com.fox.foxone",
        description = "The Fox One phone app. The TV app shares this package name but is a " +
            "different build. Needs the Pairip license-check patch to run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x030B1A,
        targets = listOf(AppTarget("1.24.0"))
    )
}

package semicoloncolonel.mobilestream.patches.peacock.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Peacock",
        packageName = "com.peacocktv.peacockandroid",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            devTarget("7.11.11", versionCode = 124071111),
            AppTarget(version = "7.10.30"),
        )
    )
}

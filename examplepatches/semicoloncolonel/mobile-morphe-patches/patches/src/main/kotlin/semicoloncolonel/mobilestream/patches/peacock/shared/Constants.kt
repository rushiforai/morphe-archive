package semicoloncolonel.mobilestream.patches.peacock.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Peacock",
        packageName = "com.peacocktv.peacockandroid",
        description = "The Peacock phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget("7.11.11", versionCode = 124071111, description = "Phone build"),
            devTarget("7.11.22", versionCode = 124071122, description = "Phone build"),
            AppTarget(version = "7.10.30", description = "Phone build"),
        )
    )
}

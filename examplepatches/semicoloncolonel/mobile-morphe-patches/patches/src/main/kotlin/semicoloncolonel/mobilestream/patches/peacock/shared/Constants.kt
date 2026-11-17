package semicoloncolonel.mobilestream.patches.peacock.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Peacock",
        packageName = "com.peacocktv.peacockandroid",
        description = "The Peacock app, for phones (7.11.11 and 7.10.30) and Android TV (7.10.200).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget("7.11.11", versionCode = 124071111, description = "Phone build"),
            AppTarget(version = "7.10.30", description = "Phone build"),
            AppTarget("7.10.200", description = "Android TV build"),
        )
    ).splitByBundle(
        phoneDescription = "The Peacock phone app.",
        tvDescription = "The Peacock app.",
    )
}

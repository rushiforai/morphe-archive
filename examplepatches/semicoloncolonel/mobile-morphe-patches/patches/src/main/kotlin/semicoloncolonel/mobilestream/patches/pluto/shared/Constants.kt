package semicoloncolonel.mobilestream.patches.pluto.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Pluto TV",
        packageName = "tv.pluto.android",
        description = "The Pluto TV app, for phones and Android TV. The phone and TV builds " +
            "share a version name. Phone builds have version codes that start with 4, and " +
            "Android TV builds have version codes that start with 5. On a TV, patch the Android TV build.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xB8B004,
        targets = listOf(
            AppTarget("17.4.0"),
            AppTarget("17.3.0"),
        )
    ).splitByBundle(
        phoneDescription = "The Pluto TV app for phones. Phone builds have version codes that start with 4.",
        tvDescription = "The Pluto TV app. Its version codes start with 5, and the phone app's start with 4.",
    )
}

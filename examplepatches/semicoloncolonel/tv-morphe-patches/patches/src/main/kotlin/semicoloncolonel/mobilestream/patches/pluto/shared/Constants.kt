package semicoloncolonel.mobilestream.patches.pluto.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Pluto TV",
        packageName = "tv.pluto.android",
        description = "The Pluto TV app. Its version codes start with 5, and the phone app's start with 4.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xB8B004,
        targets = listOf(
            AppTarget("17.4.0"),
            AppTarget("17.3.0"),
        ),
        formFactor = FormFactor.TV,
    )
}

package semicoloncolonel.mobilestream.patches.espn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

// ESPN ships two different apps under one package name: the phone app (8.x)
// and the Android TV app (6.x). The TV app plays through Disney's streaming
// SDK, as Disney+ does, so its Skip ads reuses the Disney+ code.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ESPN",
        packageName = "com.espn.score_center",
        description = "The ESPN app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget("6.13.2")),
        formFactor = FormFactor.TV,
    )
}

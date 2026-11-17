package semicoloncolonel.mobilestream.patches.espn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.forTvSource

// ESPN ships two different apps under one package name: the phone app (8.x)
// and the Android TV app (6.x). The TV app plays through Disney's streaming
// SDK, as Disney+ does, so its Skip ads reuses the Disney+ code.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ESPN",
        packageName = "com.espn.score_center",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCC0000,
        targets = listOf(
            AppTarget("8.29.0", description = "Phone build"),
            AppTarget("8.27.0", versionCode = 26169, description = "Phone build"),
        )
    )

    val TV_COMPATIBILITY = Compatibility(
        name = "ESPN (Android TV)",
        packageName = "com.espn.score_center",
        description = "The Android TV app, not the phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget("6.13.2", description = "Android TV build")),
        formFactor = FormFactor.TV,
    ).forTvSource("The ESPN app.")
}

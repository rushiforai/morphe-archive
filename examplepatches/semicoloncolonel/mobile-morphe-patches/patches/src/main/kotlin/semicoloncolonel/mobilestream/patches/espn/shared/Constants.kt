package semicoloncolonel.mobilestream.patches.espn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

// ESPN ships two different apps under one package name: the phone app (8.x)
// and the Android TV app (6.x). This source patches the phone app; the Android
// TV app is patched from the TV patch source.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ESPN",
        packageName = "com.espn.score_center",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCC0000,
        targets = listOf(
            devTarget("8.30.0", versionCode = 27339, description = "Phone build"),
            devTarget("8.30.1", versionCode = 27731, description = "Phone build"),
            AppTarget("8.29.0", description = "Phone build"),
            AppTarget("8.27.0", versionCode = 26169, description = "Phone build"),
        )
    )
}

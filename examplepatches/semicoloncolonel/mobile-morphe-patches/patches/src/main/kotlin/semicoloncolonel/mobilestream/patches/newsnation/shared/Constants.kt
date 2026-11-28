package semicoloncolonel.mobilestream.patches.newsnation.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// NewsNation ships two different apps under one package name: the phone app
// (React Native, 510.x) and the Android TV app (a Haystack TV build, 4.x).
// This source patches the phone app; the Android TV app is patched from the TV
// patch source.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NewsNation",
        packageName = "com.nexstar.newsnation",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x13284B,
        targets = listOf(AppTarget("510.3.0", 1025, description = "Phone build")),
    )
}

package semicoloncolonel.mobilestream.patches.appletv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

// Apple TV ships two different apps under one package name: the phone app
// (a Java and Media3 app, 3.x) and the Android TV app (Apple's native engine,
// libluna, 17.x). Morphe Manager lists both apps' patches together, so the
// patches for one build are labeled and do nothing on the other.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Apple TV",
        packageName = "com.apple.atve.androidtv.appletv",
        description = "The phone app. The package name says androidtv, but this is the phone build.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "3.0.0", description = "Phone build"))
    )

    val TV_COMPATIBILITY = Compatibility(
        name = "Apple TV (Android TV)",
        packageName = "com.apple.atve.androidtv.appletv",
        description = "The Android TV app, not the phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "17.0.2", versionCode = 170202, description = "Android TV build")),
        formFactor = FormFactor.TV,
    )
}

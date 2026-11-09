package app.zdrgon.patches.googlemessages.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Target/build info taken from coloradude's morphe-google-messages-patch
    // (his bundle's only patch, a keyword message filter, is NOT carried
    // over — this bundle ships an OLED black mode patch for the app
    // instead). The exact target version string below is also what
    // Morphe Manager uses to suggest where to get the stock APK when the
    // user does not have the file: it resolves this version on APKMirror
    // (universal APK, phone_dynamic-2 variant, versionCode 326371063) /
    // Uptodown. The patcher API has no custom download-URL field, so the
    // exact version string is the lever — do not shorten it.
    val COMPATIBILITY_GOOGLE_MESSAGES = Compatibility(
        name = "Google Messages",
        packageName = "com.google.android.apps.messaging",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "messages.android_20261020_00_RC01.phone_dynamic")
        )
    )
}

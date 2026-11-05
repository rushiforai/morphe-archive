package dev.hyzor.patches.sleep.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SLEEP = Compatibility(
        name = "Sleep as Android",
        packageName = "com.urbandroid.sleep",

        // The tested artifact is a single APK (arm64-v8a + armeabi-v7a, nodpi).
        // If you start testing against the APKM bundle instead, add a second
        // Compatibility with ApkFileType.APKM — one declaration cannot cover both.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x80C583,

        targets = listOf(
            // Version the fingerprints and register counts below were verified against.
            AppTarget(version = "20261006"),
        ),
    )
}

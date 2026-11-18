package app.tomtom.patches.mypois

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.tomtom.gplay.navapp"

    val COMPATIBILITY_TOMTOM_GO = Compatibility(
        name = "TomTom GO Navigation",
        packageName = PACKAGE_NAME,
        // The bundle targets the same single APK as the premium/truck patches.
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE4002B,
        targets = listOf(
            // The hooks target obfuscated class names, so they are only valid for this exact version.
            AppTarget(version = "3.6.326")
        )
    )
}

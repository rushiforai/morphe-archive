package semicoloncolonel.mobilestream.patches.justwatch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "JustWatch",
        packageName = "com.justwatch.justwatch",
        description = "The JustWatch streaming guide app, for phones and Android TV.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFBC500,
        targets = listOf(
            AppTarget("26.45.1", versionCode = 2645001, description = "Phone build"),
            AppTarget("26.44.2", versionCode = 2644002, description = "Phone build"),
            AppTarget("26.43.10", versionCode = 2643010, description = "Phone build"),
            // Two Android TV builds of 26.43.8 exist: APKMirror's bundle (2643008, with
            // 32-bit and 64-bit splits) and the single 32-bit APK Google Play gives an
            // NVIDIA Shield (12643008). Both are listed so Morphe Manager accepts either.
            AppTarget(
                version = "26.43.8",
                versionCodes = mapOf(
                    SupportedAbi.ARMEABI_V7A to 12643008,
                    SupportedAbi.ARM64_V8A to 2643008,
                ),
                description = "Android TV build",
            ),
            // Matched by version name alone, so both the APKMirror bundle and the
            // copy Google Play gives a Shield are accepted. Tested on an NVIDIA
            // Shield (Android 11) on 2026-11-16.
            AppTarget("26.44.5", description = "Android TV build"),
        )
    ).splitByBundle(
        phoneDescription = "The JustWatch streaming guide app for phones.",
        tvDescription = "The JustWatch streaming guide app.",
    )
}

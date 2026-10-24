package io.github.sabopura.morphe.patches.pinterest

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val PINTEREST = Compatibility(
        name = "Pinterest",
        packageName = "com.pinterest",
        description = "Official Pinterest Android app; anchors are annotations and SDK strings.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE60023,
        signatures = setOf(
            "341d6881b1ecf38361fbf8c8fbae0aa516b45375c39ef5e78b161869acc1bcfa",
        ),
        targets = listOf(
            AppTarget(
                version = "14.11.0",
                versionCode = 14118020,
                minSdk = 28,
                description = "Binarymend 1.3.1 target; the rewritten anchors still match.",
            ),
            AppTarget(
                version = "14.38.0",
                versionCode = 14388010,
                minSdk = 29,
                description = "Binarymend 1.3.1 fails here. Verified on API 36.",
            ),
            AppTarget(
                version = "14.39.0",
                versionCode = 14398020,
                minSdk = 29,
                description = "Patched and launched on the dedicated API 36 emulator; the feed needs sign-in and was not checked.",
            ),
            AppTarget(
                version = "14.40.0",
                versionCode = 14408010,
                minSdk = 29,
                description = "Patched, launched on the dedicated API 36 emulator and the is_promoted getter checked in the output DEX; the feed needs sign-in and was not checked.",
            ),
            AppTarget(
                version = "14.41.0",
                versionCode = 14418020,
                minSdk = 29,
                description = "Patched and launched to the sign-in screen on the dedicated API 36 emulator; the is_promoted getter, the Bugsnag release stage check and the 14 skipped startup tasks checked in the output DEX. The feed needs sign-in and was not checked.",
            ),
        ),
    )
}

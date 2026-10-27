package io.github.sabopura.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "jp.gocro.smartnews.android"

    val SMARTNEWS_COMPATIBILITY = Compatibility(
        name = "SmartNews",
        packageName = PACKAGE_NAME,
        description = "SmartNews ad-removal patch set",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0C73C7,
        signatures = setOf(
            // Universal APK (version codes 100xxxx, Uptodown).
            "40f82012f7b7512d011eb9678a59c194892c863657f43e7c171d181b6bf5c700",
            // Google Play split build (version codes 1xxx, APKMirror APKM with Play source stamp).
            "867abbf06837d164a35e376c2e16f08381346e7f916b029ac53a45c36d744883",
        ),
        targets = listOf(
            AppTarget(
                version = "26.10.20",
                // Both the universal APK (1001145) and the Google Play build (1145) are verified.
                versionCodes = null,
                minSdk = 28,
                description = "Universal APK and Google Play APKM: ad-free public feed and scrolling verified " +
                    "on the dedicated Android API 36 emulator.",
            ),
            AppTarget(
                version = "26.10.30",
                // Both the universal APK (1001147) and the Google Play build (1147) are verified.
                versionCodes = null,
                minSdk = 28,
                description = "Universal APK and Google Play APKM: ad-free public feed and scrolling verified " +
                    "on the dedicated Android API 36 emulator.",
            ),
        ),
    )

    /** Versions on which the SNClient bridge hook of "Auto claim mission rewards" was verified. */
    val SMARTNEWS_MISSIONS_COMPATIBILITY = Compatibility(
        name = "SmartNews",
        packageName = PACKAGE_NAME,
        description = "SmartNews My missions auto-claim",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0C73C7,
        signatures = SMARTNEWS_COMPATIBILITY.signatures,
        targets = SMARTNEWS_COMPATIBILITY.targets.filter { it.version in setOf("26.10.20", "26.10.30") },
    )

    val SMARTNEWS_BROWSER_COMPATIBILITY = Compatibility(
        name = "SmartNews",
        packageName = PACKAGE_NAME,
        description = "SmartNews pages in an external browser",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0C73C7,
        signatures = SMARTNEWS_COMPATIBILITY.signatures,
        targets = SMARTNEWS_COMPATIBILITY.targets.filter { it.version in setOf("26.10.20", "26.10.30") },
    )
}

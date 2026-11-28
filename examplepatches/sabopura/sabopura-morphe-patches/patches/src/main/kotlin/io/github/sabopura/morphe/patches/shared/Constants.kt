package io.github.sabopura.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

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
                version = "26.11.30",
                // Only the Google Play build (1155) is verified; Uptodown had no universal APK of this
                // version when it was checked. Switch to null once the universal APK (1001155) is verified too.
                versionCodes = SupportedAbi.entries.associateWith { 1155 },
                minSdk = 28,
                description = "Google Play APKM: ad-free public feed and scrolling verified on the dedicated " +
                    "Android API 36 emulator.",
            ),
            AppTarget(
                version = "26.11.40",
                // Both the universal APK (1001157) and the Google Play build (1157) are verified.
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
        targets = SMARTNEWS_COMPATIBILITY.targets.filter { it.version in setOf("26.11.30", "26.11.40") },
    )

    val SMARTNEWS_BROWSER_COMPATIBILITY = Compatibility(
        name = "SmartNews",
        packageName = PACKAGE_NAME,
        description = "SmartNews pages in an external browser",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0C73C7,
        signatures = SMARTNEWS_COMPATIBILITY.signatures,
        targets = SMARTNEWS_COMPATIBILITY.targets.filter { it.version in setOf("26.11.30", "26.11.40") },
    )
}

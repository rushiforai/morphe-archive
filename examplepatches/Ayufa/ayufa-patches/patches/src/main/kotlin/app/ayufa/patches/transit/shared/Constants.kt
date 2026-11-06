package app.ayufa.patches.transit.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /**
     * Yahoo!乗換案内 (Y! Transit) by LY Corporation.
     *
     * The patches target 8.5.8. The app is distributed as split
     * APKs (base + config splits); the fingerprints live in the
     * base APK.
     *
     * The app is heavily R8-obfuscated, but the ad placement view
     * classes in jp.co.yahoo.android.apps.transit.ad kept their
     * names, which is what the ad patch anchors on. There is no
     * premium / billing system at all (fully free app). The Yahoo
     * certificate hashes hardcoded in the code verify *other*
     * Yahoo apps, not this app itself, and no Play Integrity /
     * SafetyNet self-check was found (verified by static analysis
     * 2026-11-06), so re-signed builds are expected to keep working
     * apart from Yahoo app-to-app連携 features.
     */
    val COMPATIBILITY_YAHOO_TRANSIT = Compatibility(
        name = "Yahoo!乗換案内",
        packageName = "jp.co.yahoo.android.apps.transit",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            // LY Corporation signing certificate (SHA-256, current)
            "17252b7592d07940b07994c5d7b26d267930b2736753412670867a4f15983071",
            // Yahoo Japan Corporation signing certificate (SHA-256, pre-rotation)
            "c0d9fe65ae0c2d761da830418cf3b68f6d23c349d912bcaba9c2b1174d99cf04"
        ),
        targets = listOf(
            AppTarget(
                version = "8.5.8",
                minSdk = 26
            )
        )
    )
}

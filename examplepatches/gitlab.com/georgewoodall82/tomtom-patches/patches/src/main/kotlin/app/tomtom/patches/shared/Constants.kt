package app.tomtom.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * TomTom GO / GO Expert (com.tomtom.gplay.navapp).
     *
     * Developed and verified against 3.6.326 (versionCode 1678737), the
     * single APK in this workspace:
     * TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk
     *
     * This build is pure Java/Kotlin: it ships no native libraries at all.
     * The subscription stack is:
     *   - LCMS server subscriptions (sb/d, parsed into tb/a records)
     *   - Google Play purchases via Purchasely (Ua/o, Paywall UI)
     *   - qb/a combines both into "has active subscriptions"
     *
     * All class/method names below are the obfuscated 3.6.326 names, so this
     * bundle is pinned to that version. Fingerprints carry stable string
     * markers and will fail loudly on an unknown build instead of silently
     * doing nothing.
     */
    val COMPATIBILITY_TOMTOM = Compatibility(
        name = "TomTom GO Navigation",
        packageName = "com.tomtom.gplay.navapp",
        apkFileType = ApkFileType.APK,
        // TomTom red.
        appIconColor = 0xDF1B12,
        targets = listOf(
            AppTarget(
                version = "3.6.326",
            ),
            // Allow trying on newer versions experimentally. Obfuscated
            // names change between releases, so expect a fingerprint
            // mismatch rather than a silent no-op.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}

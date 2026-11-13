package app.morphe.patches.arcore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Target: CardboardXR 1.0.0 (com.brenpoly.cardboardxr).
     *
     * Verified facts (2026-11-12, from the APK Lê sent):
     * - Package: com.brenpoly.cardboardxr, versionCode 10000,
     *   versionName 1.0.0, minSdk 29, targetSdk 36 (aapt2 dump badging).
     * - Unity app; the ARCore Java client lives in its classes.dex:
     *   `ArCoreApk` is a stub (throws UnsupportedOperationException),
     *   the real implementation is `com.google.ar.core.k`, returned by
     *   `ArCoreApk.getInstance()`. See Fingerprints.kt for the dex proof.
     *
     * The previous target (Google Play Services for AR, the service APK)
     * is DROPPED: its dex contains no ArCoreApk class at all (verified
     * 2026-11-11 on ARCore 1.57.262640283), so that patch could never
     * match any fingerprint there.
     *
     * This target is NOT experimental: the fingerprint is verified
     * against the real dex of this exact APK. The patch itself is still
     * default-off and labelled experimental in its name/description,
     * because forcing availability does NOT supply the missing Z2571N
     * device profile — a working AR session is still unlikely.
     */
    val COMPATIBILITY_CARDBOARDXR = Compatibility(
        name = "CardboardXR",
        packageName = "com.brenpoly.cardboardxr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4285F4,
        targets = listOf(
            AppTarget(
                version = "1.0.0"
            )
        )
    )
}

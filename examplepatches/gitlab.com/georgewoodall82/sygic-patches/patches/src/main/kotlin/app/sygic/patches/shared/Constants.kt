package app.sygic.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Sygic GPS Truck & Caravan (com.sygic.truck).
     *
     * Developed and verified against 26.1.9 (versionCode 261119003), APK from APKPure:
     * Sygic+GPS+Truck+&+Caravan_26.1.9_APKPure.apk
     *
     * Single APK (not APKM/APKS), so apkFileType = APK.
     */
    val COMPATIBILITY_SYGIC = Compatibility(
        name = "Sygic GPS Truck & Caravan",
        packageName = "com.sygic.truck",
        apkFileType = ApkFileType.APK,
        // Sygic blue.
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(
                version = "26.1.9",
            ),
            // Allow trying on newer versions experimentally.
            // Class names here are stable (Sygic barely obfuscates Java;
            // licensing lives in native libAura.so), so fingerprints may
            // still match, but native checks may differ per release.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}

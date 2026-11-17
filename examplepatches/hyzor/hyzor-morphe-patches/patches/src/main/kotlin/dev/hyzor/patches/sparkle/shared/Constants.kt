package dev.hyzor.patches.sparkle.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    /** `se.hedekonsult.sparkle.MainActivity` — not obfuscated, stable between builds. */
    const val MAIN_ACTIVITY = "Lse/hedekonsult/sparkle/MainActivity;"

    /**
     * The JNI wrapper around everything licence-related. Its package is not obfuscated because
     * the native library registers it by name, and the class is the only one in the APK that
     * loads `libutilsJNI`. Its method names have been stable from 2.3.1 to 2.4.0; the native
     * bridges (`xpoe32871a`, `ggtz54aa5a`, …) are what actually enforce the licence.
     */
    const val LIB_UTILS = "Lse/hedekonsult/utils/LibUtils;"

    /**
     * Default SharedPreferences key the native library stamps on startup. The Java side only
     * reads it, and treats `value % 10 != 0` as tampering (`TaskReceiver`, `SetupActivity$j$g`
     * and `i0` all schedule a deferred wipe in that case).
     */
    const val STARTUP_TIME = "startup_time"

    val SPARKLE = Compatibility(
        name = "Sparkle TV",
        packageName = "se.hedekonsult.sparkle",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A237E,
        formFactor = FormFactor.TV,

        // The tested artifact is the 2.4.0 APK from APKMirror (single raw AndroidManifest.xml,
        // versionCode 204004, four ABIs). All of the patched code lives in classes.dex.
        targets = listOf(
            AppTarget(version = "2.4.0", versionCode = 204004),
        ),
    )
}

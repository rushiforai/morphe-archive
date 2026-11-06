package app.ayufa.patches.simeji.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /**
     * Simeji (Japanese keyboard + emoji) by Baidu Japan.
     *
     * The patches target 20.7 (2024-07-17), NOT the current release:
     * in 23.7 the native conversion engine (libbaiduime.so) validates
     * the app signing certificate via PackageManager from JNI and
     * refuses to initialize in re-signed builds, which silently kills
     * all conversion candidates (verified 2026-11-06: even a zero-patch
     * rebuild shows the symptom). 20.7 predates that check — its
     * JpImeShellInitialize takes no Context and its libbaiduime.so has
     * no signature references — so conversion keeps working after
     * patching. 20.7 is distributed as a single universal APK.
     * The signing certificate below was verified against both the
     * Play-installed copy of 23.7 and the APKMirror copy of 20.7
     * (identical certificate).
     */
    val COMPATIBILITY_SIMEJI = Compatibility(
        name = "Simeji",
        packageName = "com.adamrocker.android.input.simeji",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            // Baidu Japan signing certificate (SHA-256)
            "4e5a78c0450316e38afab3ecb6bac9932c095f2b34360c40129857b78657e24f"
        ),
        targets = listOf(
            AppTarget(
                version = "20.7",
                minSdk = 23
            )
        )
    )
}

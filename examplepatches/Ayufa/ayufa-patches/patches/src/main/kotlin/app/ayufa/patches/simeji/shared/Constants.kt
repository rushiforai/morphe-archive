package app.ayufa.patches.simeji.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /**
     * Simeji (Japanese keyboard + emoji) by Baidu Japan.
     *
     * The patches target 22.5 (2025-09-21), NOT the current release:
     * starting with 22.6 the native conversion engine (libbaiduime.so)
     * validates the app signing certificate via PackageManager from
     * JNI and refuses to initialize in re-signed builds, which
     * silently kills all conversion candidates (verified 2026-11-06
     * on 23.7: even a zero-patch rebuild shows the symptom). 22.5 is
     * the last version before that check — its JpImeShellInitialize
     * takes no Context and its libbaiduime.so has no signature
     * references — so conversion keeps working after patching
     * (markers verified 2026-11-25; the clipboard feature added in
     * 2025-04 is included). 22.5 is distributed as split APKs
     * (XAPK), which Morphe Manager merges automatically.
     * The signing certificate below was verified against both the
     * Play-installed copy of 23.7 and the APKPure copy of 22.5
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
                version = "22.5",
                minSdk = 23
            )
        )
    )
}

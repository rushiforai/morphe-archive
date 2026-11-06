package app.xiondigital.patches.tandem.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Tandem: Language exchange (`net.tandem`).
 *
 * Two builds have been inspected, and the fingerprints and injected code in this package were
 * verified against each of them by applying the bundle with Morphe's patcher:
 *
 * | Build | versionCode | minSdk | Distribution |
 * | :--- | :--- | :--- | :--- |
 * | 6.38.0 | 11568 | 32 | APKMirror universal APKM (`base.apk` plus ABI and density splits) |
 * | 6.12.0 | 11503 | 26 | the same universal APKM |
 *
 * 6.12.0 is kept because it is the last build some users still run, and because Tandem's current
 * releases are PairIP-protected in a way a re-signed APK cannot satisfy (see
 * `Tandem/DEVICE-TEST.md`). It is not a way around that gate: 6.12.0 ships the same PairIP entry
 * points (`com.pairip.application.Application`, `com.pairip.licensecheck`) and its own
 * `libpairipcore.so`, so whether it launches after patching has to be measured on a device.
 *
 * The two builds disagree on a few anchors — PairIP renamed its licence plumbing between them, R8
 * gives Tandem's own composables different one-letter names in each build, and `onCreate()` is a
 * different body — so anything that moves between builds is matched by something stable (a string
 * the method references, or the class the SDK keeps unobfuscated) rather than by a descriptor.
 *
 * No other version is claimed to work. Adding a version here is a claim that the fingerprints and
 * the injected code were verified against that exact build.
 */
object Constants {
    private val TANDEM_TARGETS = listOf(
        AppTarget(
            version = "6.38.0",
            minSdk = 32,
        ),
        // The APK itself declares minSdk 26, but the bundle's dark-mode patch calls
        // UiModeManager.setApplicationNightMode, which exists from API 31, and that patch is on by
        // default. 31 is therefore the honest floor for a patched 6.12.0 build.
        AppTarget(
            version = "6.12.0",
            minSdk = 31,
        ),
    )

    /** Tandem as the APKM bundle it is distributed in (the inspected reference files). */
    val COMPATIBILITY_TANDEM_APKM = Compatibility(
        name = "Tandem: Language exchange",
        packageName = "net.tandem",
        apkFileType = ApkFileType.APKM,
        // Accent colour of the app icon, from the bundle metadata.
        appIconColor = 0x2CC0D8,
        targets = TANDEM_TARGETS,
    )

    /** The same builds split out into a single APK (universal or `base.apk`). */
    val COMPATIBILITY_TANDEM_APK = Compatibility(
        name = "Tandem: Language exchange",
        packageName = "net.tandem",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2CC0D8,
        targets = TANDEM_TARGETS,
    )
}

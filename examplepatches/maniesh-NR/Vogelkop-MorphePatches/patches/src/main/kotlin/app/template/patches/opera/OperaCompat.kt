package app.template.patches.opera

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Compatibility targets for the Opera browser family.
 *
 * One [Compatibility] is declared per distribution file type, matching how the
 * builds are listed on APKMirror / Uptodown:
 *
 *  - `APKM`: Google Play split bundles of Opera / Opera Beta / Opera GX. Play
 *    builds download the Chromium core at first run; all patched code (ad
 *    blocker list loading, suggested sites, ad module wiring) lives in
 *    `base.apk`, so patching the base (or a merged universal APK) works.
 *  - `APK`: the single full "generic" APK from get.opera.com
 *    (`Opera_103_3_5234_91185_Generic_Opera_arm8_LZMA.apk`) — the recommended
 *    input for Opera stable.
 *
 * Opera GX 3.x is a standalone WebView-based app, not a Chromium build, and has
 * its own ad-blocker configuration (see `gx/GxRemoveSponsoredTilesPatch.kt`).
 *
 * No version codes are declared: there is exactly one release per version per
 * file type, and the patches themselves fail loudly if their targets are
 * missing. The `version = null` experimental target lets users try newer
 * versions (the string fingerprints used by the patches are version-robust).
 */
private val OPERA_TARGETS = listOf(
    // Version confirmed working (recon + string verification in evidence/ANALYSIS.md).
    AppTarget(version = "103.3.5234.91185"),
    // Future versions: string fingerprints are expected to survive, but untested.
    AppTarget(version = null, isExperimental = true),
)

private val OPERA_BETA_TARGETS = listOf(
    AppTarget(version = "104.0.5262.91143"),
    AppTarget(version = null, isExperimental = true),
)

private val OPERA_GX_TARGETS = listOf(
    AppTarget(version = "3.3.18"),
    AppTarget(version = null, isExperimental = true),
)

/** Opera Browser — Play split bundle (.apkm on APKMirror). */
val OPERA_COMPATIBILITY = Compatibility(
    name = "Opera Browser",
    packageName = "com.opera.browser",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xFF1B36,
    targets = OPERA_TARGETS,
)

/** Opera Browser — direct-download full APK from get.opera.com. */
val OPERA_DIRECT_COMPATIBILITY = Compatibility(
    name = "Opera Browser",
    packageName = "com.opera.browser",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFF1B36,
    targets = OPERA_TARGETS,
)

/** Opera Browser Beta — Play split bundle (.apkm on APKMirror). */
val OPERA_BETA_COMPATIBILITY = Compatibility(
    name = "Opera Browser Beta",
    packageName = "com.opera.browser.beta",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xC15746,
    targets = OPERA_BETA_TARGETS,
)

/** Opera GX — Play split bundle (.apkm on APKMirror). */
val OPERA_GX_COMPATIBILITY = Compatibility(
    name = "Opera GX",
    packageName = "com.opera.gx",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xF81C4C,
    targets = OPERA_GX_TARGETS,
)

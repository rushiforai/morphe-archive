package app.railone.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * RailOne (Aikyam) - org.cris.aikyam, Centre for Railway Information Systems.
     *
     * - `signatures` is the SHA-256 of the **unmodified Play-signed** APK, so Morphe Manager can
     *   refuse to patch anything that is not the genuine original file.
     *   (measured with `apksigner verify --print-certs` on the pulled base.apk)
     * - `apkFileType` only affects which download page Manager deep-links to. RailOne is delivered
     *   by Play as a split bundle (.apks/.xapk/.apkm); Morphe Manager merges those automatically.
     *   Change to ApkFileType.APK if you always feed it a single merged APK instead.
     * - Versions are listed newest first. Add new ones only after actually verifying them;
     *   `version = null` marks "assume the fingerprints still match future versions".
     */
    val COMPATIBILITY_RAILONE = Compatibility(
        name = "RailOne",
        packageName = "org.cris.aikyam",
        description = "Indian Railways passenger app by CRIS. These patches disarm the app's " +
            "anti-tamper checks so it keeps working on a re-signed build with USB debugging on.",
        apkFileType = ApkFileType.APKS,
        // Cosmetic only: icon background colour used in Morphe Manager.
        // Must be given as 0xRRGGBB with a zero alpha byte - Compatibility.init requires
        // `alpha == 0x00`, despite the docs saying "full 0xFF opacity value".
        appIconColor = 0x1B4B8F,
        signatures = setOf(
            // Play Store (Google) signing certificate of the unpatched app.
            "8a5f21a01ef7d1202500e143e34bdf4c3166cc43c5595b35f0f463b53f8f0d16"
        ),
        targets = listOf(
            // Verified by hand on real devices (v2.1.66 and v2.1.62 smali patch sets and the
            // resulting builds were installed and tested).
            AppTarget(version = "2.1.66"),
            AppTarget(version = "2.1.62"),
            // Experimental: fingerprints match on string constants that survive the per-release
            // re-obfuscation, but a future release must still be checked.
            AppTarget(version = null, isExperimental = true)
        )
    )
}

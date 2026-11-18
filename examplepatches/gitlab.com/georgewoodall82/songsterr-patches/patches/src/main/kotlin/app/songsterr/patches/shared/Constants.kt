package app.songsterr.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Songsterr Guitar Tabs & Chords (com.songsterr).
     *
     * Developed and verified against 7.1.3 (versionCode 2012282384), the APKM
     * in this workspace:
     * com.songsterr_7.1.3-2012282384_4arch_6dpi_24lang_*.apkm
     *
     * apkFileType = APKM is important: Morphe Manager uses it to redirect
     * users to the correct APKMirror/UpToDown file type. The target APK inside
     * the APKM is base.apk (package com.songsterr).
     */
    val COMPATIBILITY_SONGSTERR = Compatibility(
        name = "Songsterr Guitar Tabs & Chords",
        packageName = "com.songsterr",
        apkFileType = ApkFileType.APKM,
        // Songsterr icon blue.
        appIconColor = 0x0494F0,
        targets = listOf(
            AppTarget(
                version = "7.1.3",
            ),
            // Allow trying on newer versions experimentally.
            // Fingerprints use obfuscated names (Lcom/songsterr/iap/f; etc.)
            // pinned to 7.1.3, so newer versions may fail with a clear
            // fingerprint-mismatch error. Remove this entry if you want to
            // strictly allow only 7.1.3.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}

package dev.supperelias2.sbstv.ads

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

/**
 * Preparation for the playback patch: resolve all expected integration points.
 * This probe deliberately inserts no instructions and does not remove ads.
 * Matching failure aborts the patch rather than treating an unknown build as safe.
 */
@Suppress("unused")
val playbackCompatibilityPatch = bytecodePatch(
    name = "SBS playback compatibility check",
    description = "Checks SBS TV 6.3.1 playback integration points. Does not remove advertisements.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "SBS On Demand for Android TV",
            packageName = "com.sbs.ondemand.tv",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xDCBD1D,
            targets = listOf(AppTarget(version = "6.3.1"))
        )
    )

    execute {
        // Fingerprint resolution validates names, signatures and key instructions.
        VodRequestFingerprint.method
        PrerollFingerprint.method
        ProviderSelectionFingerprint.method
        FallbackProviderFingerprint.method
    }
}

package app.eurowag.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Eurowag Navi / Eurowag Navigation - Truck GPS (com.roadlords.android).
     *
     * Developed and verified against 4.18.1-7eb59b0f (versionCode 41801), the
     * XAPK in this workspace:
     * Eurowag+Navigation+-+Truck+GPS_4.18.1-7eb59b0f_APKPure.xapk
     *
     * The XAPK contains a base APK plus an arm64-v8a split (which carries the
     * 76 MB libsygic.so) and an mdpi split. Morphe Manager merges the split
     * bundle into one APK before patching, so the compatibility type is XAPK.
     *
     * The app is Sygic-based. The premium state is not a native license check:
     * it is computed from a feature JWT returned by Eurowag's backend. The
     * obfuscated names below (arn.v, xhn.x, fra.resolve, am9.i) are pinned to
     * this build. They will fail loudly on a different version rather than
     * silently doing nothing.
     */
    val COMPATIBILITY_EUROWAG = Compatibility(
        name = "Eurowag Navi",
        packageName = "com.roadlords.android",
        apkFileType = ApkFileType.XAPK,
        // Eurowag red.
        appIconColor = 0xE30613,
        targets = listOf(
            AppTarget(
                version = "4.18.1-7eb59b0f",
            ),
            // Allow trying on newer versions experimentally. The obfuscated
            // names change between releases, so expect a fingerprint mismatch
            // rather than a silent no-op.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}

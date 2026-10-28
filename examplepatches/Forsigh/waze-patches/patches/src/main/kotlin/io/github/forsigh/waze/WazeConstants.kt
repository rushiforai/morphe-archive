package io.github.forsigh.waze

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * App compatibility declarations for Waze (com.waze).
 *
 * The confirmed target is the exact build these patches were developed against,
 * plus an experimental "any version" target so the patches can still be attempted on
 * newer builds (fingerprints may or may not survive an app update).
 */
object WazeConstants {
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        // Waze is distributed on APKMirror as an APKM bundle. Kept in sync so Morphe Manager
        // redirects the user to the correct download page.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            // Confirmed target: the production build every config key was verified against
            // (versionCode 1030734). Waze uses a different versionName scheme for beta vs
            // production builds: the beta MOD this project was reverse-engineered from reports
            // versionName 5.24.4.900 with versionCode 1030731, i.e. the two are adjacent
            // builds - not a different release. Declaring the beta name made Morphe skip
            // every patch on the production APK, so the production name is the confirmed one.
            AppTarget(version = "5.24.90.901"),
            // Second confirmed target (versionCode 1030736). Verified the same way as the first: the
            // bundle applies WITHOUT -f, every hooked getter comes out structurally identical
            // (57/33/7 instructions, no invalid branches), and all 30 forced CONFIG_VALUE_* keys
            // still exist in its dex. Without this entry Morphe skips all 17 patches silently there.
            AppTarget(version = "5.25.0.1"),
            // Third confirmed target (versionCode 1030737, released 2026-10-11). Verified the same way
            // as the second: the bundle applies WITHOUT -f ("Applying 17 patches", zero skips), every
            // anchored method is instruction-identical to 5.25.0.1 (getters 57/33/7, no invalid
            // branches), all 34 referenced CONFIG_VALUE_* keys exist in its dex, and the full .apkm
            // patches end to end into one signed merged APK.
            AppTarget(version = "5.25.4.900"),
            // Fourth confirmed target (versionCode 1030741, Forsigh's beta from Play, pulled from his
            // phone on 2026-10-15). Waze's .90.9xx line is its beta channel; verified the same way as
            // the others: the bundle applies WITHOUT -f, every anchored method binds, and all
            // CONFIG_VALUE_* keys exist in its dex (NEWTARGET-VERIFY-5.25.90.900.txt).
            AppTarget(version = "5.25.90.900"),
            // Fifth confirmed target (versionCode 1030742, released 2026-10-20). Verified the same
            // way as the others: all 28 rows apply, every anchored method binds, and every recorded
            // CONFIG_VALUE_* exists in its dex except AAP_USE_NORMAL_CAR_GPS_UPDATE_RATE, which
            // 5.25.90.900 had already renamed to GPS_ALIGN_AAP_AND_DEVICE_UPDATE_RATE (both recorded).
            AppTarget(version = "5.26.0.0"),
            // Sixth target (versionCode 1030744): Forsigh's installed build, pulled from his phone on
            // 2026-10-27. Added so the bundle stops skipping every row on the version people actually
            // run, then verified row by row against that base.
            AppTarget(version = "5.26.5.0"),
            // Experimental: attempt on any version / any architecture.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}

package dev.hyzor.patches.solidexplorer.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** The immutable licence record every subscription decision is read from. */
    const val LICENSE_DETAILS = "Lpl/solidexplorer/licensing/LicenseDetails;"

    /**
     * `enum LicenseState { UNKNOWN, CHECKING, TRIAL, UNLICENSED, LEGACY_PREMIUM, SUBSCRIBER,
     * PREMIUM_PRO, ERROR }`. `getPRO()` is `{SUBSCRIBER, PREMIUM_PRO}`.
     */
    const val LICENSE_STATE = "Lpl/solidexplorer/licensing/LicenseState;"

    val SOLID_EXPLORER = Compatibility(
        name = "Solid Explorer",
        packageName = "pl.solidexplorer2",

        // The tested artifact is the 3.6.4 APKM from APKMirror (base.apk + arm64-v8a,
        // armeabi-v7a, x86 and x86_64 splits, versionCode 306041). All of the patched code
        // lives in base.apk; the splits only carry native libraries.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x039BE5,

        targets = listOf(
            AppTarget(version = "3.6.4", versionCode = 306041),
        ),
    )
}

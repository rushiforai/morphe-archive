package dev.dyno0311.patches.apps.camscanner

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Exact target used for development: CamScanner 7.27.0.2609220000 (versionCode 72701).
 *
 * CamScanner is distributed only as an APKM bundle; base.apk carries no native libraries, so a bare base.apk is
 * not a complete install and is not supported here.
 * Fingerprints are pinned to that build; widen only after re-verifying them.
 */
val camScannerCompatibility = Compatibility(
    name = "CamScanner",
    packageName = "com.intsig.camscanner",
    appIconColor = 0x19BCAA,
    apkFileType = ApkFileType.APKM_REQUIRED,
    targets = listOf(AppTarget("7.27.0.2609220000", versionCode = 72701))
)

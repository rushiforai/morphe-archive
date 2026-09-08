package dev.bucek.affine.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    const val PACKAGE_NAME = "app.affine.pro"
    const val VERSION_NAME = "0.27.4"
    const val VERSION_CODE = 439

    val COMPATIBILITY_AFFINE = Compatibility(
        name = "AFFiNE",
        packageName = PACKAGE_NAME,
        description = "The official Google Play XAPK for AFFiNE 0.27.4 (arm64-v8a).",
        apkFileType = ApkFileType.XAPK_REQUIRED,
        appIconColor = 0x1E96EB,
        targets = listOf(
            AppTarget(
                version = VERSION_NAME,
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to VERSION_CODE),
                description = "Google Play release 439; requires its arm64-v8a split.",
            ),
        ),
    )
}
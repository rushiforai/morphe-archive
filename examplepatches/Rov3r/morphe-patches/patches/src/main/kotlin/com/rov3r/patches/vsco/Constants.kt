package com.rov3r.patches.vsco

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Versions of VSCO currently verified against this patch. */
internal val VSCO_COMPATIBILITY = Compatibility(
    name = "VSCO",
    packageName = "com.vsco.cam",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFFFFFF,
    targets = listOf(
        AppTarget(version = "489.1")
    )
)

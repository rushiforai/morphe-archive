package com.nmnvan.patches.thescore.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_THESCORE = Compatibility(
        name = "theScore",
        packageName = "com.fivemobile.thescore",
        // theScore is distributed as a split bundle (base + abi + density splits).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0B3B8C,
        targets = listOf(
            AppTarget(version = "26.15.0"),
            AppTarget(version = "26.12.0"),
        )
    )

    /** Extension bundle with the Java code the patches call into. */
    const val EXTENSION_BUNDLE = "extensions/thescore.mpe"

    const val EXTENSION_PACKAGE = "Lcom/nmnvan/extension/thescore"
}

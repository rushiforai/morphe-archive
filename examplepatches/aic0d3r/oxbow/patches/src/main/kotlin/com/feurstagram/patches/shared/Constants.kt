package com.feurstagram.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** Root descriptor of the compiled extension classes. */
    const val EXTENSION_PACKAGE = "Lcom/feurstagram/extension"

    /** Path to the compiled extension bundle, shared by every patch. */
    const val EXTENSION = "extensions/extension.mpe"

    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        // APKMirror ships Instagram as a split bundle; Morphe Manager merges it itself.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFC483C,
        // Pinned to the tested build; bump on each Instagram update after verifying patches.
        targets = listOf(
            AppTarget(version = "453.0.0.55.79"),
        ),
    )
}

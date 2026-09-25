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
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFC483C,
        // version = null targets the latest known build and every future one,
        // so the patches keep applying across Instagram updates.
        targets = listOf(
            AppTarget(version = null),
        ),
    )
}

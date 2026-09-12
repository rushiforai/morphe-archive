package dev.sfehhrths.ekispert.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** 駅すぱあと for Android (jp.co.val.expert.android.aio). */
    val COMPATIBILITY_EKISPERT = Compatibility(
        name = "駅すぱあと",
        packageName = "jp.co.val.expert.android.aio",
        // Input is a single APK merged from the device splits with APKEditor (ext/ekispert-merged.apk).
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A5B5,
        targets = listOf(
            // Version the fingerprints were written against (versionCode 295).
            AppTarget(version = "3.53.0"),
        ),
    )

    /** Dalvik descriptor of the extension class whose static methods the patches call. */
    const val EXTENSION_CLASS = "Ldev/sfehhrths/ekispert/extension/ResponseTapPatch;"
}

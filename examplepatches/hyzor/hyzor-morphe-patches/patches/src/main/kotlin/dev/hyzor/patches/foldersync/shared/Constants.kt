package dev.hyzor.patches.foldersync.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val FOLDERSYNC = Compatibility(
        name = "FolderSync",
        packageName = "dk.tacit.android.foldersync.lite",

        // The tested artifact is the 4.14.0 APKM from APKMirror (base.apk + arm64-v8a and
        // dpi splits, versionCode 2020100216). All of the patched code lives in the base APK.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x406FB8,

        targets = listOf(
            AppTarget(version = "4.14.0", versionCode = 2020100216),
        ),
    )
}

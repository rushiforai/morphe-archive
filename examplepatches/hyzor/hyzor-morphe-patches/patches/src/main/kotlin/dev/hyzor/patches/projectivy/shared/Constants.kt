package dev.hyzor.patches.projectivy.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val PROJECTIVY = Compatibility(
        name = "Projectivy Launcher",
        packageName = "com.spocky.projengmenu",

        // The tested artifact is the 4.73 APKM from APKMirror (base.apk + arm64-v8a and
        // xhdpi splits, versionCode 98). All of the patched code lives in base.apk.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF08029,

        targets = listOf(
            AppTarget(version = "4.73", versionCode = 98),
        ),
    )
}

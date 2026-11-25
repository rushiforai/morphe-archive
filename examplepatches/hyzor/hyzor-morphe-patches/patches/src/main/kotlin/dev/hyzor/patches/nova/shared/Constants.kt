package dev.hyzor.patches.nova.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val NOVA_LAUNCHER = Compatibility(
        name = "Nova Launcher",
        packageName = "com.teslacoilsw.launcher",

        // The tested artifact is the APK from APKMirror (arm64-v8a + armeabi-v7a, nodpi).
        // It is a single APK, not a bundle, and all of the code the patch touches is in
        // classes.dex.
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE53935,

        targets = listOf(
            // Nova's versionName is "90100 (9.0.1)", not "9.0.1"; Morphe compares the
            // versionName as-is, so the build number is part of the target string.
            //
            // 8.9.5 is deliberately not a target: its settings switches change the persisted
            // preference but do not repaint until the screen is recreated. 8.9.6 fixed that,
            // and every later release keeps the fix.
            AppTarget(version = "90100 (9.0.1)", versionCode = 90100),
        ),
    )
}

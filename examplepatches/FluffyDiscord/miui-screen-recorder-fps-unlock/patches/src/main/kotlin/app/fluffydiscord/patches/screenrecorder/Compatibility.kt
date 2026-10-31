package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val ORIGINAL_PACKAGE_NAME = "com.miui.screenrecorder"
internal const val PATCHED_PACKAGE_NAME = "com.miui.screenrecorder.hfr"

internal val SCREEN_RECORDER_COMPATIBILITY = Compatibility(
    name = "Screen Recorder",
    packageName = ORIGINAL_PACKAGE_NAME,
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFF5A36,
    targets = listOf(
        AppTarget(version = "4.15.3.5.0"),
        AppTarget(version = null, isExperimental = true),
    ),
)

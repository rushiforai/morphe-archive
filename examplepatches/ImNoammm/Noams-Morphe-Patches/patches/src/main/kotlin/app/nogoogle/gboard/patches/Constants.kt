package app.nogoogle.gboard.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"
internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
internal const val EXTENSION = "Lapp/nogoogle/gboard/GoogleBlocker;"

internal val COMPATIBILITY_GBOARD = Compatibility(
    name = "Gboard",
    packageName = GBOARD_PACKAGE,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1A73E8,
    targets = listOf(
        AppTarget(version = "18.2.4.969776716-release-arm64-v8a"),
        AppTarget(version = null, isExperimental = true),
    ),
)

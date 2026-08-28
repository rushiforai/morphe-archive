package app.danielthemaniel.patches.keyboarddesigner

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_KEYBOARD_DESIGNER = Compatibility(
    name = "Custom+ Keyboard Designer",
    packageName = "de.humbergsoftware.keyboarddesigner",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x83B6E4,
    targets = listOf(
        AppTarget(version = "5.B8.8"),
        AppTarget(version = null, isExperimental = true),
    ),
)

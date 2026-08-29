package app.danielthemaniel.patches.defit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_DEFIT = Compatibility(
    name = "DeFit",
    packageName = "com.fitness.debugger",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x008577,
    targets = listOf(
        AppTarget(version = "0.8.2a", versionCode = 821),
    ),
)
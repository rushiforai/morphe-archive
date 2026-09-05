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
        // Keep the thoroughly-tested release as Morphe's recommended target.
        AppTarget(version = "0.8.2a", versionCode = 821),

        // 0.9.3 is newer, so making it experimental keeps 0.8.2a recommended
        // while still exposing 0.9.3 as an alternate target in Expert mode.
        AppTarget(
            version = "0.9.3",
            versionCode = 930,
            isExperimental = true,
        ),
    ),
)

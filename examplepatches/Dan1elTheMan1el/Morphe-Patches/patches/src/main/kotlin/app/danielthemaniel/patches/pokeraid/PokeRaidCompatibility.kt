package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_POKERAID = Compatibility(
    name = "PokeRaid - Worldwide Remote Raids",
    packageName = "me.pokeraid",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x395FAA,
    targets = listOf(
        AppTarget(version = "0.48.9"),
        AppTarget(version = null, isExperimental = true),
    ),
)
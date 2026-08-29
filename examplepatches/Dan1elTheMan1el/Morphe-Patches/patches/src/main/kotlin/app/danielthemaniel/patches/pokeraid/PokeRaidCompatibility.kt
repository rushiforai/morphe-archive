package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val COMPATIBILITY_POKERAID = Compatibility(
    name = "PokeRaid - for Pokémon GO Raid",
    packageName = "me.pokeraid",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x395FAA,
    targets = listOf(
        AppTarget(version = "0.48.9", versionCode = 160),
    ),
)
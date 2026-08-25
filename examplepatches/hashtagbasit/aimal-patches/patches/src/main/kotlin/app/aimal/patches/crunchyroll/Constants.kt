package app.aimal.patches.crunchyroll

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val CRUNCHYROLL = Compatibility(
    name = "Crunchyroll",
    packageName = "com.crunchyroll.crunchyroid",
    // APKMirror ships Crunchyroll as a split bundle.
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xF47521,
    targets = listOf(
        // Last version the patches were verified against.
        AppTarget(version = "3.117.0"),
        // The patches match on structure, not version, so newer builds are
        // expected to work.
        AppTarget(version = null, isExperimental = true),
    )
)

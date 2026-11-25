package app.spicetify.patches.spotify

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

val spotifyCompatibility = Compatibility(
    name = "Spotify",
    packageName = "com.spotify.music",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1DB954,
    targets = listOf(
        AppTarget(
            version = "9.2.4.2644",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 148916300),
            isExperimental = true,
            description = "Only the hooks verified on this build.",
        ),
        AppTarget(
            version = "9.2.0.2053",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 148387875),
            isExperimental = true,
            description = "Only the hooks verified on this build.",
        ),
        AppTarget(
            version = "9.1.94.1929",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 147600575),
            isExperimental = true,
            description = "Only the hooks verified on this build.",
        ),
    ),
)

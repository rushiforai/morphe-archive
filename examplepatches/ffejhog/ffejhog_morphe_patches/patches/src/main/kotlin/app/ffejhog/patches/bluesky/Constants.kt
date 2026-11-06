package app.ffejhog.patches.bluesky

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Bluesky ships as a single universal APK (all ABIs included), so the app version plus its
     * version code precisely identify the file this patch was developed against. The Hermes
     * bytecode bundle inside the APK changes with every release, so other versions are only
     * expected to work when their bytecode happens to match.
     */
    val COMPATIBILITY_BLUESKY = Compatibility(
        name = "Bluesky",
        description = "Decentralized social network built on the AT Protocol.",
        packageName = "xyz.blueskyweb.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0068FF,
        targets = listOf(
            // The version the patch was developed and verified against.
            AppTarget(
                version = "1.137.0",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1690),
            ),
            // Any other version is accepted experimentally. The patch aborts with a clear error
            // if the bytecode pattern does not match exactly once.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}

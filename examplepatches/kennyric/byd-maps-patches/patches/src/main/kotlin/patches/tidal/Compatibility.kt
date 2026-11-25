package patches.tidal

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val tidal = Compatibility(
    name = "TIDAL", packageName = "com.aspiro.tidal", apkFileType = ApkFileType.APKM,
    signatures = setOf(
        "2e74cf21cde153a6e6abdb2c9a3fb5f26fc5c4c6bcdb635152b967459487ea96",
        "2e8a4794a95418367e36c84303feb43774919d6a351129d23d0fcf1b0b729454",
    ),
    targets = listOf(
        AppTarget(
            version = "2.216.0", minSdk = 24,
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 10020),
        ),
    ),
)

internal val originalInput = patches.shared.originalInput(tidal, additionalMinSdks = setOf(32))

package patches.tuya

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val tuya = Compatibility(
    name = "Tuya Smart Life",
    packageName = "com.tuya.smart",
    apkFileType = ApkFileType.APKS,
    signatures = setOf(
        "93219fc273e2200f4adee5f7191dc656ba2a2d7b2ff5d24cd55c4b6155001e40",
    ),
    targets = listOf(
        AppTarget(version = "7.12.6", minSdk = 24,
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 872)),
    ),
)

internal val originalInput = patches.shared.originalInput(tuya)

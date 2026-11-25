package patches.deezer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal val deezer = Compatibility(
    name = "Deezer", packageName = "deezer.android.app", apkFileType = ApkFileType.APKM,
    signatures = setOf("51a891a6c5d17b4e36a6f46bab675c1cae786a5af06f51d0105dab7ec6a94516"),
    targets = listOf(
        AppTarget(
            version = "9.0.26.3", minSdk = 28,
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 9002603),
        ),
    ),
)

internal val originalInput = patches.shared.originalInput(deezer, additionalMinSdks = setOf(32))

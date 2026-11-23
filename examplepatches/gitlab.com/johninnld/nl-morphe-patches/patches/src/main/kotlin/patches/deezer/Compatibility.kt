package patches.deezer

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch

internal val deezer = Compatibility(
    name = "Deezer", packageName = "deezer.android.app", apkFileType = ApkFileType.APKM,
    signatures = setOf("51a891a6c5d17b4e36a6f46bab675c1cae786a5af06f51d0105dab7ec6a94516"),
    targets = listOf(
        AppTarget(
            version = "9.0.27.3", minSdk = 26,
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 9002703),
        ),
    ),
)

internal val originalInput = patches.shared.originalInput(deezer)

/** Every Deezer mutation needs the restored startup; the original package is still re-signed. */
internal val deezerBase = bytecodePatch {
    dependsOn(originalInput, startupCompatibilityPatch)
}

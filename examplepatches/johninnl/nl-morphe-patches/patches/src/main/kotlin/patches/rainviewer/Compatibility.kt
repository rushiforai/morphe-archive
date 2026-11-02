package patches.rainviewer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal const val REMOTE = "Lcom/lucky_apps/data/settings/entity/remote/"
internal val rainviewer = Compatibility(
    name = "RainViewer", packageName = "com.lucky_apps.RainViewer", apkFileType = ApkFileType.APKM,
    signatures = setOf("1ee1224e4ec7aa2214ae60f92f7e53fa2de148b12f7e9fa3e9c97b87844f4bcc"),
    targets = listOf(AppTarget(version = "8.4.1", versionCode = 44084, minSdk = 29)),
)
// Publisher API29 and API32 variants have identical DEX and the same signer.
internal val originalInput = patches.shared.originalInput(rainviewer, additionalMinSdks = setOf(32))
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(owner: String, name: String, result: String, vararg parameters: String) =
    Fingerprint(definingClass = owner, name = name, returnType = result, parameters = parameters.toList()).uniqueMatch().method

package patches.vi

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val vi = Compatibility(
    name = "Voetbal International", packageName = "nl.vi", apkFileType = ApkFileType.APKS,
    signatures = setOf("3d508fb86865e48353a506426baa57319215103dc9bcc5b8f34fa870ebe492be"),
    targets = listOf(AppTarget(version = "5.13.52", versionCode = 910, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(vi)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(owner: String, signature: String) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch()

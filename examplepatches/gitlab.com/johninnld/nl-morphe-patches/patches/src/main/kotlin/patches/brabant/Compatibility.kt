package patches.brabant

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal val brabant = Compatibility(
    name = "Omroep Brabant", packageName = "nl.omroepbrabant.android", apkFileType = ApkFileType.APKS,
    signatures = setOf("5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03"),
    targets = listOf(AppTarget(version = "11.1.0", versionCode = 7331764, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(brabant)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(owner: String, signature: String) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch()

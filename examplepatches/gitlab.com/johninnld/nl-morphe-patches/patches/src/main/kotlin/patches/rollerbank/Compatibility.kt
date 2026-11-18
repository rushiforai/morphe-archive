package patches.rollerbank

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import patches.shared.uniqueMatch

internal const val APP = "Lcom/dennisk/rollerbank/ui/"
internal val rollerbank = Compatibility(
    name = "Rollerbank", packageName = "com.dennisk.rollerbank", apkFileType = ApkFileType.APKS,
    signatures = setOf("dff7cf9d4f59e4be49a5135425a00c6feb0fc561d5b3aa0d703456dab6d9b788"),
    targets = listOf(AppTarget(version = "4.5.3.1", versionCode = 4531, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(rollerbank)

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun guarded(owner: String, signature: String, flags: Int, registers: Int, count: Int) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch().method.also {
    check(it.accessFlags == flags && it.implementation!!.registerCount == registers && it.instructions.count() == count) {
        "Rollerbank original method changed: $owner->$signature"
    }
}

package patches.marktplaats

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.uniqueMatch

internal val marktplaats = Compatibility(
    name = "Marktplaats", packageName = "nl.marktplaats.android", apkFileType = ApkFileType.APKS,
    signatures = setOf("742dc275b25928621a8fbdb4362876825c8aec6a4afdbd04d0b8d72b9ca22052"),
    targets = listOf(AppTarget(version = "16.17.0", versionCode = 633462, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(marktplaats)
private val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun target(owner: String, signature: String) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch()

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(owner: String, signature: String, flags: Int, registers: Int, count: Int) = target(owner, signature).method.also { method ->
    check(method.accessFlags == flags && method.implementation!!.registerCount == registers &&
        method.instructions.count { it.opcode !in payloads } == count) {
        "Marktplaats original method changed: $owner->$signature"
    }
}

package patches.negentwee

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.uniqueMatch

internal val negentwee = Compatibility(
    name = "9292", packageName = "nl.negentwee", apkFileType = ApkFileType.APKS,
    signatures = setOf("7ad4a3503739803a8eec7f2f8d9a4e678d6f33f9b77d5be81e2c089371352af6"),
    targets = listOf(AppTarget(version = "2.48.1", versionCode = 32189, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(negentwee)
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
        "9292 original method changed: $owner->$signature"
    }
}

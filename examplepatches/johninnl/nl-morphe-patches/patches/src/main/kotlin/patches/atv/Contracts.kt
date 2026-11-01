package patches.atv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.uniqueMatch

context(context: BytecodePatchContext)
internal fun exact(owner: String, signature: String, registers: Int, count: Int) = Fingerprint(
    definingClass = owner, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch().method.also { method ->
    val actual = method.instructions.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
        Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) }
    check(method.implementation!!.registerCount == registers && actual == count) {
        "Changed ATV contract: $owner->$signature (registers=${method.implementation!!.registerCount}, instructions=$actual)"
    }
}

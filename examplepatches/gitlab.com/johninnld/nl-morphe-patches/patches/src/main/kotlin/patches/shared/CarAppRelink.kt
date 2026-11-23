package patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableIntEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderArrayPayload
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue

/**
 * Rewrites the extension's compile-time resource ids to the ids [CarAppResources] allocated in
 * the target app. Only the extension's own separately packaged classes are relinked, never
 * original app bytecode.
 */
context(context: BytecodePatchContext)
internal fun relinkExtensionResourceIds(types: List<String>, ids: Map<Int, Int>) {
    for (type in types) {
        val cls = context.mutableClassDefBy(type)
        cls.fields.forEach { field ->
            val value = field.initialValue as? IntEncodedValue
            value?.let { ids[it.value] }?.let { field.initialValue = MutableIntEncodedValue(ImmutableIntEncodedValue(it)) }
        }
        cls.methods.forEach { method ->
            val instructions = method.implementation?.instructions ?: return@forEach
            instructions.withIndex().toList().forEach { (index, instruction) ->
                if (instruction.opcode in setOf(Opcode.CONST, Opcode.CONST_HIGH16)) {
                    val old = (instruction as NarrowLiteralInstruction).narrowLiteral
                    ids[old]?.let { id -> method.replaceInstruction(index, "const v${(instruction as OneRegisterInstruction).registerA}, $id") }
                } else if (instruction is ArrayPayload && instruction.elementWidth == 4) {
                    method.implementation!!.replaceInstruction(index, BuilderArrayPayload(4,
                        instruction.arrayElements.map { ids[it.toInt()] ?: it }))
                }
            }
        }
    }
}

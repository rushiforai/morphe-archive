package patches.bol.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Mask the effective privacy features after persistent/remote settings, preserving all remaining bits. */
context(context: BytecodePatchContext)
internal fun restrictAirshipFeatures(disabledBits: Int) {
    val manager = Fingerprint(name = "<clinit>",
        strings = listOf("com.urbanairship.PrivacyManager.enabledFeatures")).matchSingle().classDef
    val getter = manager.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType.startsWith("L") &&
            method.implementation?.instructions?.any {
                it.getReference<MethodReference>()?.let { ref ->
                    ref.definingClass == "Ljava/lang/Integer;" && ref.name == "intValue"
                } == true
            } == true
    }
    val mask = getter.instructions.firstNotNullOf { instruction ->
        instruction.getReference<FieldReference>()?.takeIf { it.definingClass == getter.returnType && it.type == "I" }
    }
    getter.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.toList().reversed().forEach { (index, instruction) ->
        val result = (instruction as OneRegisterInstruction).registerA
        require(result < 16 && getter.implementation!!.registerCount >= 2)
        val bits = if (result == 0) 1 else 0
        getter.addInstructionsAtControlFlowLabel(index, """
            iget v$bits, v$result, ${mask.definingClass}->${mask.name}:I
            and-int/lit16 v$bits, v$bits, ${disabledBits.inv()}
            new-instance v$result, ${getter.returnType}
            invoke-direct {v$result, v$bits}, ${getter.returnType}-><init>(I)V
        """.trimIndent())
    }
}

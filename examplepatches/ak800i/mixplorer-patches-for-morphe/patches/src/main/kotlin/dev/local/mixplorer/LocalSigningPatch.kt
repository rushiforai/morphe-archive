package dev.local.mixplorer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val localSigningPatch = bytecodePatch {
    execute {
        val owner = classDefByStrings("Unknown Fingerprint!").singleOrNull()
            ?: error("Expected exactly one MiXplorer self-signature helper.")
        patchLocalSigning(mutableClassDefBy(owner))
    }
}

internal fun patchLocalSigning(owner: MutableClass) {
    val markers = setOf("CRC-32", "Unknown Fingerprint!", "87ed1907", "9eccce78", "d725ce3f")
    val method = owner.methods.singleOrNull { candidate ->
        val strings = candidate.implementation?.instructions?.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }.orEmpty()
        candidate.parameterTypes.isEmpty() && candidate.returnType == "Ljava/lang/String;" &&
            candidate.accessFlags and AccessFlags.STATIC.value != 0 && strings.containsAll(markers)
    } ?: error("Unsupported MiXplorer self-fingerprint method.")
    val instructions = method.implementation!!.instructions.toList()
    val firstAllowed = instructions.indices.filter {
        ((instructions[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == "87ed1907"
    }.singleOrNull() ?: error("Ambiguous MiXplorer signature whitelist.")
    check(firstAllowed >= 2 && firstAllowed + 1 < instructions.size) { "Incomplete signature whitelist." }
    check(instructions[firstAllowed - 2].opcode == Opcode.SPUT_OBJECT &&
        instructions[firstAllowed - 1].opcode == Opcode.SGET_OBJECT &&
        instructions[firstAllowed].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
        instructions[firstAllowed + 1].opcode == Opcode.INVOKE_INTERFACE
    ) { "Unsupported or already patched signature whitelist layout." }
    val fingerprint = (instructions[firstAllowed - 2] as ReferenceInstruction).reference as? FieldReference
        ?: error("Missing cached self fingerprint.")
    val listField = (instructions[firstAllowed - 1] as ReferenceInstruction).reference as? FieldReference
        ?: error("Missing allowed fingerprint list.")
    val listRegister = (instructions[firstAllowed - 1] as OneRegisterInstruction).registerA
    val valueRegister = (instructions[firstAllowed] as OneRegisterInstruction).registerA
    val add = instructions[firstAllowed + 1] as FiveRegisterInstruction
    check(fingerprint.definingClass == owner.type && fingerprint.type == "Ljava/lang/String;" &&
        listField.type == "Ljava/util/ArrayList;" && listRegister != valueRegister &&
        add.registerCount == 2 && add.registerC == listRegister && add.registerD == valueRegister &&
        (instructions[firstAllowed + 1] as ReferenceInstruction).reference.toString() ==
        "Ljava/util/List;->add(Ljava/lang/Object;)Z"
    ) { "Unsupported MiXplorer self-fingerprint operands." }
    method.addInstructions(
        firstAllowed,
        """
            sget-object v$valueRegister, $fingerprint
            invoke-interface {v$listRegister, v$valueRegister}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        """.trimIndent(),
    )
}
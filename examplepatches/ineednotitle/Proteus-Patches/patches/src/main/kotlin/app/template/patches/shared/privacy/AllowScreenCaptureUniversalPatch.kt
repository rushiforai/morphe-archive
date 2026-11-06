package app.template.patches.shared.privacy
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal "Allow screenshots & screen recording" patch — inverse of
// blockScreenCapturePatch. Clears the FLAG_SECURE (0x2000) bit from literal
// Window.addFlags/setFlags arguments and flips literal
// SurfaceView.setSecure(true) to false. Fail-safe; default = false.

private const val FLAG_SECURE = 0x2000
private const val WINDOW_CLASS = "Landroid/view/Window;"
private const val SURFACE_VIEW_CLASS = "Landroid/view/SurfaceView;"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_OBJECT,
    Opcode.MOVE_RESULT_WIDE,
)

@Suppress("unused")
val universalAllowScreenCapturePatch = bytecodePatch(
    name = "Allow screenshots & screen recording",
    description = """
        Attempts to remove recognizable FLAG_SECURE and secure SurfaceView settings
        so screenshots and screen recordings can work. Some screens or protection
        methods may still block capture, including payment or banking screens.

        Applies to any app. Do not combine with "Block screenshots & screen recording".
    """.trimIndent(),
    default = false,
) {
    execute {
        var patched = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed

                    when {
                        reference.definingClass == WINDOW_CLASS && reference.name == "addFlags" -> {
                            val flagsRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                            clearSecureBit(instructions, index, flagsRegister, replacements)
                        }

                        reference.definingClass == WINDOW_CLASS && reference.name == "setFlags" -> {
                            val flagsRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                            val maskRegister = argumentRegister(instruction, 2) ?: return@forEachIndexed
                            clearSecureBit(instructions, index, flagsRegister, replacements)
                            clearSecureBit(instructions, index, maskRegister, replacements)
                        }

                        reference.definingClass == SURFACE_VIEW_CLASS && reference.name == "setSecure" -> {
                            val valueRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                            val literal = literalForRegister(instructions, index, valueRegister)
                                ?: return@forEachIndexed
                            if (literal.second != 0) {
                                replacements[literal.first] = constValue(valueRegister, 0)
                            }
                        }
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                    patched += replacements.size
                }
            }
        }

        logUniversal("Allow screen capture: $patched FLAG_SECURE literal(s) cleared.")
    }
}

private fun clearSecureBit(
    instructions: List<Instruction>,
    before: Int,
    register: Int,
    replacements: MutableMap<Int, String>,
) {
    val (literalIndex, literal) = literalForRegister(instructions, before, register) ?: return
    if (literal and FLAG_SECURE == 0) return

    val cleared = literal and FLAG_SECURE.inv()
    replacements[literalIndex] = constValue(register, cleared)
}

private fun literalForRegister(
    instructions: List<Instruction>,
    before: Int,
    register: Int,
): Pair<Int, Int>? {
    var inspected = 0

    for (index in before - 1 downTo 0) {
        val instruction = instructions[index]

        if (instruction is OneRegisterInstruction && instruction.registerA == register) {
            val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral ?: return null
            return index to literal
        }

        if (instruction.opcode in MOVE_RESULT_OPCODES) return null

        if (++inspected >= 8) return null
    }

    return null
}

private fun argumentRegister(instruction: Instruction, argumentIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> when (argumentIndex) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        else -> null
    }

    is RegisterRangeInstruction ->
        (instruction.startRegister + argumentIndex)
            .takeIf { argumentIndex < instruction.registerCount }

    else -> null
}

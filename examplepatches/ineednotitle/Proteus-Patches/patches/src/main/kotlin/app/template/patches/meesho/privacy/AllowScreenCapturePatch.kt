package app.template.patches.meesho.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Allow screenshots / screen recording in Meesho.
//
// Meesho declares DETECT_SCREEN_CAPTURE and shopping/payment flows
// (MyBankActivity, checkout) commonly set FLAG_SECURE on their windows, which
// blacks out screenshots and screen recordings of those screens.
//
// This patch is structural (Meesho ships a new build every few weeks):
//   1. Window.addFlags(FLAG_SECURE / 0x2000)  — clear bit 0x2000 from the
//      literal that populates the flags register; other flag bits preserved.
//   2. Window.setFlags(flags, mask)           — same for both arguments.
//   3. SurfaceView.setSecure(true)            — flip a literal `true` to `false`.
//
// Fail-safe: if the flags are computed dynamically or the argument is not a
// literal, the site is left stock. Opt-in (default = false) because banking/
// payment screens may intentionally protect themselves.

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
val meeshoAllowScreenCapturePatch = bytecodePatch(
    name = "Allow screenshots & screen recording",
    description = "Removes FLAG_SECURE and secure-surface flags from Meesho's windows so " +
        "screenshots and screen recording work. Payment screens may still capture black.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        classDefForEach { classDef ->
            classDef.methods.forEach methodLoop@ { method ->
                val implementation = method.implementation ?: return@methodLoop
                val instructions = implementation.instructions.toList()
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
                                replacements[literal.first] = "const v$valueRegister, 0x0"
                            }
                        }
                    }
                }

                if (replacements.isEmpty()) return@methodLoop

                val mutableMethod = mutableClassDefByOrNull(classDef.type)?.findMutableMethodOf(method)
                    ?: return@methodLoop
                replacements.entries
                    .sortedByDescending { it.key }
                    .forEach { (index, smali) -> mutableMethod.replaceInstruction(index, smali) }
            }
        }
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
    replacements[literalIndex] = "const v$register, ${cleared.smaliHex()}"
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

private fun Int.smaliHex(): String = "0x" + Integer.toHexString(this)

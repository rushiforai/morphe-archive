package app.template.patches.mubi.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Allow screenshots / screen recording in MUBI.
//
// MUBI's player is a DRM surface (Widevine), and Android streamers commonly add
// FLAG_SECURE to the player window. That has two visible effects:
//   • screenshots and screen recordings of the player are black/refused;
//   • mirroring to a TV/PC is blacked out.
// Widevine already protects the decoded frames, so removing the local window
// flag does not expose the raw stream — it only re-enables capture of what the
// device is already allowed to render.
//
// Implementation is deliberately structural rather than fingerprint-based,
// because MUBI ships a new build every 1–3 weeks and both the phone player
// (PlayerActivity) and TV player (TvPlayerActivity) need coverage:
//
//   1. Window.addFlags(FLAG_SECURE / 0x2000)
//      Find every call site, walk backwards to the constant that populates the
//      flags register, and clear bit 0x2000. Other flag bits are preserved.
//
//   2. Window.setFlags(flags, mask)
//      Same treatment for both the flags and the mask argument.
//
//   3. SurfaceView.setSecure(true)
//      ExoPlayer/Media3 can mark the video surface itself as secure. Flip a
//      literal `true` argument to `false` so the surface stays capturable.
//
// All three are fail-safe: if a future build computes the flags dynamically or
// moves them through a register we cannot trace, the site is left untouched and
// the patch simply has no effect there.
private const val FLAG_SECURE = 0x2000
private const val WINDOW_CLASS = "Landroid/view/Window;"
private const val SURFACE_VIEW_CLASS = "Landroid/view/SurfaceView;"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val mubiAllowScreenCapturePatch = bytecodePatch(
    name = "Allow screenshots & screen recording",
    description = "Removes FLAG_SECURE and secure-surface flags from MUBI's players, " +
        "so screenshots, screen recording and screen mirroring work. " +
        "DRM-protected video may still render black on some devices.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

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

/**
 * Clears [FLAG_SECURE] from the literal that populates [register] just before [before].
 */
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

/**
 * Finds the nearest instruction before [before] that writes a literal into [register].
 *
 * Returns null if the register is written by a non-literal instruction, by a
 * move-result, or if the search window is exhausted. This keeps the patch
 * conservative: a wrong guess would change unrelated control flow.
 */
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

private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_OBJECT,
    Opcode.MOVE_RESULT_WIDE,
)

/**
 * Resolves argument [argumentIndex] of an invoke instruction, where 0 is the
 * receiver (for instance calls) and 1 is the first explicit parameter.
 */
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

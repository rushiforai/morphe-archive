package app.template.patches.meesho.player

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

// Stop Meesho's reels/short-video surface from autoplaying.
//
// com.meesho.reel.impl.ui.ReelsActivity (and related reel classes) drive a
// muted player that starts on its own when a reel is focused, via
// Player.setPlayWhenReady(true). The patch is restricted to classes whose
// name contains "reel", so product pages, PDP video and checkout are untouched.
//
// Implementation: find setPlayWhenReady(Z) call sites, walk back to the
// literal populating the argument register, and turn `true` into `false`.
//
// Heuristic (ExoPlayer/Media3 usage in the reel surface was not verifiable
// without the 29.7 APK), so opt-in (default = false). Fail-safe: non-literal
// arguments or absent call sites are left stock; opening a reel manually
// still plays.

private val REEL_OWNER_MARKERS = listOf("reel")

private const val SET_PLAY_WHEN_READY = "setPlayWhenReady"

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
val meeshoDisableReelsAutoplayPatch = bytecodePatch(
    name = "Disable reels autoplay",
    description = "Stops Meesho's reels from autoplaying muted previews. Opening a reel " +
        "still plays normally. Heuristic — verify ExoPlayer anchors against the real APK.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        classDefForEach { classDef ->
            if (REEL_OWNER_MARKERS.none { classDef.type.contains(it, ignoreCase = true) }) {
                return@classDefForEach
            }

            classDef.methods.forEach methodLoop@ { method ->
                val implementation = method.implementation ?: return@methodLoop
                val instructions = implementation.instructions.toList()
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed
                    if (reference.name != SET_PLAY_WHEN_READY || reference.returnType != "V") {
                        return@forEachIndexed
                    }

                    val playRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                    val (literalIndex, literal) = literalForRegister(instructions, index, playRegister)
                        ?: return@forEachIndexed

                    if (literal != 0) {
                        replacements[literalIndex] = "const v$playRegister, 0x0"
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

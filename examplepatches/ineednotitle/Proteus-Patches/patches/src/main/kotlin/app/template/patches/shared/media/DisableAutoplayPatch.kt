// Universal heuristic "Disable video autoplay (ExoPlayer/Media3)" patch.
// Flips literal setPlayWhenReady(true) call sites to false, which stops
// ExoPlayer/Media3 players from starting on their own (news feeds, banners,
// article bodies). No app-specific analysis needed — the method name is a
// stable part of the public ExoPlayer/Media3 API.
//
// Heuristic and opt-in (default = false). What it cannot cover:
//  - reflection-based or obfuscated player setup,
//  - apps that decide to play via non-ExoPlayer paths,
//  - over-flipping: an app whose ONLY play path is the flipped construction
//    call may never start video. If that happens, turn this patch off.
// Unverified on device.
package app.template.patches.shared.media

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

private const val TARGET_METHOD = "setPlayWhenReady"

@Suppress("unused")
val disableAutoplayPatch = bytecodePatch(
    name = "Disable video autoplay (ExoPlayer/Media3)",
    description = """
        Stops ExoPlayer/Media3 players from starting on their own by flipping
        literal 'setPlayWhenReady(true)' call sites to false.

        Applies to any app bundling ExoPlayer/Media3. Heuristic: reflection or
        obfuscated player setup is not covered. Can stop playback entirely in
        apps whose only play path is a flipped literal call — turn it off if
        videos never start. Applies best alongside the per-app Mint/HT entries.
        Unverified on device.
    """.trimIndent(),
    default = false,
) {
    execute {
        var flipped = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.name != TARGET_METHOD || reference.returnType != "V") return@forEachIndexed

                    val valueRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                    val literal = literalForRegister(instructions, index, valueRegister)
                        ?: return@forEachIndexed
                    if (literal.second == 1) {
                        method.replaceInstruction(literal.first, constValue(valueRegister, 0))
                        flipped++
                    }
                }
            }
        }

        logUniversal("Disable video autoplay: flipped $flipped literal setPlayWhenReady(true) call(s).")
    }
}

private fun argumentRegister(instruction: Instruction, argumentIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> when (argumentIndex) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        3 -> instruction.registerF
        4 -> instruction.registerG
        else -> null
    }

    is RegisterRangeInstruction ->
        (instruction.startRegister + argumentIndex)
            .takeIf { argumentIndex < instruction.registerCount }

    else -> null
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
        if (instruction.opcode == Opcode.MOVE_RESULT ||
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT ||
            instruction.opcode == Opcode.MOVE_RESULT_WIDE
        ) return null
        if (++inspected >= 8) return null
    }
    return null
}

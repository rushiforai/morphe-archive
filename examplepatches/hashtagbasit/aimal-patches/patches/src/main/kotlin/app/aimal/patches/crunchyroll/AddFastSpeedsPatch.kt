package app.aimal.patches.crunchyroll

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

@Suppress("unused")
val addFastSpeedsPatch = bytecodePatch(
    name = "Add fast playback speeds",
    description = "Adds 1.25x, 1.5x, 1.75x, and 2.0x playback speed options.",
    default = true,
) {
    compatibleWith(CRUNCHYROLL)

    execute {
        val method = PlayerSettingsViewModelConstructorFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // Find FILLED_NEW_ARRAY for [Ljava/lang/Float; containing 1.0f, 0.75f, 0.5f
        var filledArrayIndex = -1

        for (i in instructions.indices) {
            val inst = instructions[i]
            if (inst.opcode != Opcode.FILLED_NEW_ARRAY) continue

            // Must be a Float array
            val ref = (inst as ReferenceInstruction).reference.toString()
            if (ref != "[Ljava/lang/Float;") continue

            // Verify 0.5f (0x3F000000) appears nearby before this instruction
            val lookBehind = instructions.subList(maxOf(0, i - 12), i)
            val has05f = lookBehind.any { la ->
                la is WideLiteralInstruction && la.wideLiteral.toInt() == 0x3F000000
            }
            if (!has05f) continue

            filledArrayIndex = i
            break
        }

        if (filledArrayIndex == -1) return@execute

        // Find iput-object after filled-new-array (stores the LiveData field)
        var iputIndex = -1
        for (i in filledArrayIndex until minOf(filledArrayIndex + 12, instructions.size)) {
            if (instructions[i].opcode == Opcode.IPUT_OBJECT) {
                iputIndex = i
                break
            }
        }

        if (iputIndex == -1) return@execute

        // Inject after the iput-object: call SpeedHelper to replace the list
        // p0 = this (PlayerSettingsViewModelImpl)
        method.addInstructions(
            iputIndex + 1,
            """
                invoke-static {p0}, Lapp/aimal/extension/crunchyroll/SpeedHelper;->replaceSpeedList(Ljava/lang/Object;)V
            """,
        )
    }
}

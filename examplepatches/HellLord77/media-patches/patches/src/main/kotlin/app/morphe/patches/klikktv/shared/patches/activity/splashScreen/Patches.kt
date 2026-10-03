package app.morphe.patches.klikktv.shared.patches.activity.splashScreen

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.toInt
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

val isUpdateAvailableFieldAccessPatch = bytecodePatch {
    execute {
        IsUpdateAvailableFieldAccessFingerprint.matchAllMethodIndicesForEach {
            val instruction = getInstruction<TwoRegisterInstruction>(it)

            replaceInstruction(
                it, BuilderInstruction11n(
                    Opcode.CONST_4,
                    instruction.registerA,
                    false.toInt(),
                )
            )
        }
    }
}
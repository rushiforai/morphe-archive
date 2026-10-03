package app.morphe.patches.klikk.shared.patches.ui.activity.newDetailsAndDownloadActivity

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.toInt
import app.morphe.util.matchAllMethodIndicesForEach
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

val deviceCheckFieldAccessPatch = bytecodePatch {
    execute {
        DeviceCheckFieldAccessFingerprint.matchAllMethodIndicesForEach {
            val instruction = getInstruction<TwoRegisterInstruction>(it)

            replaceInstruction(
                it, BuilderInstruction11n(
                    Opcode.CONST_4,
                    instruction.registerA,
                    true.toInt(),
                )
            )
        }
    }
}

val isDownloadLimitExceededPatch = bytecodePatch {
    execute {
        IsDownloadLimitExceededFingerprint.matchSingle().method.returnEarly(false)
    }
}
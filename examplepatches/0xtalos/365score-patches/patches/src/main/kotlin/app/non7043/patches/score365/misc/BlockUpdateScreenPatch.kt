package app.non7043.patches.score365.misc

import app.non7043.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private object BaseActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActivity;",
    name = "onCreate",
    strings = listOf("ForceUpdateDialog"),
)

private object BaseActionBarActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActionBarActivity;",
    name = "onCreate",
    strings = listOf("ForceUpdateDialog"),
)

/**
 * Blocks the "update required" / "this app is out of date" dialog from being shown on launch
 * by defusing the "ForceUpdateDialog" and "NewVersionPopup" intent checks.
 */
@Suppress("unused")
val blockUpdateScreenPatch = bytecodePatch(
    name = "Block update screen",
    description = "Blocks the 'This app is out of date' update screen and popup on launch.",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        val targets = listOf(
            BaseActivityOnCreateFingerprint,
            BaseActionBarActivityOnCreateFingerprint,
        )

        for (target in targets) {
            val method = target.methodOrNull ?: continue
            if (method.implementation == null) continue
            for (instruction in method.instructions) {
                if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                    val ref = (instruction as? Instruction21c)?.reference as? StringReference
                    val stringValue = ref?.string
                    if (stringValue == "ForceUpdateDialog") {
                        val register = instruction.registerA
                        method.replaceInstruction(
                            instruction.location.index,
                            "const-string v$register, \"DisabledForceUpdate\"",
                        )
                    } else if (stringValue == "NewVersionPopup") {
                        val register = instruction.registerA
                        method.replaceInstruction(
                            instruction.location.index,
                            "const-string v$register, \"DisabledNewVersionPopup\"",
                        )
                    }
                }
            }
        }
    }
}

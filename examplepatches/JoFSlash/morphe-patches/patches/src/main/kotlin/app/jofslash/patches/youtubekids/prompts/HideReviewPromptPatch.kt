package app.jofslash.patches.youtubekids.prompts

import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The home screen decides here whether to show the in-app "rate the app" card: not when the
// intent turns it off, nor when the app_rated preference says the app was rated.
internal object AppReviewCheckFingerprint : Fingerprint(
    strings = listOf(
        "com.google.android.apps.youtube.kids.activities.AutoAppReviewFlowEnabled",
        "app_rated",
    ),
)

@Suppress("unused")
val hideReviewPromptPatch = bytecodePatch(
    name = "Hide review prompt",
    description = "Stops the card that asks to rate YouTube Kids from popping up, as if the app was rated already.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    execute {
        AppReviewCheckFingerprint.method.apply {
            val list = instructions.toList()
            val rated = list.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                        ((it as ReferenceInstruction).reference as StringReference).string == "app_rated"
            }
            val getBoolean = (rated until list.size).firstOrNull { i ->
                val reference = (list[i] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/content/SharedPreferences;" && reference.name == "getBoolean"
            } ?: throw PatchException("Couldn't find the app_rated check")
            val moveResult = getBoolean + 1
            if (list[moveResult].opcode != Opcode.MOVE_RESULT) throw PatchException("Unexpected app_rated check")
            val register = getInstruction<OneRegisterInstruction>(moveResult).registerA
            // app_rated is always true.
            addInstruction(moveResult + 1, "const/4 v$register, 0x1")
        }
    }
}

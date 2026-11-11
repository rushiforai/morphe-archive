package semicoloncolonel.mobilestream.patches.kanopy.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.kanopy.shared.Constants

// Kanopy 6.32.0. The More tab lists "Take Our Survey" unless the survey was
// submitted in the last 30 days. When it builds the list, it reads the
// NPS_SURVEY_SUBMITTED_TIME preference. That read now returns the largest
// possible time, which counts as just submitted, so the row is never added.
// The saved preference is not changed.

internal object MoreMenuItemsFingerprint : Fingerprint(
    definingClass = "Lcom/kanopy/ui/more/MoreFragment;",
    strings = listOf("NPS_SURVEY_SUBMITTED_TIME"),
)

@Suppress("unused")
val hideSurveyPatch = bytecodePatch(
    name = "Hide survey",
    description = "Removes \"Take Our Survey\" from the More tab.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        MoreMenuItemsFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val getLong = instructions.indexOfFirst { insn ->
                val reference = (insn as? ReferenceInstruction)?.reference as? MethodReference
                insn.opcode == Opcode.INVOKE_INTERFACE &&
                    reference?.definingClass == "Landroid/content/SharedPreferences;" &&
                    reference.name == "getLong"
            }
            val result = instructions.getOrNull(getLong + 1)
            if (getLong < 0 || result?.opcode != Opcode.MOVE_RESULT_WIDE) {
                throw PatchException("Survey time check not found")
            }
            val register = (result as OneRegisterInstruction).registerA
            addInstruction(getLong + 2, "const-wide v$register, 0x7fffffffffffffffL")
        }
    }
}

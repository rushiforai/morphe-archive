package semicoloncolonel.mobilestream.patches.moviesanywhere.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.moviesanywhere.shared.Constants

// Movies Anywhere 1.54.0 shows its pop-ups through Braze in-app messages. The
// app's own listener (an IInAppMessageManagerListener the app registers with
// Braze) decides, in beforeInAppMessageDisplayed, what to do with each one:
//
//   - A message whose extras carry an "override" key is a command, not a
//     pop-up. One value re-links a retailer account after a VPPA consent check
//     and is left alone. Another asks Google Play for the rating sheet. The
//     Rating prompt option returns before that request.
//   - Every other message is a marketing pop-up, shown as is. The Marketing
//     messages option discards them with Braze's own DISCARD.
//
// Google Play's review classes are renamed in this build, so the shared
// rating-sheet blocker has no call to match.

private const val OPERATION = "Lcom/braze/ui/inappmessage/InAppMessageOperation;"
private const val IN_APP_MESSAGE = "Lcom/braze/models/inappmessage/IInAppMessage;"

internal object BeforeInAppMessageDisplayedFingerprint : Fingerprint(
    name = "beforeInAppMessageDisplayed",
    returnType = OPERATION,
    parameters = listOf(IN_APP_MESSAGE),
    strings = listOf("Requesting review prompt"),
)

@Suppress("unused")
val hidePromptsAndPopupsPatch = bytecodePatch(
    name = "Hide prompts and pop-ups",
    description = "Hides the prompts and pop-ups you choose in the patch options.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    val rating by booleanOption(
        key = "rating",
        default = true,
        title = "Rating prompt",
        description = "Stops the Google Play rating prompt.",
    )
    val marketing by booleanOption(
        key = "marketingPopUps",
        default = true,
        title = "Marketing pop-ups",
        description = "Hides the app's promotional pop-ups. The retailer re-link prompt still shows.",
    )

    execute {
        val method = BeforeInAppMessageDisplayedFingerprint.method

        // First, so the index found below still holds after the insert at 0.
        if (rating == true) {
            val instructions = method.implementation!!.instructions.toList()
            val index = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    ((instruction as ReferenceInstruction).reference as StringReference).string ==
                    "Requesting review prompt"
            }
            if (index < 0) throw PatchException("Hide prompts and pop-ups: review request not found")
            // The log message's register is free here; reuse it for the answer.
            val register = (instructions[index] as OneRegisterInstruction).registerA
            method.addInstructions(
                index,
                """
                    sget-object v$register, $OPERATION->DISCARD:$OPERATION
                    return-object v$register
                """,
            )
        }

        if (marketing == true) {
            // v0 and v1 are locals the method sets before it reads them.
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-interface/range { p1 .. p1 }, $IN_APP_MESSAGE->getExtras()Ljava/util/Map;
                    move-result-object v0
                    const-string v1, "override"
                    invoke-interface { v0, v1 }, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
                    move-result v0
                    if-nez v0, :msp_keep
                    sget-object v0, $OPERATION->DISCARD:$OPERATION
                    return-object v0
                """,
                ExternalLabel("msp_keep", method.getInstruction(0)),
            )
        }
    }
}

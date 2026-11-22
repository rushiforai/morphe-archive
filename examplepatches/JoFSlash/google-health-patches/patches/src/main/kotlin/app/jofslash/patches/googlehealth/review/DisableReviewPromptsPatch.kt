package app.jofslash.patches.googlehealth.review

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

// Play Core's ReviewManager.launchReviewFlow(activity, reviewInfo). The class keeps its name; the
// method doesn't.
internal object LaunchReviewFlowFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/play/core/review/ReviewManagerImpl;",
    parameters = listOf("Landroid/app/Activity;", "Lcom/google/android/play/core/review/ReviewInfo;"),
)

@Suppress("unused")
val disableReviewPromptsPatch = bytecodePatch(
    name = "Disable review prompts",
    description = "Stops the app from asking you to rate it on Google Play.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        val method = LaunchReviewFlowFingerprint.method
        // When the review was already shown, Play Core returns a finished task without opening
        // the dialog. Take that path every time. The first static call builds the finished task.
        val finishedTask = method.implementation!!.instructions.first { it.opcode == Opcode.INVOKE_STATIC }
        val reference = (finishedTask as ReferenceInstruction).reference
        method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static { v0 }, $reference
                move-result-object v0
                return-object v0
            """
        )
    }
}

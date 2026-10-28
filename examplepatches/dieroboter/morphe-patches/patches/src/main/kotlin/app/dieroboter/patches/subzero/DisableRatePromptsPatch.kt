package app.dieroboter.patches.subzero

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_GEOMETRY_DASH_SUBZERO

/**
 * Candidate 6: disable the in-app rate prompt.
 *
 * AppRater.tryShowRateDialog is the launch-counted gate behind the
 * "Thanks for playing!" rate dialog; its only caller is a delayed Runnable
 * posted from BaseRobTopActivity.onCreate. Making the gate itself a no-op
 * means the prompt never shows, while the explicit rate action
 * (BaseRobTopActivity$3.run -> openRate) stays intact. Same technique as
 * the GIF Maker bundle's "Disable rate prompts" patch.
 */
@Suppress("unused")
val disableRatePromptsPatch = bytecodePatch(
    name = "Disable rate prompts",
    description = "Makes AppRater.tryShowRateDialog a no-op, so the " +
        "'Thanks for playing!' rate prompt never shows. The explicit rate " +
        "action is untouched.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GEOMETRY_DASH_SUBZERO)

    execute {
        AppRaterTryShowRateDialogFingerprint.method.addInstructions(0, "return-void")
    }
}

package app.asana.patches.login

import app.asana.patches.shared.Constants.COMPATIBILITY_ASANA_REBEL
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipLoginPatch = bytecodePatch(
    name = "Skip sign up and login",
    description = "Lands on the home screen instead of the onboarding funnel: the app keeps using " +
        "the anonymous guest account it already creates in the background.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ASANA_REBEL)

    execute {
        val method = GoToOnboardingFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("goToLoginGetStarted has no implementation")

        // Replace the whole body: start the home activity as `goHome(context, null, null)` does,
        // instead of starting OnboardingActivity.
        implementation.removeInstructions(implementation.instructions.size)
        method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-virtual {p0, p1, v0, v0}, Lcom/asanayoga/asanarebel/NavigatorImpl;->goHome(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """
        )
    }
}

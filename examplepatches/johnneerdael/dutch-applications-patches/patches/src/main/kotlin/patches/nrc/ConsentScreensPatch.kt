package patches.nrc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Skips automatic Didomi UI and the first guest login welcome through its original Skip completion; preserves existing consent, accounts and manual privacy/login choices.") {
    compatibleWith(nrc)
    dependsOn(originalInput, disableTracking)
    execute {
        val automatic = exact(CONSENT, "showWhenNeeded", "V", "Landroidx/fragment/app/FragmentActivity;", "Lnl/pinch/nrc/analytics/params/ConsentScreen;")
        exact(CONSENT, "b", "V")
        exact(CONSENT, "c", "V", "Lio/didomi/sdk/Didomi;", CONSENT)
        automatic.method.addInstructions(0, """
            invoke-direct {p0}, $CONSENT->b()V
            return-void
        """.trimIndent())
        skipDefaultWelcome()
    }
}

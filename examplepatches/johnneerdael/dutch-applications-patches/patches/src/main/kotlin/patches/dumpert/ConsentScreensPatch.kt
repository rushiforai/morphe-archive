package patches.dumpert

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Skips automatic Didomi advertising-choice UI without granting consent. Includes ad and tracking controls; manual privacy settings and readiness callbacks remain available.") {
    dependsOn(originalInput, disableTracking)
    compatibleWith(dumpert)
    execute {
        change("${APP}consent/DidomiConsentManagerImpl;", "setupConsentUI(Landroidx/fragment/app/FragmentActivity;)V", STOP)
    }
}

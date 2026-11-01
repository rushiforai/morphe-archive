package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips automatic privacy and notification/account offers as a guest while keeping topic selection, manual settings and consent choices.",
) {
    dependsOn(originalInput)
    compatibleWith(nunl)
    dependsOn(disableTracking)
    execute {
        skipOptionalOnboarding()
        // Automatic refresh returns Unit. Manual ConsentTarget uses resurfacePrivacyGate, which stays intact.
        // SDK openPrivacyGate owns a suspended callback and must not be no-oped.
        exact("Lnl/nu/android/consent/privacygate/PrivacyGateService;", "refreshConsent", "Ljava/lang/Object;", "Landroid/app/Activity;", "Ljava/lang/String;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0")
    }
}

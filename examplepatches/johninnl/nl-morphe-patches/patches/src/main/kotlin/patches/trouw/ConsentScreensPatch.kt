package patches.trouw

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Completes automatic consent refresh without opening the advertising choice screen or writing acceptance; automatically finishes first-launch login, welcome and notification setup with fresh subscriptions off; manual privacy, account and notification settings remain available.") {
    dependsOn(originalInput)
    compatibleWith(trouw)
    dependsOn(disableTracking)
    execute {
        skipOnboardingPrompts()
        change("Lnl/persgroep/feature/component/privacy/domain/ConsentManagerImpl;", "refreshConsent(Landroid/app/Activity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", UNIT)
    }
}

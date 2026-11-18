package patches.hbvl

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Skips automatic consent and PayOrOk screens and persists normal onboarding completion without recording consent.") {
    dependsOn(originalInput)
    compatibleWith(hbvl)
    dependsOn(disableTracking)
    execute {
        completeOnboarding()
        change("Lbe/mediahuis/core/domain/services/consent/ConsentService;", "collectConsentIfNeeded(Landroidx/appcompat/app/AppCompatActivity;)V", STOP)
        change("Lbe/mediahuis/core/domain/services/consent/AccountConsentService;", "updateAccountConsentInfo(Ljava/lang/String;Ljava/lang/String;)V", STOP)
        change("Lbe/mediahuis/one/domain/usecases/navigation/DefaultNavigateToPayOrOkUseCase;", "execute(Landroidx/navigation/NavController;)V", STOP)
        change("Lbe/mediahuis/one/ui/MainActivity;", "showCoachMark()V", STOP)
    }
}

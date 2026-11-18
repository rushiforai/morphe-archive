package patches.ad

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Skips automatic consent, startup login and topic-notification prompts. Defaults to guest reading and manual notification opt-in while retaining city selection, saved choices and manual login/privacy controls.") {
    compatibleWith(ad)
    dependsOn(originalInput, hideAds, disableTracking)
    execute {
        change("Lbe/dpgmedia/privacy/privacygatesdk/ConsentService;", "collectConsent(Landroid/app/Activity;Ljava/lang/String;Lbe/dpgmedia/privacy/privacygatesdk/OpenModalOptions;Ljava/lang/String;Lxs3;)Ljava/lang/Object;", UNIT)
        skipOnboardingPrompts()
    }
}

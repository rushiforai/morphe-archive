package patches.hln

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Skips automatic consent, startup login and topic-notification prompts. Defaults to guest reading and manual notification opt-in while retaining city selection, saved choices and manual login/privacy controls.") {
    compatibleWith(hln)
    dependsOn(originalInput, hideAds, disableTracking)
    execute {
        change("Lbe/dpgmedia/privacy/privacygatesdk/ConsentService;", "collectConsent(Landroid/app/Activity;Ljava/lang/String;Lbe/dpgmedia/privacy/privacygatesdk/OpenModalOptions;Ljava/lang/String;Lzs3;)Ljava/lang/Object;", UNIT)
        // This leaf owns only the recommendation permission warning. Keep its
        // caller's authentic consent decision and recommendation request guard.
        change("Lhaj;", "h(ILtg3;Lt07;Lk8b;)V", STOP)
        skipOnboardingPrompts()
    }
}

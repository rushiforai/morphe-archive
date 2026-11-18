package patches.vi

import app.morphe.patcher.patch.bytecodePatch

internal val consentTargets = listOf(
    OwnedMethod("Lnl/vi/ads/data/google_consent/GoogleConsent;", "requestForConsent(Landroid/app/Activity;)V", 17, 5, 10, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf(
            "const-string v0, \"activity\"",
            "invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V",
            "invoke-direct {p0, p1}, Lnl/vi/ads/data/google_consent/GoogleConsent;->showAgeGateDialogIfNeeded(Landroid/app/Activity;)V",
            "return-void")),
    )),
    OwnedMethod("Lnl/vi/ads/data/google_consent/GoogleConsent;", "forceLoadForm(Landroid/app/Activity;Lnl/vi/ads/data/google_consent/GoogleConsentFormDialogCallback;)V", 17, 4, 13, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf(
            "const-string v0, \"activity\"",
            "invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V",
            "const-string v0, \"googleConsentFormDialogCallback\"",
            "invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V",
            "const/4 v0, 0x0",
            "sput-boolean v0, Lnl/vi/ads/data/google_consent/GoogleConsent;->isLoadingForm:Z",
            "invoke-interface {p2}, Lnl/vi/ads/data/google_consent/GoogleConsentFormDialogCallback;->onDialogDismissed()V",
            "return-void")),
    )),
)

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Stops startup and manually reopened advertising-consent forms before display, without inventing a consent choice. Preserves the app's age check for betting features.",
) {
    dependsOn(disableTracking)
    compatibleWith(vi)
    execute { applyOwnedEdits(consentTargets) }
}

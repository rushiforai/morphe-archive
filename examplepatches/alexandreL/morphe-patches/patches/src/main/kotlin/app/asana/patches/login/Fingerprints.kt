package app.asana.patches.login

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * `NavigatorImpl.goToLoginGetStarted()` is where the splash screen hands the user over to the
 * first-run flow. It always starts `OnboardingActivity`, which is the sign up / login funnel.
 *
 * ```
 * .method public goToLoginGetStarted(Landroidx/appcompat/app/AppCompatActivity;)V
 *     const-string v0, "activityContext"
 *     invoke-static {v0, p1}, Lkotlin/jvm/internal/k;->f(Ljava/lang/String;Ljava/lang/Object;)V
 *     const/4 v0, 0x0
 *     new-array v0, v0, [Lkotlin/Pair;
 *     const-class v1, Lcom/asanayoga/asanarebel/ui/onboarding/OnboardingActivity;
 *     invoke-static {p1, v1, v0}, Lcom/asanayoga/asanarebel/core/utils/ViewExtKt;->internalStartActivity(...)
 *     return-void
 * .end method
 * ```
 *
 * Both the `LoggedOutUser` branch (a guest account is created first) and the `GuestUser` branch
 * of `SplashScreenPresenter$bootstrap` end up here, so redirecting this single method skips the
 * whole funnel without touching the coroutine state machine.
 */
object GoToOnboardingFingerprint : Fingerprint(
    definingClass = "Lcom/asanayoga/asanarebel/NavigatorImpl;",
    name = "goToLoginGetStarted",
    returnType = "V",
    parameters = listOf("Landroidx/appcompat/app/AppCompatActivity;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/asanayoga/asanarebel/core/utils/ViewExtKt;",
            name = "internalStartActivity"
        )
    )
)

/**
 * `RootViewModel.checkGDPRStatus()` opens the privacy consent screen when the account does not
 * have `privacyPolicy && termsOfService` set. A brand new guest account is exactly that case,
 * so it would otherwise block the freshly unlocked home screen.
 */
object GdprStatusFingerprint : Fingerprint(
    definingClass = "Lcom/asanayoga/asanarebel/ui/root/RootViewModel;",
    name = "checkGDPRStatus",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/asanayoga/asanarebel/user/domain/model/UserDomainModel;",
            name = "getPrivacyPolicy"
        )
    )
)

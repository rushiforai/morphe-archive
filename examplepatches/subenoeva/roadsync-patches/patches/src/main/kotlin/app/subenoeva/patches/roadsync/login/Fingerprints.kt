package app.subenoeva.patches.roadsync.login

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `OnboardingLoginBlockerScreen.shouldBeDisplayed()`.
 *
 * RoadSync gates the whole app behind a chain of "blocker" screens; this one forces the
 * Terms of Service / Privacy / Services consent / Google sign-in flow whenever the server
 * preference reports `needsLogin`. Its body is:
 *
 * ```
 * Timber.a("shouldBeDisplayed(): needsLogin=" + serverPreference.needsLogin())
 * return serverPreference.needsLogin() && recoveringPreference.isRecovering()
 * ```
 *
 * Member names are R8-obfuscated (the method is emitted as `e()Z`), so the match anchors on the
 * unique log literal rather than on the method name.
 */
internal object LoginBlockerShouldDisplayFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/blocker/screens/OnboardingLoginBlockerScreen;",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("shouldBeDisplayed(): needsLogin="),
)

/**
 * `RidingModeViewModel$tokenListener$1$onTokenChanged$1.invokeSuspend()`.
 *
 * The ride-mode view model registers a token listener; when Firebase reports an empty token
 * (i.e. no valid session) this suspend body runs and:
 *
 * ```
 * SignInUtils.logSignInError(IllegalStateException("token is empty."))
 * serverPreference.setNeedsLogin(true)                       // re-arms the login blocker
 * authState.setValue(AuthState.TokenNotAvailable)            // makes the activity re-launch sign-in
 * ```
 *
 * Both side effects have to be suppressed for the app to stay on the ride screen without a
 * session. The lambda class name is stable; the match anchors on the unique `"token is empty."`
 * literal so it survives member renaming.
 */
internal object TokenEmptyHandlerFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/ridemode/RidingModeViewModel\$tokenListener\$1\$onTokenChanged\$1;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("token is empty."),
)

/**
 * `RidingModeOffViewModel$tokenListener$1$onTokenChanged$1.invokeSuspend()`.
 *
 * Same handler as [TokenEmptyHandlerFingerprint], but on the "riding mode off" screen (shown when
 * no motorcycle is connected). Its activity, [RidingModeOffActivity], observes the same
 * `AuthState.TokenNotAvailable` and re-launches Google Sign-In, so this copy has to be neutralized
 * too or the app re-prompts on the disconnected screen. Both classes hold the identical
 * `"token is empty."` literal; the distinct `definingClass` keeps the two matches apart.
 */
internal object TokenEmptyHandlerOffFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/ridemode/RidingModeOffViewModel\$tokenListener\$1\$onTokenChanged\$1;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("token is empty."),
)

/**
 * `OnboardingLoginFragment.onViewCreated(View, Bundle)`.
 *
 * On a fresh install the login screen is shown by the first-run onboarding flow
 * (`HomeActivity` -> `OnboardingActivity` -> this fragment), NOT by the blocker system, so
 * [LoginBlockerShouldDisplayFingerprint] does not cover it. The fragment's view model already has a
 * `skipSignIn()` method (`E0()`, wired to a debug-only "button_skip" that release builds never
 * render); it advances onboarding to the consent step with no server call. This fingerprint locates
 * `onViewCreated` so the patch can invoke that skip as soon as the screen appears.
 *
 * `onViewCreated` is an Android framework override, so its name is not obfuscated; the match anchors
 * on the class plus the exact `(View, Bundle)` signature.
 */
internal object OnboardingLoginAutoSkipFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sab/onboarding/setup/login/OnboardingLoginFragment;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

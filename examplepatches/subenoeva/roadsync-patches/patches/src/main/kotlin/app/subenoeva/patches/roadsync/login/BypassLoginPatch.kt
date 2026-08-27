package app.subenoeva.patches.roadsync.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.subenoeva.patches.shared.Constants.COMPATIBILITY_ROADSYNC

/**
 * Lets RoadSync run without signing in with Google.
 *
 * ## Why this exists
 *
 * Patching RoadSync re-signs the APK, which changes its signing certificate. Google Sign-In
 * validates the calling app's package name plus signing SHA-1 against the OAuth client Honda
 * registered in their Firebase project, so a re-signed build can never obtain a token
 * (`ApiException 10, DEVELOPER_ERROR`). Without a token the app is stuck on the login screen.
 *
 * ## What it does
 *
 * The motorcycle controls (BLE link to the instrument cluster, and the local
 * `call` / `music` / `navigation` / `message` / `volume` pages) do **not** check auth at runtime:
 * [app.subenoeva.patches.roadsync.login.TokenEmptyHandlerFingerprint] shows the ride-mode
 * connection starts regardless of the token. This patch removes the two places that force login:
 *
 * 1. [LoginBlockerShouldDisplayFingerprint] — the login blocker never reports that it should be
 *    displayed, so onboarding skips the Terms / Privacy / Services-consent / Google sign-in flow.
 * 2. [TokenEmptyHandlerFingerprint] — the "token is empty" handler becomes a no-op, so the ride
 *    screen stops re-arming `needsLogin` and stops re-launching Google Sign-In every time it sees
 *    no session.
 *
 * ## What it does NOT fix
 *
 * Anything that reaches Honda's server still fails, because those gRPC calls send an empty
 * `Authorization: Bearer` and the server rejects them. Most of that is irrelevant to riding
 * (account, trip history, analytics, weather), but **pairing a brand-new motorcycle** downloads
 * the vehicle model catalog and setup pages from that same server
 * (`ModelApi` over `ServiceGrpc`). Whether pairing works therefore depends on whether Honda's
 * backend returns the catalog for an unauthenticated request:
 *
 * - If it does, pairing completes, a `KnownVehicle` is written to the local Room database, and the
 *   controls work with no account.
 * - If it requires a valid user token, the model list comes back empty / `UNAUTHENTICATED` and the
 *   "select model" step cannot proceed. Reaching the controls then needs a vehicle that was already
 *   paired (i.e. transplanting the app's database from a signed-in stock install), which this patch
 *   cannot do on its own.
 *
 * A motorcycle that is already paired in this build connects straight away and needs none of the
 * above.
 *
 * On by default: re-signing always breaks Google Sign-In, so an unmodified patched build would
 * otherwise be stuck on the login screen for everyone. Disable it in the patch options if you have
 * a build whose signature Honda's project still accepts and you want the real account features.
 */
@Suppress("unused")
val bypassGoogleLoginPatch = bytecodePatch(
    name = "Bypass Google login",
    description = "Lets RoadSync reach the motorcycle controls without a Google account. Server " +
        "features (account, trip history, weather) stay unavailable, and pairing a new motorcycle " +
        "still depends on Honda's server accepting an unauthenticated request.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ROADSYNC)

    execute {
        // shouldBeDisplayed() -> return false, so the login blocker never fires.
        LoginBlockerShouldDisplayFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // invokeSuspend() -> return the received result immediately, skipping setNeedsLogin(true)
        // and authState = TokenNotAvailable. The coroutine is launched fire-and-forget, so the
        // returned value is discarded; returning the parameter (p1) avoids referencing the
        // R8-renamed Kotlin `Unit.INSTANCE` field and keeps the patch register-count agnostic.
        //
        // Both the active ride screen and the "riding mode off" (disconnected) screen carry an
        // identical handler and an activity that re-launches sign-in on TokenNotAvailable, so both
        // are neutralized.
        listOf(TokenEmptyHandlerFingerprint, TokenEmptyHandlerOffFingerprint).forEach {
            it.method.addInstructions(0, "return-object p1")
        }

        // First-run onboarding shows the login screen directly (HomeActivity -> OnboardingActivity
        // -> OnboardingLoginFragment), NOT through the blocker patched above. Invoke the app's own
        // skipSignIn() (E0) at the very start of onViewCreated: it sets the onboarding state to
        // CONSENT and posts goToNextEvent with no server call, and the observer this same method
        // registers delivers it once the view lifecycle reaches STARTED, navigating past login.
        //
        // The call MUST go in at index 0. `this` lives in register p0 only at method entry; R8
        // reuses that physical register later in the body to hold an Observer lambda, so injecting
        // near the return makes the verifier see p0 as SabFragment$sam$...$Observer$0 and reject the
        // class (VerifyError -> crash). b0() is the PRIVATE FINAL view-model getter (invoke-direct).
        OnboardingLoginAutoSkipFingerprint.method.addInstructions(
            0,
            """
                invoke-direct { p0 }, Lcom/drivemode/sab/onboarding/setup/login/OnboardingLoginFragment;->b0()Lcom/drivemode/sab/onboarding/setup/login/OnboardingLoginViewModel;
                move-result-object v0
                invoke-virtual { v0 }, Lcom/drivemode/sab/onboarding/setup/login/OnboardingLoginViewModel;->E0()V
            """,
        )
    }
}

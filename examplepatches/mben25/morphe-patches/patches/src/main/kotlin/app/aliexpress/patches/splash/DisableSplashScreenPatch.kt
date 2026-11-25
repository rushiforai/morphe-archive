package app.aliexpress.patches.splash

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `home/splash/a0.d0(FragmentActivity)Z` — "tryShowScreen": looks up a scheduled launch-screen
 * ad (splash/brand screen) and shows it, returning true when it did. The SplashPresenter
 * (`home/ui/s0.c`) handles false itself (resets its showing flag, re-enables the tab bar), so
 * no ad callback is needed for launch to continue.
 *
 * The original patch stubbed `felin/core/splash/SplashView`, which nothing outside its own
 * package calls anymore, so it had no effect.
 */
internal object TryShowSplashScreenFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;"),
    strings = listOf("tryShowScreen, getNeedToShowScreen cost: "),
)

@Suppress("unused")
val disableSplashScreenPatch = bytecodePatch(
    name = "Disable splash screen",
    description = "Skips the full-screen splash advertisement shown on app launch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        // `.locals 9`.
        TryShowSplashScreenFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}

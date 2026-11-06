package semicoloncolonel.mobilestream.patches.newsbreak.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants

// NewsBreak 26.44.1. Opening the My Town tab shows a "Meet My Town" pop-up
// with a Get Started button, and the tab gets a "Discover My Town" tooltip
// and a "new" badge. Each asks MyTownNativeOnboardingState whether it is due;
// those checks now say no. My Town itself works as before.

private const val ONBOARDING = "Lcom/particlemedia/feature/mytown/MyTownNativeOnboardingState;"

internal object ShouldShowMyTownWelcomeFingerprint : Fingerprint(
    definingClass = ONBOARDING,
    name = "shouldShowWelcome",
    returnType = "Z",
    parameters = listOf(),
)

internal object ShouldShowMyTownTabGuideFingerprint : Fingerprint(
    definingClass = ONBOARDING,
    name = "shouldShowTabOnboarding",
    returnType = "Z",
    parameters = listOf(),
)

internal object ShouldShowMyTownBadgeFingerprint : Fingerprint(
    definingClass = ONBOARDING,
    name = "shouldShowNewBadge",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hideMyTownIntroPatch = bytecodePatch(
    name = "Hide My Town intro",
    description = "Removes the \"Meet My Town\" pop-up, the My Town tooltip, and the tab's \"new\" badge.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        listOf(
            ShouldShowMyTownWelcomeFingerprint,
            ShouldShowMyTownTabGuideFingerprint,
            ShouldShowMyTownBadgeFingerprint,
        ).forEach { it.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
    }
}

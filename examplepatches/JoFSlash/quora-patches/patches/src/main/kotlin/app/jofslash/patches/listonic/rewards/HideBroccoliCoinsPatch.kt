package app.jofslash.patches.listonic.rewards

import app.jofslash.patches.listonic.premium.PROFILE_CAROUSEL
import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.dropAddsOfConstant
import app.jofslash.patches.listonic.shared.hideComposable
import app.jofslash.patches.listonic.shared.methodWithStrings
import app.morphe.patcher.patch.bytecodePatch

// The coins button with the coin count in the top bars of the lists and of each list.
private const val COINS_BUTTON =
    "com.l.shared.ui.rewards.components.BroccoliCoinsNavButton (BroccoliCoinsCountBadge.kt:38)"

@Suppress("unused")
val hideBroccoliCoinsPatch = bytecodePatch(
    name = "Hide Broccoli coins",
    description = "Hides the Broccoli coins button in the top bars and the Broccoli coins card on the profile " +
            "screen, for when you don't collect coins for ads. Coins you have stay in your account.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        hideComposable(COINS_BUTTON)

        // The profile's cards: leave out the "Broccoli coins, Unlock rewards!" card.
        methodWithStrings(PROFILE_CAROUSEL).dropAddsOfConstant("Rewards")
    }
}

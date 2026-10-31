package dev.hyzor.patches.nytgames.subscription

import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.nytgames.shared.Constants.NYT_GAMES
import dev.hyzor.patches.util.returnEarly

/**
 * NYT Games does not verify the subscription receipt in the games code. It reads the subauth
 * library's local user state, and the one bit that drives every subscription decision is
 * `SubauthEntitlementClientImpl.P()` (`isSubscribedForGames`), which returns
 * `NYTUserState.f` = `UserData.hasActiveEntitlement(Games)`.
 *
 * Everything downstream reads that value:
 *
 *   `AppEntitlementsImpl.e()` -> `UserEntitlements.statusFlow` -> `EntitlementStatus`
 *        -> `GameAvailabilityCalculator` (puzzles, archives), bonus puzzle paywall, home banners
 *   `AppEntitlementsImpl.e()` -> `GamesHybridUserConfig.isSubscribed` -> the hybrid WebView games
 *   `GamesSubauth2PurchaseClientImpl.d()`, `SubauthClientImpl.P()` -> ads targeting, analytics
 *
 * `NYTUserState.e` (signed in) and `NYTUserState.g` (linked) are deliberately left alone. Forcing
 * them changes `NYTUserImpl.d()` to `REGISTERED_SUBSCRIBED_LINKED`, which makes the app try to
 * load a profile without a real session and is what breaks the Me page ("Oops, something went
 * wrong") in the reference patch.
 *
 * This is the same hook as rushiranpise/morphe-patches' 6.33.0 patch. Its `r()` no longer exists
 * in 6.48.0: the delegate chain was flattened and the equivalent isSubscribed bit is `P()`.
 */
@Suppress("unused")
val unlockSubscriptionPatch = bytecodePatch(
    name = "Unlock Subscription",
    description = "Reports the account as an active Games subscriber, unlocking subscriber-only archives and bonus puzzles. " +
        "Client side only; the backend may still refuse some content.",
    default = true,
) {
    compatibleWith(NYT_GAMES)

    execute {
        IsSubscribedFingerprint.method.returnEarly(true)
    }
}

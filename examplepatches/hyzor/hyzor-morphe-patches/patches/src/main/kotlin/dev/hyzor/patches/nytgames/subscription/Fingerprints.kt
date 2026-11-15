package dev.hyzor.patches.nytgames.subscription

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * `SubauthEntitlementClientImpl.P()Z` — `isSubscribedForGames()` in 6.50.0.
 *
 * The class itself is not obfuscated (`com.nytimes.games.integrations.subauth.library` is the
 * app's own subauth bridge), but every method in it is one letter. The no-argument booleans the
 * app builds its entitlement state from are:
 *
 *   `D()`  `isSubscribedAndLinked`      `NYTUserImpl.d()` == `REGISTERED_SUBSCRIBED_LINKED`
 *   `J()`  `isSubscribedViaGooglePlay`  Google Play entitlements contain `Games`
 *   `P()`  `isSubscribedForGames`       `NYTUserState.f` (`UserData.hasActiveEntitlement`)
 *   `R()`  `hasUnlinkedSubscription`    `SubscriptionLevel` is anonymous/unlinked subscriber
 *
 * The names are not guessed: `SubauthShowGamesUserStatePreference` prints `P()`/`D()`/`R()`/`J()`
 * next to exactly those labels in the in-app developer settings, and the subscription flag used
 * by the rest of the app (`AppEntitlementsImpl.e()` -> `SubauthRxJavaClientImpl.i()` ->
 * `GamesSubauth2PurchaseClientImpl.d()`) delegates to `P()`.
 *
 * `P()` is a single `iget-boolean` of `NYTUserState.f` followed by `return`, which is what the
 * [Opcode.IGET_BOOLEAN] filter matches. It is the only method in the class that executes an
 * `iget-boolean`, so the fingerprint cannot drift onto `D()`/`J()`/`R()` or any other boolean
 * helper.
 *
 * The one-letter names move between releases: 6.48.0 used `E()`/`K()` for the linked and Google
 * Play checks, 6.50.0 renamed those to `D()`/`J()` and added `k()` (any-entitlement helper).
 * `P()` and `R()` kept their letters, and this fingerprint pins only `P()` and its shape, so the
 * other renames do not affect it.
 */
object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/games/integrations/subauth/library/SubauthEntitlementClientImpl;",
    name = "P",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(opcode(Opcode.IGET_BOOLEAN)),
)

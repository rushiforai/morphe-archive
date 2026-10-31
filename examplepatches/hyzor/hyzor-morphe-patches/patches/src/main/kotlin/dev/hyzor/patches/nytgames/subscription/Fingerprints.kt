package dev.hyzor.patches.nytgames.subscription

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * `SubauthEntitlementClientImpl.P()Z` — `isSubscribedForGames()` in 6.48.0.
 *
 * The class itself is not obfuscated (`com.nytimes.games.integrations.subauth.library` is the
 * app's own subauth bridge), but every method in it is one letter. The no-argument booleans the
 * app builds its entitlement state from are:
 *
 *   `E()`  `isSubscribedAndLinked`      `NYTUserImpl.d()` == `REGISTERED_SUBSCRIBED_LINKED`
 *   `K()`  `isSubscribedViaGooglePlay`  Google Play entitlements contain `Games`
 *   `P()`  `isSubscribedForGames`       `NYTUserState.f` (`UserData.hasActiveEntitlement`)
 *   `R()`  `hasUnlinkedSubscription`    `SubscriptionLevel` is anonymous/unlinked subscriber
 *
 * The names are not guessed: `SubauthShowGamesUserStatePreference` prints `P()`/`E()`/`R()`/`K()`
 * next to exactly those labels in the in-app developer settings, and the subscription flag used
 * by the rest of the app (`SubauthRxJavaClientImpl.i()` -> `AppEntitlementsImpl.e()` ->
 * `EntitlementStatus`) delegates to `P()`.
 *
 * `P()` is a single `iget-boolean` of `NYTUserState.f` followed by `return`, which is what the
 * [Opcode.IGET_BOOLEAN] filter matches. It is the only boolean in the class that reads an
 * instance field, so the fingerprint cannot drift onto `E()`/`K()`/`R()`.
 */
object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/games/integrations/subauth/library/SubauthEntitlementClientImpl;",
    name = "P",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(opcode(Opcode.IGET_BOOLEAN)),
)

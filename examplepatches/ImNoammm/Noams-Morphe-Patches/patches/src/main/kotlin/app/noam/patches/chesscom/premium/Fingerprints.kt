package app.noam.patches.chesscom.premium

import app.morphe.patcher.Fingerprint

/** toString() of the app's settings row (obfuscated class, original name in the string). */
internal object SettingsRowToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SettingsMenuItem(id="),
)

/**
 * toString() of the premium banner's spring winback sale. Its interface is the banner's offers
 * (it and Sale) and the interface above that is the banner itself (an offer or a plain upsell).
 */
internal object WinbackBannerToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("WinbackSpringSale(offer="),
)

/** toString() of the app's bot group model. */
internal object BotGroupToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("BotGroup(uuid="),
)

/** toString() of the redesigned Home's toolbar state for a signed-in player. */
internal object HomeToolbarStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("LoggedIn(userAvatarUrl=", ", shouldShowPaywallIcon="),
)

/**
 * SessionStore's one PremiumStatus getter: the account's tier, read from the session's
 * premium_status field. The app's tier checks ("has any premium tier", isAtLeastGold and the
 * screens that read the tier) go through this default method, which SharedPreferencesSessionStore
 * does not override.
 */
internal object SessionStoreGetPremiumStatusFingerprint : Fingerprint(
    definingClass = "Lcom/chess/net/v1/users/SessionStore;",
    parameters = listOf(),
    returnType = "Lcom/chess/entities/PremiumStatus;",
)

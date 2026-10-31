package dev.hyzor.patches.chesscom.premium

import app.morphe.patcher.Fingerprint

/** toString() of the app's settings row (obfuscated class, original name in the string). */
internal object SettingsRowToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SettingsMenuItem(id="),
)

/** toString() of the Home/More sale offer; its superclass is the premium offer type. */
internal object SaleOfferToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SaleItem(sale="),
)

/** toString() of the app's bot group model. */
internal object BotGroupToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("BotGroup(uuid="),
)

/** Home toolbar: shows the Premium icon in place of the league or bell icon. */
internal object ToolbarPremiumIconFingerprint : Fingerprint(
    name = "invokeSuspend",
    strings = listOf("menuItemPremiumIconR", "menuItemPremiumIconL"),
)

/** toString() of the redesigned Home's toolbar state for a signed-in player. */
internal object HomeToolbarStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("LoggedIn(userAvatarUrl=", ", shouldShowDiamond="),
)

/**
 * SessionStore.K(): the account's PremiumStatus tier, read from the session's premium_status
 * field. Every tier check in the app (c() = "has any premium tier", x() = isAtLeastGold, and
 * any screen that reads the tier directly) goes through this one default method, which
 * SharedPreferencesSessionStore does not override.
 */
internal object SessionStoreGetPremiumStatusFingerprint : Fingerprint(
    definingClass = "Lcom/chess/net/v1/users/SessionStore;",
    parameters = listOf(),
    returnType = "Lcom/chess/entities/PremiumStatus;",
)

package app.noam.patches.chesscom.premium

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

package app.template.patches.livescore.betting

import app.morphe.patcher.Fingerprint

// UserSelfRestrictedHelperImpl is not renamed by R8. Name-only matching would also hit the
// interface and UserSelfRestrictedHelperEmpty (abstract or no-op), so the class is pinned.
private const val SELF_RESTRICTED_IMPL = "Lcom/livescore/odds/self_restricted/UserSelfRestrictedHelperImpl;"

object UserBettingSelfRestrictionPassedFingerprint : Fingerprint(
    definingClass = SELF_RESTRICTED_IMPL,
    name = "isUserBettingSelfRestrictionPassed",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object AdultAndNotSelfRestrictedFingerprint : Fingerprint(
    definingClass = SELF_RESTRICTED_IMPL,
    name = "isAdultAndNotSelfRestricted",
    returnType = "Z",
    parameters = listOf(),
)

object BettingAdsHiddenFingerprint : Fingerprint(
    definingClass = SELF_RESTRICTED_IMPL,
    name = "getBettingAdsHidden",
    returnType = "Z",
    parameters = listOf(),
)

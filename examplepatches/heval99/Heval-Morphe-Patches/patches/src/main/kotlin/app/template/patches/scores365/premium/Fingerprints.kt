package app.template.patches.scores365.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The entitlement data class every premium check reads (isPremium, getAdsFree, getTipster, getPlus,
// getDelayedNotifications, getNotificationSounds). The class name is kept un-obfuscated.
internal object EntitlementStateConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z", "Z", "Z", "Z", "Z", "Ljava/util/Set;", "Ljava/util/List;", "J", "Z"),
)

// Picks the first screen of Profile > "Remove 365Scores ads". It reads the reward/grace start time
// "iabc_fnrts" and, when it is set, shows the purchase + invite-friends screen even for ad-free
// users (the async picker in an R8-renamed Runnable gets the flag through r8d).
internal object RemoveAdsBasicActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/removeAds/RemoveAdsBasicActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(string("iabc_fnrts", StringComparisonType.CONTAINS)),
)

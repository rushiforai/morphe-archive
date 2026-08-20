package app.template.patches.sofascore.ads

import app.morphe.patcher.Fingerprint

private const val USER_ACCOUNT_CLASS = "Lcom/sofascore/local_persistance/UserAccount;"

/**
 * UserAccount is not obfuscated, so these getters are stable anchors.
 * Every ad decision in the app is derived from these account flags.
 */
object GetForceAdsFingerprint : Fingerprint(
    definingClass = USER_ACCOUNT_CLASS,
    name = "getForceAds",
)

object GetForceHideAdsFingerprint : Fingerprint(
    definingClass = USER_ACCOUNT_CLASS,
    name = "getForceHideAds",
)

object GetHasServerAdsFingerprint : Fingerprint(
    definingClass = USER_ACCOUNT_CLASS,
    name = "getHasServerAds",
)

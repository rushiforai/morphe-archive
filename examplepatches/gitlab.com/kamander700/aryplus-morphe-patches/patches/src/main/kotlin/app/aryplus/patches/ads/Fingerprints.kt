package app.aryplus.patches.ads

import app.morphe.patcher.Fingerprint

// Media3 is not obfuscated in this app, so exact class/method names are stable anchors.
object SetAdsConfigurationFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/common/MediaItem\$Builder;",
    name = "setAdsConfiguration",
    parameters = listOf("Landroidx/media3/common/MediaItem\$AdsConfiguration;"),
)

private const val AD_HELPER = "Lcom/material/components/aryzap/Helpers/InterstitialAdHelper;"

object SetAdExperienceDataFingerprint : Fingerprint(
    definingClass = AD_HELPER,
    name = "setAdExperienceData",
    returnType = "V",
)

object RestoreAdExperienceFingerprint : Fingerprint(
    definingClass = AD_HELPER,
    name = "restoreFromPrefs",
    returnType = "V",
)

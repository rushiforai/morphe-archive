package app.onlynazril.patches.tiktok.settings

import app.morphe.patcher.Fingerprint

/**
 * The activity the Ad personalization row lives in. Both anchors name it
 * exactly, so the patcher's class map answers without walking the bundle;
 * the method name and signature are the framework's own.
 */
private const val AD_PERSONALIZATION_ACTIVITY =
    "Lcom/bytedance/ies/ugc/aweme/commercialize/compliance/personalization/AdPersonalizationActivity;"

internal object AdPersonalizationActivityOnCreateFingerprint : Fingerprint(
    definingClass = AD_PERSONALIZATION_ACTIVITY,
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

internal object AdPersonalizationActivityOnBackPressedFingerprint : Fingerprint(
    definingClass = AD_PERSONALIZATION_ACTIVITY,
    name = "onBackPressed",
    parameters = emptyList(),
    returnType = "V",
)

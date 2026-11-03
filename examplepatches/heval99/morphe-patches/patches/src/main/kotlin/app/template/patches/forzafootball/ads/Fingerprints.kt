package app.template.patches.forzafootball.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val PREBID_ENABLED_LABEL = ", prebidEnabled="

// The ad slot's suspend load (6.15.10: ig.h(Continuation)Object). It logs the "AdOpportunity"
// event, starts the "ads/opportunity" performance trace, loads the ad through the next-gen GMA
// SDK and publishes the loaded or failed state. The slot's state collector calls it whenever the
// slot is idle, after a failure and after a shown ad expires.
internal object AdOpportunityLoadFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(
        string("AdOpportunity", StringComparisonType.EQUALS),
        string("ads/opportunity", StringComparisonType.EQUALS),
    ),
)

// The AdsSettings data class (6.15.10: wj). Its toString labels prebidEnabled.
internal object AdsSettingsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("AdsSettings(appVersionName=", StringComparisonType.STARTS_WITH),
        string(PREBID_ENABLED_LABEL, StringComparisonType.EQUALS),
    ),
)

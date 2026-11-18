package io.github.henr1klmb.patches.channel4

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val CHANNEL4_COMPATIBILITY = Compatibility(
    packageName = "com.channel4.ondemand",
    name = "Channel 4",
    targets = listOf(AppTarget("9.8.1")),
)

private const val STRING_TYPE = "Ljava/lang/String;"
private const val VOID_RETURN = "V"
private const val BOOLEAN_RETURN = "Z"
private const val LIST_TYPE = "Ljava/util/List;"
private const val MAP_TYPE = "Ljava/util/Map;"
private const val ON_CREATE_NAME = "onCreate"
private const val GET_ADVERT_BREAKS_NAME = "getAdvertBreaks"
private const val LOG_EVENT_NAME = "logEvent"
private const val LOG_SCREEN_NAME = "logScreen"
private const val LOG_CUSTOM_EVENT_NAME = "logCustomEvent"
private const val TRACK_NAME = "track"

private const val API_ADVERT_METADATA_RESPONSE_CLASS = "Lcom/novoda/all4/models/api/adverts/ApiAdvertMetadataResponse;"
private const val API_PROGRAMME_INFO_CLASS = "Lcom/novoda/all4/models/api/cast/ApiProgrammeInfo;"
private const val ADVERT_BREAK_TIMER_VIEW_MODEL_CLASS = "Lcom/novoda/all4/videoondemand/AdvertBreakTimerViewModel;"

private const val FIREBASE_INIT_PROVIDER_CLASS = "Lcom/google/firebase/provider/FirebaseInitProvider;"
private const val FIREBASE_ANALYTICS_CLASS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val FIREBASE_CRASHLYTICS_CLASS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
private const val MPARTICLE_CLASS = "Lcom/mparticle/MParticle;"
private const val BRAZE_CLASS = "Lcom/braze/Braze;"
private const val OPTIMIZELY_CLASS = "Lcom/optimizely/ab/Optimizely;"

// Video Ads & Promo Fingerprints

internal object ApiAdvertMetadataResponseGetAdvertBreaksFingerprint : Fingerprint(
    definingClass = API_ADVERT_METADATA_RESPONSE_CLASS,
    name = GET_ADVERT_BREAKS_NAME,
    returnType = LIST_TYPE,
    parameters = emptyList(),
)

internal object ApiAdvertMetadataResponseGetAdsFingerprint : Fingerprint(
    definingClass = API_ADVERT_METADATA_RESPONSE_CLASS,
    name = "getAds",
    returnType = LIST_TYPE,
    parameters = emptyList(),
)

internal object ApiProgrammeInfoGetAdvertBreaksFingerprint : Fingerprint(
    definingClass = API_PROGRAMME_INFO_CLASS,
    name = GET_ADVERT_BREAKS_NAME,
    returnType = LIST_TYPE,
    parameters = emptyList(),
)

internal object AdvertBreakTimerViewModelShowTimerOverlayFingerprint : Fingerprint(
    definingClass = ADVERT_BREAK_TIMER_VIEW_MODEL_CLASS,
    name = "showTimerOverlay",
    returnType = VOID_RETURN,
    parameters = emptyList(),
)

internal object AdvertBreakTimerViewModelIsFeatureEnabledInExperimentFingerprint : Fingerprint(
    definingClass = ADVERT_BREAK_TIMER_VIEW_MODEL_CLASS,
    name = "isFeatureEnabledInExperiment",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

// Tracking & Analytics Fingerprints

internal object FirebaseInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = FIREBASE_INIT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS_CLASS,
    name = LOG_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, "Landroid/os/Bundle;"),
)

internal object FirebaseCrashlyticsRecordExceptionFingerprint : Fingerprint(
    definingClass = FIREBASE_CRASHLYTICS_CLASS,
    name = "recordException",
    returnType = VOID_RETURN,
    parameters = listOf("Ljava/lang/Throwable;"),
)

internal object FirebaseCrashlyticsLogFingerprint : Fingerprint(
    definingClass = FIREBASE_CRASHLYTICS_CLASS,
    name = "log",
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

internal object FirebaseCrashlyticsSetUserIdFingerprint : Fingerprint(
    definingClass = FIREBASE_CRASHLYTICS_CLASS,
    name = "setUserId",
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

internal object FirebaseCrashlyticsSendUnsentReportsFingerprint : Fingerprint(
    definingClass = FIREBASE_CRASHLYTICS_CLASS,
    name = "sendUnsentReports",
    returnType = VOID_RETURN,
    parameters = emptyList(),
)

internal object MParticleStartFingerprint : Fingerprint(
    definingClass = MPARTICLE_CLASS,
    name = "start",
    returnType = VOID_RETURN,
    parameters = listOf("Lcom/mparticle/MParticleOptions;"),
)

internal object MParticleLogEventFingerprint : Fingerprint(
    definingClass = MPARTICLE_CLASS,
    name = LOG_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf("Lcom/mparticle/BaseEvent;"),
)

internal object MParticleLogScreenMpEventFingerprint : Fingerprint(
    definingClass = MPARTICLE_CLASS,
    name = LOG_SCREEN_NAME,
    returnType = VOID_RETURN,
    parameters = listOf("Lcom/mparticle/MPEvent;"),
)

internal object MParticleLogScreenStringFingerprint : Fingerprint(
    definingClass = MPARTICLE_CLASS,
    name = LOG_SCREEN_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

internal object MParticleLogScreenStringMapFingerprint : Fingerprint(
    definingClass = MPARTICLE_CLASS,
    name = LOG_SCREEN_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, MAP_TYPE),
)

internal object BrazeLogCustomEventFingerprint : Fingerprint(
    definingClass = BRAZE_CLASS,
    name = LOG_CUSTOM_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

internal object BrazeLogCustomEventWithPropsFingerprint : Fingerprint(
    definingClass = BRAZE_CLASS,
    name = LOG_CUSTOM_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, "Lcom/braze/models/outgoing/BrazeProperties;"),
)

internal object BrazeLogPurchaseFingerprint : Fingerprint(
    definingClass = BRAZE_CLASS,
    name = "logPurchase",
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, STRING_TYPE, "Ljava/math/BigDecimal;"),
)

internal object OptimizelyTrackFingerprint : Fingerprint(
    definingClass = OPTIMIZELY_CLASS,
    name = TRACK_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, STRING_TYPE),
)

internal object OptimizelyTrackWithAttributesFingerprint : Fingerprint(
    definingClass = OPTIMIZELY_CLASS,
    name = TRACK_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, STRING_TYPE, MAP_TYPE),
)

internal object OptimizelyTrackWithEventTagsFingerprint : Fingerprint(
    definingClass = OPTIMIZELY_CLASS,
    name = TRACK_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, STRING_TYPE, MAP_TYPE, MAP_TYPE),
)

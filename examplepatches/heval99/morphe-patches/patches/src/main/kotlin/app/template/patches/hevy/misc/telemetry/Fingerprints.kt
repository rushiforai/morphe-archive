package app.template.patches.hevy.misc.telemetry

import app.morphe.patcher.Fingerprint

// Since 3.2.2 R8 renames the Facebook, Amplitude and Branch SDK classes, so these are found by
// stable strings (public intent constants and reflection names), never by class name.

// Facebook AppEventQueue.flushAndWait(FlushReason) (3.2.2: V6.n.n). Every flush path (explicit
// flush, the 15 s timer, the 100-event threshold) ends here. The extras are public
// AppEventsLogger constants.
internal object FacebookFlushAndWaitFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.facebook.sdk.APP_EVENTS_FLUSHED", "com.facebook.sdk.APP_EVENTS_NUM_EVENTS_FLUSHED"),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

// Amplitude AndroidContextProvider.CachedInfo.fetchAdvertisingId() (3.2.2: com.amplitude.reactnative
// a$a.t): reads the Google ad ID and limit-ad-tracking flag by reflection.
internal object AmplitudeGoogleAdIdFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("getAdvertisingIdInfo", "isLimitAdTrackingEnabled"),
)

// Amplitude CachedInfo.fetchAndCacheAmazonAdvertisingId() (3.2.2: a$a.s): the Fire OS settings path.
internal object AmplitudeAmazonAdIdFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("limit_ad_tracking", "advertising_id"),
)

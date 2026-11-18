package io.github.jordanwoodson.patches.kick.analytics

import app.morphe.patcher.Fingerprint

internal const val FIREBASE = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
internal const val REACT_PROMISE = "Lcom/facebook/react/bridge/Promise;"
internal const val EXPO_PROMISE = "Lexpo/modules/kotlin/Promise;"
private const val STRING = "Ljava/lang/String;"
private const val READABLE_MAP = "Lcom/facebook/react/bridge/ReadableMap;"

// These are original, unobfuscated SDK/bridge names. Check complete signatures and each match count.
internal object FirebaseEventFingerprint : Fingerprint(
    definingClass = "Lio/invertase/firebase/analytics/NativeRNFBTurboAnalytics;",
    name = "logEvent", returnType = "V", parameters = listOf(STRING, READABLE_MAP, REACT_PROMISE),
)
internal object FirebaseCollectionFingerprint : Fingerprint(
    definingClass = FIREBASE, name = "setAnalyticsCollectionEnabled", returnType = "V", parameters = listOf("Z"),
)
internal object InsiderInitFingerprint : Fingerprint(
    definingClass = "Lcom/useinsider/react/RNInsiderModule;", name = "init",
    returnType = "V", parameters = listOf(STRING, STRING),
)
internal object InsiderEventFingerprint : Fingerprint(
    name = "build", returnType = "V", parameters = emptyList(), strings = listOf("InsiderEvent-build"),
)
internal object InsiderSessionJobFingerprint : Fingerprint(
    definingClass = "Lcom/useinsider/insider/SessionPayloadJobService;", name = "onStartJob",
    returnType = "Z", parameters = listOf("Landroid/app/job/JobParameters;"),
)
internal object InsiderAmplificationJobFingerprint : Fingerprint(
    definingClass = "Lcom/useinsider/insider/InsiderAmplificationService;", name = "onStartJob",
    returnType = "Z", parameters = listOf("Landroid/app/job/JobParameters;"),
)
internal object DatadogBridgeFingerprint : Fingerprint(
    definingClass = "Lcom/datadog/reactnative/DdSdkImplementation;", name = "initialize",
    returnType = "V", parameters = listOf(READABLE_MAP, REACT_PROMISE), strings = listOf("configuration", "promise"),
)
internal object DatadogNativeFingerprint : Fingerprint(
    definingClass = "Lcom/datadog/reactnative/DdSdkNativeInitialization;",
    name = "initialize\$datadog_mobile_react_native_release", returnType = "V",
    parameters = listOf("Lcom/datadog/reactnative/DdSdkConfiguration;", "Z"), strings = listOf("ddSdkConfiguration"),
)
private const val PLAYER_V3 = "Lcom/kick/mobile/playerv3"

/** Kick's player's Mux Data options: the only way to its monitor, which is the only place Mux's SDK is started. */
internal object MuxOptionsFingerprint : Fingerprint(
    definingClass = "$PLAYER_V3/MuxDataMonitor;", name = "setOptions", returnType = "V",
    parameters = listOf("$PLAYER_V3/records/MuxDataOptions;", "Landroidx/media3/exoplayer/ExoPlayer;"),
)

/**
 * The player view's Datazoom options: the only place its Datazoom monitor is made, which is the only caller of
 * Datazoom's init and of MediaTailor's sessions and PAL setup.
 */
internal object DatazoomOptionsFingerprint : Fingerprint(
    definingClass = "$PLAYER_V3/VideoView;", name = "setDatazoom", returnType = "V",
    parameters = listOf("$PLAYER_V3/datazoom/DatazoomOptions;"),
)

/** generatePalNonceAsync: loads a Google PAL nonce manager for the playback request. */
internal object PalNonceFingerprint : Fingerprint(
    definingClass = "$PLAYER_V3/pal/PalNonceGenerator;", name = "loadNonce", returnType = "V",
    parameters = listOf("Landroid/content/Context;", "$PLAYER_V3/pal/PalNonceRequestOptions;", EXPO_PROMISE),
    strings = listOf("promise"),
)
private const val FPJS_MODULE = "Lcom/fingerprintjs/reactnative/RNFingerprintjsProModule;"
private val FPJS_PARAMETERS = listOf(READABLE_MAP, STRING, "Ljava/lang/Integer;", REACT_PROMISE)

// FingerprintJS Pro's React Native module: getVisitorData and getVisitorId both go through these.
internal object FingerprintDataFingerprint : Fingerprint(
    definingClass = FPJS_MODULE, name = "getVisitorDataWithTimeout", returnType = "V", parameters = FPJS_PARAMETERS,
)
internal object FingerprintIdFingerprint : Fingerprint(
    definingClass = FPJS_MODULE, name = "getVisitorIdWithTimeout", returnType = "V", parameters = FPJS_PARAMETERS,
)
internal object AnalyticsStartupFingerprint : Fingerprint(
    definingClass = "Lcom/kick/mobile/MainApplication;", name = "onCreate", returnType = "V",
    parameters = emptyList(), strings = listOf("experimental"),
)

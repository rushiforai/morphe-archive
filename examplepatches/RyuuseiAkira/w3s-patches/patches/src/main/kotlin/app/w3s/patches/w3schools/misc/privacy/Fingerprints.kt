// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/privacy/Fingerprints.kt
package app.w3s.patches.w3schools.misc.privacy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object FacebookAutoLogAppEventsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "getAutoLogAppEventsEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

internal object FacebookAdvertiserIdCollectionEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "getAdvertiserIDCollectionEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

internal object FacebookCodelessSetupEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "getCodelessSetupEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

internal object FacebookPublishInstallAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "publishInstallAsync",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

internal object FacebookAppEventsManagerStartFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsManager;",
    name = "start",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
)

internal object FacebookLogActivateAppEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/internal/AutomaticAnalyticsLogger;",
    name = "logActivateAppEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
)

internal object FacebookImplicitPurchaseLoggingEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/internal/AutomaticAnalyticsLogger;",
    name = "isImplicitPurchaseLoggingEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

internal object FacebookStartIapLoggingFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/iap/InAppPurchaseAutoLogger;",
    name = "startIapLogging",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/facebook/appevents/iap/InAppPurchaseUtils${'$'}BillingClientVersion;"),
)

internal object FacebookGpsAraEnableFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/gps/ara/GpsAraTriggersManager;",
    name = "enable",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
)

internal object FacebookGpsPaEnableFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/gps/pa/PACustomAudienceClient;",
    name = "enable",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
)

internal object FacebookGpsTopicsEnableFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/gps/topics/GpsTopicsManager;",
    name = "enableTopicsObservation",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = emptyList(),
)

internal object FacebookAndroidIdViaReflectionFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/internal/AttributionIdentifiers${'$'}Companion;",
    name = "getAndroidIdViaReflection",
    returnType = "Lcom/facebook/internal/AttributionIdentifiers;",
    parameters = listOf("Landroid/content/Context;"),
)

internal object FacebookAndroidIdViaServiceFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/internal/AttributionIdentifiers${'$'}Companion;",
    name = "getAndroidIdViaService",
    returnType = "Lcom/facebook/internal/AttributionIdentifiers;",
    parameters = listOf("Landroid/content/Context;"),
)

internal object FacebookInstallReferrerTryUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/internal/InstallReferrerUtil;",
    name = "tryUpdateReferrerInfo",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/facebook/internal/InstallReferrerUtil${'$'}Callback;"),
)

internal object RevenueCatDiagnosticsTrackEntryFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntry;"),
)

internal object RevenueCatDiagnosticsTrackNameMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsTracker;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/common/diagnostics/DiagnosticsEntryName;", "Ljava/util/Map;"),
)

internal object RevenueCatEventsTrackFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/common/events/EventsManager;",
    name = "track",
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/common/events/FeatureEvent;"),
)

internal object RevenueCatEventsFlushFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/common/events/EventsManager;",
    name = "flushEvents",
    returnType = "V",
    parameters = listOf("Lcom/revenuecat/purchases/common/Delay;"),
)

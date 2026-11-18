package io.github.henr1klmb.patches.sbb

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode

internal val SBB_COMPATIBILITY = Compatibility(
    packageName = "ch.sbb.mobile.android.b2c",
    name = "SBB Mobile",
    targets = listOf(AppTarget("12.27.0.87.master")),
)

// Screenshots Fingerprints

internal object DatatransSecureDialogFingerprint : Fingerprint(
    returnType = "Landroid/app/Dialog;",
    parameters = listOf("Landroid/os/Bundle;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CONST_16
        } == true
    },
)

// Ads Fingerprints

internal object SbbAdsViewAttachedFingerprint : Fingerprint(
    definingClass = "Lch/sbb/mobile/android/vnext/common/views/SbbAdsView;",
    name = "onAttachedToWindow",
    returnType = "V",
    parameters = emptyList(),
)

internal object SbbAdsViewUpdateAdRequestFingerprint : Fingerprint(
    definingClass = "Lch/sbb/mobile/android/vnext/common/views/SbbAdsView;",
    name = "v",
    returnType = "V",
    parameters = emptyList(),
)

internal object MobileAdsInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "attachInfo",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;"),
)

// Tracking Fingerprints

internal object TrackingScreenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lch/sbb/mobile/android/vnext/common/atinternet/TrackingScreen;"),
)

internal object TrackingClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lch/sbb/mobile/android/vnext/common/atinternet/TrackingClick;"),
)

internal object TrackingTicketVariantFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lch/sbb/mobile/android/vnext/common/dto/ticketing/TicketVariantDto;",
        "Ljava/lang/String;",
        "Z",
    ),
)

internal object CrashlyticsAppenderFingerprint : Fingerprint(
    definingClass = "Lch/sbb/mobile/android/vnext/common/CrashlyticsAppender;",
    name = "append",
    returnType = "V",
    parameters = listOf("Lch/qos/logback/classic/spi/ILoggingEvent;"),
)

internal object CrashlyticsLogFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "log",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object CrashlyticsRecordExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "recordException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
)

internal object CrashlyticsSendUnsentReportsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "sendUnsentReports",
    returnType = "V",
    parameters = emptyList(),
)

// WebView Client Fingerprint

internal object SbbWebViewClientFingerprint : Fingerprint(
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
    superclass = "Landroid/webkit/WebViewClient;",
    strings = listOf("view", "request"),
)

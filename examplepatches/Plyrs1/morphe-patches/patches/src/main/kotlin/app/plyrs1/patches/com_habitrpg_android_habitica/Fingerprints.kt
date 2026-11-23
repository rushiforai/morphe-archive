package app.plyrs1.patches.com_habitrpg_android_habitica

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint matching AuthenticationViewModel.<init>(...)
 * Used to make custom server settings button permanently visible on the login screen.
 * Matched by definingClass + strings in both 4.10.5 and 4.11.2.
 */
object AuthenticationViewModelInitFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/ui/viewmodels/AuthenticationViewModel;",
    name = "<init>",
    returnType = "V",
    strings = listOf("server_url")
)

// ── 4.10.5 Analytics Fingerprints ────────────────────────────────────────────

object AnalyticsInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

object AnalyticsLogExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "logException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

object AnalyticsLogErrorFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "logError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object AnalyticsSetUserIDFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "setUserID",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object AnalyticsClearUserIDFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "clearUserID",
    returnType = "V",
    parameters = emptyList()
)

object AnalyticsSetConsentFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "setAnalyticsConsent",
    returnType = "V",
    parameters = listOf("Ljava/lang/Boolean;")
)

// ── 4.11.2 FirebaseAnalyticsManager Fingerprints ─────────────────────────────

object FirebaseAnalyticsInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/FirebaseAnalyticsManager;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

object FirebaseAnalyticsLogExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/FirebaseAnalyticsManager;",
    name = "logException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

object FirebaseAnalyticsLogErrorFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/FirebaseAnalyticsManager;",
    name = "logError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object FirebaseAnalyticsSetUserIDFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/FirebaseAnalyticsManager;",
    name = "setUserID",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object FirebaseAnalyticsClearUserIDFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/FirebaseAnalyticsManager;",
    name = "clearUserID",
    returnType = "V",
    parameters = emptyList()
)

object FirebaseAnalyticsSetConsentFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/FirebaseAnalyticsManager;",
    name = "setAnalyticsConsent",
    returnType = "V",
    parameters = listOf("Ljava/lang/Boolean;")
)

// ── Application Lifecycle & Telemetry Fingerprints ───────────────────────────

object SetupRemoteConfigFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/HabiticaBaseApplication;",
    name = "setupRemoteConfig",
    returnType = "V",
    parameters = emptyList()
)

object SetupNotificationsFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/HabiticaBaseApplication;",
    name = "setupNotifications",
    returnType = "V",
    parameters = emptyList()
)

object SetupAdHandlerFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/HabiticaBaseApplication;",
    name = "setupAdHandler",
    returnType = "V",
    parameters = emptyList()
)

// ── Privacy Preferences Dialog Bypass Fingerprint ────────────────────────────

object PrivacyPreferencesActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/ui/activities/PrivacyPreferencesActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// ── Rewarded Ads Fingerprints (<= 4.10.5) ────────────────────────────────────

object AdHandlerShowFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/AdHandler;",
    name = "show",
    returnType = "V",
    parameters = emptyList()
)

object EnableArmoireAdsFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/AppConfigManager;",
    name = "enableArmoireAds",
    returnType = "Z",
    parameters = emptyList()
)

object NextAdAllowedDateFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/AdHandler\$Companion;",
    name = "nextAdAllowedDate",
    returnType = "Ljava/util/Date;",
    parameters = listOf("Lcom/habitrpg/android/habitica/helpers/AdType;")
)

// ── Armoire Subscriber Free Roll Fingerprint (>= 4.11.2 & Universal) ─────────

/**
 * Fingerprint matching User.isSubscribed()
 * Used to grant subscriber benefits (such as free daily Armoire rolls) across all app versions.
 */
object UserIsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/models/user/User;",
    name = "isSubscribed",
    returnType = "Z",
    parameters = emptyList()
)

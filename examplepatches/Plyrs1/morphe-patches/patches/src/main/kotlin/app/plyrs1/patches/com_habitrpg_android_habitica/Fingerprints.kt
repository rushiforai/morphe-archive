package app.plyrs1.patches.com_habitrpg_android_habitica

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint matching AuthenticationViewModel.<init>(...)
 * Used to make custom server settings button permanently visible on the login screen.
 */
object AuthenticationViewModelInitFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/ui/viewmodels/AuthenticationViewModel;",
    name = "<init>",
    returnType = "V",
    strings = listOf("server_url")
)

/**
 * Fingerprint matching Analytics.initialize(Context)
 * Neutralized to prevent Firebase Crashlytics & Performance monitoring initialization.
 */
object AnalyticsInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Fingerprint matching Analytics.logException(Throwable)
 * Neutralized to prevent unconditional crash reporting to Firebase Crashlytics.
 */
object AnalyticsLogExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "logException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

/**
 * Fingerprint matching Analytics.logError(String)
 * Neutralized to prevent error logging to Firebase Crashlytics.
 */
object AnalyticsLogErrorFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "logError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Fingerprint matching Analytics.setUserID(String)
 * Neutralized to prevent linking Habitica UUID to Firebase Crashlytics identity.
 */
object AnalyticsSetUserIDFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "setUserID",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Fingerprint matching Analytics.clearUserID()
 * Neutralized to prevent identity operations with Firebase Crashlytics.
 */
object AnalyticsClearUserIDFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "clearUserID",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching Analytics.setAnalyticsConsent(Boolean)
 * Neutralized to prevent any consent state transmission to Firebase.
 */
object AnalyticsSetConsentFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/Analytics;",
    name = "setAnalyticsConsent",
    returnType = "V",
    parameters = listOf("Ljava/lang/Boolean;")
)

/**
 * Fingerprint matching HabiticaBaseApplication.setupRemoteConfig()
 * Patched to load local XML defaults without initiating network fetch or realtime listeners.
 */
object SetupRemoteConfigFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/HabiticaBaseApplication;",
    name = "setupRemoteConfig",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching HabiticaBaseApplication.setupNotifications()
 * Neutralized to prevent Firebase Installations ID generation and FCM token acquisition.
 */
object SetupNotificationsFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/HabiticaBaseApplication;",
    name = "setupNotifications",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching HabiticaBaseApplication.setupAdHandler()
 * Neutralized to prevent AdMob initialization.
 */
object SetupAdHandlerFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/HabiticaBaseApplication;",
    name = "setupAdHandler",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching AdHandler.show()
 * Replaced to immediately invoke rewardAction callback with Boolean.TRUE without loading ads.
 */
object AdHandlerShowFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/AdHandler;",
    name = "show",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Fingerprint matching AppConfigManager.enableArmoireAds()
 * Forced to return true so the Armoire ad button is always visible.
 */
object EnableArmoireAdsFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/AppConfigManager;",
    name = "enableArmoireAds",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Fingerprint matching AdHandler$Companion.nextAdAllowedDate(AdType)
 * Forced to return null to bypass residual cooldown timers on ad buttons.
 */
object NextAdAllowedDateFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/helpers/AdHandler\$Companion;",
    name = "nextAdAllowedDate",
    returnType = "Ljava/util/Date;",
    parameters = listOf("Lcom/habitrpg/android/habitica/helpers/AdType;")
)

/**
 * Fingerprint matching PrivacyPreferencesActivity.onCreate(Bundle)
 * Used to immediately finish the activity and bypass the privacy preferences page.
 */
object PrivacyPreferencesActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/habitrpg/android/habitica/ui/activities/PrivacyPreferencesActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

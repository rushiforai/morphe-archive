package arpit.morphe.patches.healthifyme.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.healthifyme.shared.Constants.COMPATIBILITY_HEALTHIFYME

/**
 * Disables the app's analytics and tracking SDKs.
 *
 * Firebase Analytics is stopped at the app wrapper (`enabled()`), and automatic
 * collection is disabled by forcing `FirebaseAnalytics.setAnalyticsCollectionEnabled`
 * to `false` even when the app asks for `true`. Firebase Messaging/Remote Config are
 * untouched.
 *
 * CleverTap is stopped before initialisation: the SDK bootstrap and lifecycle callbacks
 * are no-ops, the single event funnel plus profile/login/location/FCM-token uploads
 * return early, and push rendering returns before it can dereference the uninitialised
 * SDK. This also means CleverTap push/in-app campaigns no longer initialise; ordinary
 * FCM/backend notifications are unaffected.
 *
 * AppsFlyer install attribution is stopped at both the AndroidX initializer and the
 * direct `start` call in `AppLaunchLibsHandler`, and the app wrapper's event/property
 * methods are disabled.
 *
 * Facebook app-event reporting is disabled through the app wrapper, and the SDK's own
 * automatic app events and advertiser-ID collection are forced off. The Facebook SDK
 * itself is left initialised because it also backs Facebook login. Crash reporting
 * (Crashlytics/Sentry) and Branch deep links are intentionally left intact.
 */
@Suppress("unused")
val removeAnalyticsPatch = bytecodePatch(
    name = "Remove analytics",
    description = "Stops Firebase Analytics and CleverTap reporting, AppsFlyer attribution, " +
        "and Facebook automatic app events/advertiser-ID collection. CleverTap push/in-app " +
        "initialisation is disabled; crash reporting and Branch deep links are kept.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEALTHIFYME)

    execute {
        // Firebase Analytics wrapper — all event/profile-property calls are gated here.
        FirebaseAnalyticsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Firebase Analytics automatic collection — force every enable/disable call to
        // disable collection, including the startup call that passes `true`.
        FirebaseAnalyticsCollectionFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
            """,
        )

        // CleverTap — stop the event funnel and identity/location uploads.
        CleverTapSendEventWithMapFingerprint.method.addInstructions(0, "return-void")
        CleverTapOnUserLoginFingerprint.method.addInstructions(0, "return-void")
        CleverTapPushProfileFingerprint.method.addInstructions(0, "return-void")
        CleverTapSendLocationFingerprint.method.addInstructions(0, "return-void")
        CleverTapPushFcmFingerprint.method.addInstructions(0, "return-void")

        // CleverTap — no SDK bootstrap, lifecycle auto-tracking, or push rendering.
        CleverTapInitFingerprint.method.addInstructions(0, "return-void")
        CleverTapRegisterLifecycleFingerprint.method.addInstructions(0, "return-void")
        CleverTapCreateNotificationFingerprint.method.addInstructions(0, "return-void")

        // AppsFlyer — both initialisation paths and the direct tracking start.
        AppsFlyerInitializerFingerprint.method.addInstructions(0, "return-void")
        AppLaunchAppsFlyerStartFingerprint.method.addInstructions(0, "return-void")
        AppsFlyerAnalyticsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        AppsFlyerSetPropertiesFingerprint.method.addInstructions(0, "return-void")

        // Facebook app events. The SDK stays initialised for Facebook login, but its
        // explicit events, automatic lifecycle events and advertiser-ID collection are
        // all forced off.
        FacebookAnalyticsEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        FacebookAutoLogAppEventsFingerprint.method.addInstructions(0, "const/4 p0, 0x0")
        FacebookAdvertiserIdCollectionFingerprint.method.addInstructions(0, "const/4 p0, 0x0")
    }
}

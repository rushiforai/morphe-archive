package arpit.morphe.patches.healthifyme.analytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `BaseFirebaseAnalyticsUtils` (`Lcom/healthifyme/base/utils/p;`) is the app's Firebase
 * Analytics wrapper. Every `sendEvent` overload and `getFirebaseInstance` first consult
 * `enabled()`, so returning `false` stops event reporting and profile-property collection
 * without touching Firebase Messaging or Remote Config.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/p.smali` — `enabled()Z` has
 * `.registers 1` and the original body is `const/4 v0, 0x1; return v0`.
 */
object FirebaseAnalyticsEnabledFingerprint : Fingerprint(
    name = "enabled",
    definingClass = "Lcom/healthifyme/base/utils/p;",
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `FirebaseAnalytics.setAnalyticsCollectionEnabled(boolean)` (`c(Z)V`). The app calls it
 * with `true` from `AppLaunchLibsHandler` during startup, which would leave automatic
 * session/screen collection running even after the wrapper's `enabled()` gate is forced
 * off. Forcing the argument to `false` before the original call disables collection for
 * every caller.
 *
 * Verified against `smali/classes/com/google/firebase/analytics/FirebaseAnalytics.smali`
 * — `public c(Z)V`, `.registers 3`.
 */
object FirebaseAnalyticsCollectionFingerprint : Fingerprint(
    name = "c",
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * CleverTap's event funnel. `sendEvent`, every `sendEventWithExtra` overload,
 * `sendEventWithMap(String, Map)`, `checkAndFireEventOnceInADay` and
 * `sendEventWithExtraWithFreemium` all end here, and this method is also the only place
 * that forwards events to the shared `BaseAnalyticsUtil` and `BaseHmeAnalyticsHelper`.
 * A single early return therefore stops all CleverTap and downstream event reporting.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `sendEventWithMap(Ljava/lang/String;Ljava/util/Map;Z)V`, `.registers 6`.
 */
object CleverTapSendEventWithMapFingerprint : Fingerprint(
    name = "sendEventWithMap",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;", "Z"),
)

/**
 * CleverTap SDK bootstrap (`initClevertapApi`). Without it the static `cleverTapAPI` stays
 * null, so the SDK does not register its device/session collectors. The app's event and
 * profile methods are null-safe, and `createNotification` is additionally patched below.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `initClevertapApi(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V`.
 */
object CleverTapInitFingerprint : Fingerprint(
    name = "initClevertapApi",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

/**
 * Registers CleverTap's application lifecycle callbacks, which otherwise auto-track
 * launches/backgrounds even if event methods are disabled.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `registerLifecycleCallbacks(Lcom/healthifyme/base/d;)V`, `.registers 1`.
 */
object CleverTapRegisterLifecycleFingerprint : Fingerprint(
    name = "registerLifecycleCallbacks",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/healthifyme/base/d;"),
)

/**
 * CleverTap push rendering (`createNotification`). With CleverTap uninitialised the
 * original dereferences `cleverTapAPI` without a null check, so a late push delivery
 * could crash; the patch returns before that path.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `createNotification(Landroid/content/Context;Landroid/os/Bundle;)V`, `.registers 4`.
 */
object CleverTapCreateNotificationFingerprint : Fingerprint(
    name = "createNotification",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/os/Bundle;"),
)

/**
 * CleverTap user login / profile upload. These send the signed-in user's identity,
 * contact fields and health profile to CleverTap independently of `sendEventWithMap`.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `onUserLogin(Ljava/util/HashMap;)V` and `pushProfile(Ljava/util/HashMap;)V`.
 */
object CleverTapOnUserLoginFingerprint : Fingerprint(
    name = "onUserLogin",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/util/HashMap;"),
)

object CleverTapPushProfileFingerprint : Fingerprint(
    name = "pushProfile",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/util/HashMap;"),
)

/**
 * CleverTap location reporting. `BaseClevertapUtils.sendLocation(Location)` forwards the
 * last known location to the SDK.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `sendLocation(Landroid/location/Location;)V`, `.registers 2`.
 */
object CleverTapSendLocationFingerprint : Fingerprint(
    name = "sendLocation",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/location/Location;"),
)

/**
 * CleverTap FCM token upload (`pushFcmRegistrationId`). This identifies the device to
 * CleverTap even when event reporting is off.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/i.smali` — static
 * `pushFcmRegistrationId(Ljava/lang/String;)V`, `.registers 3`.
 */
object CleverTapPushFcmFingerprint : Fingerprint(
    name = "pushFcmRegistrationId",
    definingClass = "Lcom/healthifyme/base/utils/i;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * AppsFlyer's AndroidX-startup initializer. Returning early prevents `AppsFlyerLib.init`
 * from running; the attribution `start` call is patched separately in
 * `AppLaunchLibsHandler`.
 *
 * Verified against `smali/classes5/com/healthifyme/basic/startup/AppsFlyerInitializer.smali`
 * — `public create(Landroid/content/Context;)V`, `.registers 5`.
 */
object AppsFlyerInitializerFingerprint : Fingerprint(
    name = "create",
    definingClass = "Lcom/healthifyme/basic/startup/AppsFlyerInitializer;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `AppLaunchLibsHandler` starts AppsFlyer tracking directly through `AppsFlyerLib.start`
 * (the startup initializer is a separate path). This private method contains the
 * `"StartAppsFlyerTracking"` log literal, which makes it unambiguous.
 *
 * Verified against `smali/classes5/com/healthifyme/basic/helpers/e.smali` — `private final r()V`.
 */
object AppLaunchAppsFlyerStartFingerprint : Fingerprint(
    name = "r",
    definingClass = "Lcom/healthifyme/basic/helpers/e;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("StartAppsFlyerTracking"),
    ),
)

/**
 * `AFUtils.isAnalyticsEnabled()` gates `sendEvent` and `sendEventWithMap`; forcing it
 * `false` also stops the direct `AppsFlyerLib.logEvent` calls.
 *
 * Verified against `smali/classes5/com/healthifyme/basic/utils/AFUtils.smali` — instance
 * `public final isAnalyticsEnabled()Z`, `.registers 2`.
 */
object AppsFlyerAnalyticsEnabledFingerprint : Fingerprint(
    name = "isAnalyticsEnabled",
    definingClass = "Lcom/healthifyme/basic/utils/AFUtils;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `AFUtils.setProperties` sends the user UUID and email to AppsFlyer without checking
 * `isAnalyticsEnabled`, so it is patched separately.
 *
 * Verified against `smali/classes5/com/healthifyme/basic/utils/AFUtils.smali` — instance
 * `public final setProperties(Ljava/lang/String;Ljava/lang/String;)V`, `.registers 4`.
 */
object AppsFlyerSetPropertiesFingerprint : Fingerprint(
    name = "setProperties",
    definingClass = "Lcom/healthifyme/basic/utils/AFUtils;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

/**
 * `FacebookAnalyticsUtils.isAnalyticsEnabled()` gates every `AppEventsLogger` event in
 * the app. Facebook SDK initialisation is deliberately left alone because the same SDK
 * backs Facebook login.
 *
 * Verified against `smali/classes5/com/healthifyme/basic/utils/FacebookAnalyticsUtils.smali`
 * — `private static isAnalyticsEnabled()Z`, `.registers 1`.
 */
object FacebookAnalyticsEnabledFingerprint : Fingerprint(
    name = "isAnalyticsEnabled",
    definingClass = "Lcom/healthifyme/basic/utils/FacebookAnalyticsUtils;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `FacebookSdk.setAdvertiserIDCollectionEnabled(boolean)` (`V(Z)V`). The app enables it
 * during startup; forcing the argument `false` stops advertising-identifier collection
 * without disabling the SDK or Facebook login.
 *
 * Verified against `smali/classes/com/facebook/e.smali` — static final `V(Z)V`,
 * `.registers 1`.
 */
object FacebookAdvertiserIdCollectionFingerprint : Fingerprint(
    name = "V",
    definingClass = "Lcom/facebook/e;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * `FacebookSdk.setAutoLogAppEventsEnabled(boolean)` (`X(Z)V`). When `true`, this also
 * registers `ActivityLifecycleTracker`, which is what emits automatic app-launch/session
 * events independently of the app's `FacebookAnalyticsUtils` wrapper. Forcing the
 * argument `false` removes that automatic tracking while leaving SDK initialisation and
 * login untouched.
 *
 * Verified against `smali/classes/com/facebook/e.smali` — static final `X(Z)V`,
 * `.registers 2`.
 */
object FacebookAutoLogAppEventsFingerprint : Fingerprint(
    name = "X",
    definingClass = "Lcom/facebook/e;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
)

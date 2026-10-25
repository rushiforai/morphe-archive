package app.template.patches.guardian.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val OBJECT = "Ljava/lang/Object;"
internal const val STRING = "Ljava/lang/String;"
internal const val SWITCH_KEY = "Lcom/guardian/util/switches/RemoteSwitches\$Companion\$Key;"

// Firebase Analytics keeps its class name; R8 renames its members (6.238: b(Z) is
// setAnalyticsCollectionEnabled, a(Bundle, String) is logEvent with the name second).
internal const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

// R8 renames the app's own classes since 6.238, so every anchor below is a string, a kept
// library class name or a method shape.

// The tracking SDK descriptor data class (6.238: icb), found through its toString(). Each
// third-party SDK (Comscore, Nielsen, Adjust, Braze, Permutive, Confiant, APS, Teads, Firebase,
// ...) is one constant of it: an optional remote switch key, a "premium users skip it" flag and
// its Sourcepoint vendor ids.
internal object SdkToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = listOf(),
    filters = listOf(string("Sdk(remoteSwitchKey=", StringComparisonType.STARTS_WITH)),
)

// SdkManager's "may this SDK run" gate (6.238: lcb.a(icb)): the SDK's remote switch is on, the
// user is not premium-exempted (isPremium()) and the consent check (6.238: bvb.j(icb), which
// reads no switch and calls no isPremium) allows it. ShouldLoadAds in guardian/ads has the same
// two calls but no parameter, so the two cannot match each other.
internal fun sdkGateFingerprint(sdk: String) = Fingerprint(
    returnType = "Z",
    parameters = listOf(sdk),
    filters = listOf(
        fieldAccess(definingClass = sdk, type = SWITCH_KEY),
        methodCall(name = "isPremium", parameters = listOf(), returnType = "Z"),
    ),
    custom = { method, _ -> method.implementation != null },
)

// The Ophan uploader (6.238: fg9.a(NativeAppSubmission)): it posts the queued page views and
// events to Ophan, the Guardian's own analytics, and throws an IOException on failure so that
// OphanCoroutineWorker keeps the events for a retry. The thrift model class keeps its name.
// The endpoint is matched as a URL prefix (STARTS_WITH), so a longer path or query still matches
// under patcher 2.0, which compares raw `strings` with the whole constant. The failure message is
// a whole constant (GuardianSmokeTest finds it by equality) and stays in `strings`, which also
// keeps the two anchors order-free.
internal object OphanSubmitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lophan/thrift/nativeapp/NativeAppSubmission;"),
    strings = listOf("Ophan submission failed"),
    filters = listOf(string("https://ophan.theguardian.com/mob", StringComparisonType.STARTS_WITH)),
    custom = { method, _ -> method.implementation != null },
)

// FirebaseCrashlytics.getInstance() (6.238: static rn4.a() returning rn4). R8 renames the
// Crashlytics class itself, so it is found through this method's error string.
internal object CrashlyticsGetInstanceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    strings = listOf("FirebaseCrashlytics component is not present."),
    custom = { method, classDef -> method.returnType == classDef.type },
)

// The push "received" beacon (6.238: GuardianMessagingService$sendReceiveEventTracking$2
// .invokeSuspend): it posts the notification id and provider to the mobile-events API and
// returns the HTTP status as a Boolean. The notification itself is shown before it runs.
internal object PushReceivedBeaconFingerprint : Fingerprint(
    returnType = OBJECT,
    parameters = listOf(OBJECT),
    strings = listOf("https://mobile-events.guardianapis.com/notification/received?platform=android"),
    custom = { method, _ -> method.implementation != null },
)

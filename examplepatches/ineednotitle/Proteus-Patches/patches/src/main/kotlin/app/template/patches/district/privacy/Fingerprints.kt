package app.template.patches.district.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprints for District by Zomato 2.76.0 (versionCode 1000027600).
 *
 * Anchoring strategy: every fingerprint pins its definingClass exactly and
 * targets a name+signature verified by hand in full 2.76.0 decompilation
 * (9 dexes of the official APKPure XAPK). The app is additionally locked to
 * this exact version + official signing certificate via
 * DISTRICT_COMPATIBILITY, so obfuscation-proof caveats do not apply here —
 * if any anchor moves, DISTRICT_COMPATIBILITY rejects the APK before the
 * fingerprint could mis-match. Where the target method body contains unique
 * const-strings (FIREBASE_EVENT_FIRED etc.) they are added as string
 * filters for defense in depth.
 *
 * ── How to re-verify after a District update ──────────────────────────────
 *   (decompile the base apk, then search the smali and smali_classesN dirs)
 *   grep -rln '"FIREBASE_EVENT_FIRED"' smali smali_classes2 | grep gooutandroid
 *   grep -rln '"AppVersion"' smali | grep init/clevertap
 *   grep -rn 'internal/location/j;->b(' smali | grep 'edition/location'
 * ──────────────────────────────────────────────────────────────────────────
 */

private const val GOOUT = "Lcom/application/zomato/gooutandroid"
private const val EDITION = "Lcom/edition"

/* ───────────────────────────── Patch 1: analytics ─────────────────────────── */

/**
 * EventsUtil.b(Event) — THE app's sole fan-out for Firebase Analytics +
 * AppsFlyer in-app events.
 *
 * Verified 2.76.0: smali/com/application/zomato/gooutandroid/init/tracking/c.smali
 * :157–459 (`FirebaseAnalytics->getInstance(...)` :210, measurement
 * `ta->o(bundle)` :261, `AppsFlyerLib->logEvent(...)` :435). The UIKit event
 * pipeline (init/atomic/UIKitDataTrackerProviderImpl$execute$2.smali
 * :957/:1083/:1287 and init/atomic/c.smali :2051) routes every app event
 * through this method — one prologue kill silences both vendors app-wide.
 */
object DistrictEventsTrackFingerprint : Fingerprint(
    definingClass = "$GOOUT/init/tracking/c;",
    name = "b",
    returnType = "V",
    parameters = listOf("Lcom/zomato/commons/common/f;"),
    filters = listOf(
        string("FIREBASE_EVENT_FIRED")
    )
)

/**
 * EventsUtil.a(Event, error, extraProperties) — error/exception reporting
 * ladder that fires FIREBASE_EVENT_EXCEPTION events through the same pipe.
 */
object DistrictEventsExceptionFingerprint : Fingerprint(
    definingClass = "$GOOUT/init/tracking/c;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/zomato/commons/common/f;", "Ljava/lang/String;", "Ljava/util/Map;"),
    filters = listOf(
        string("FIREBASE_EVENT_EXCEPTION"),
        string("event_name")
    )
)

/**
 * CleverTap wrapper a(Identity) — writes the identity + device fingerprint
 * (consts verified: "Application"/"AppVersion"/"DeviceModel"/"Mobile"/
 * "OSVersion"/"Platform"/"os") into the event properties map, then flushes
 * via `CleverTapAPI->n(String, HashMap)` (pushEvent) at :230 — all of this
 * lives INSIDE method a (74–238) in 2.76.0.
 */
object DistrictCleverTapIdentityFingerprint : Fingerprint(
    definingClass = "$GOOUT/init/clevertap/b;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/eternal/dining/reviews/data/a;"),
    filters = listOf(
        string("AppVersion"),
        string("DeviceModel")
    )
)

/**
 * CleverTap wrapper b(properties: Map) — profile-properties push: grabs the
 * singleton (`clevertap/b->a`), walks `CleverTapAPI.b:d1 -> d1.g:r` and calls
 * `r->o(Map)` (profile push). Body is 5 instructions with NO const-strings —
 * verified 2.76.0 lines 239–275 — so this pins class+name+signature only
 * (class-exact pin makes that unique; a wrong string filter here is what
 * broke v1.3.0 on-device).
 */
object DistrictCleverTapEventFingerprint : Fingerprint(
    definingClass = "$GOOUT/init/clevertap/b;",
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/util/Map;")
)

/**
 * AppsFlyer concrete SDK `AFb1tSDK.start(Context)` — belt-and-braces kill so
 * the SDK never begins its session/UA beacon. DistrictApp.onCreate inits
 * AppsFlyer directly (verified :5318–:5517); onCreate itself can NOT be
 * early-returned without breaking the whole app, so we sever at the SDK's
 * own entry. Defined abstractly on Lcom/appsflyer/AppsFlyerLib; (no body) —
 * the definingClass pin is what keeps that abstract twin from tripping us.
 */
object DistrictAppsFlyerStartFingerprint : Fingerprint(
    definingClass = "Lcom/appsflyer/internal/AFb1tSDK;",
    name = "start",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/** AFb1tSDK.start(Context, String) — two-arg variant used by re-engagement flows. */
object DistrictAppsFlyerStartKeyFingerprint : Fingerprint(
    definingClass = "Lcom/appsflyer/internal/AFb1tSDK;",
    name = "start",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)

/**
 * In-house crash-report enqueue crashlogger.d.a(Throwable) — the app funnels
 * every caught throwable through `Lcom/application/edition/commons/crashlogger/d`
 * (a→executor.execute(crashlogger/a)) which forwards them off-device as part
 * of its telemetry. Killing the enqueue is data-collection hygiene per the
 * patch name.
 */
object DistrictCrashLogThrowableFingerprint : Fingerprint(
    definingClass = "Lcom/application/edition/commons/crashlogger/d;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

/** crashlogger.d.b(String) — message-only report variant. */
object DistrictCrashLogMessageFingerprint : Fingerprint(
    definingClass = "Lcom/application/edition/commons/crashlogger/d;",
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/** crashlogger.d.c(String) — message-only report variant (tag-style). */
object DistrictCrashLogTagFingerprint : Fingerprint(
    definingClass = "Lcom/application/edition/commons/crashlogger/d;",
    name = "c",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/* ──────────────────────────── Patch 2: location tracking ──────────────────── */

/**
 * LocationKit.i(fragmentHost) — hot-standby location subscription: builds a
 * GMS LocationRequest and registers the callback via
 * `Lcom/google/android/gms/internal/location/j;->b(request, callback, looper)`
 * (verified 2.76.0 smali/com/edition/location/e.smali :2117–2336, subscribe at
 * :2310). This is the only fused-location update subscription in the app —
 * killing it stops continuous/passive tracking ("Been here" geo-detection etc.).
 */
object DistrictLocationUpdatesFingerprint : Fingerprint(
    definingClass = "$EDITION/location/e;",
    name = "i",
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/v;")
)

/**
 * LocationKit.b(Context, Continuation) — suspending one-shot GPS fetch
 * (`fetchAndUpdateGpsLocation`; the inner coroutine class
 * LocationKit\$fetchAndUpdateGpsLocation\$1 does the GMS call). Early-returns
 * null, which every call site already guards as "Location not available"
 * (verified guard/toast path in LocationFetchManager.smali :930 area) —
 * fail-open by design; manual city/area selection is untouched.
 */
object DistrictLocationFetchFingerprint : Fingerprint(
    definingClass = "$EDITION/location/e;",
    name = "b",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
)

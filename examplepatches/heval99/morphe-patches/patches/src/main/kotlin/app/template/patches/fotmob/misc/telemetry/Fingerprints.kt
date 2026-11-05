package app.template.patches.fotmob.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// The "firebase_analytics_collection_deactivated" read fingerprint is shared with Sofascore:
// shared/misc/telemetry/FirebaseAnalyticsDeactivated.kt (jrg.L()Z in 239).

// Firebase Analytics: every app event funnels through the Google Measurement SDK entry point
// AppMeasurementSdk.logEvent(String, String, Bundle), a public library API R8 keeps by name
// (one overload, with code, in 239).
internal object GmsMeasurementLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;"),
)

/**
 * FotMob's AppsFlyer start-up coroutine (240: rb5.invokeSuspend): it reads the Remote Config
 * boolean "enable_appsflyer_sdk" (default true) with a static (String, boolean)boolean getter and,
 * when it is false, logs "AppsFlyer SDK is disabled in Remote Config. Not initializing." and
 * returns; otherwise it calls AppsFlyerLib.init. FotMobApp.onCreate also holds the key (as a
 * Remote Config default) but has neither the getter call nor AppsFlyerLib.init.
 */
internal object AppsFlyerInitGateFingerprint : Fingerprint(
    filters = listOf(
        string("enable_appsflyer_sdk"),
        methodCall(parameters = listOf("Ljava/lang/String;", "Z"), returnType = "Z", location = MatchAfterWithin(2)),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        methodCall(definingClass = "Lcom/appsflyer/AppsFlyerLib;", name = "init"),
    ),
)

/**
 * androidx.emoji2's startup initializer (EmojiCompatInitializer.create(Context), run by the
 * androidx-startup InitializationProvider on every cold start): it configures EmojiCompat and
 * schedules the emoji font load. Kept by name (androidx-startup instantiates it from manifest
 * meta-data).
 */
internal object EmojiCompatInitializerFingerprint : Fingerprint(
    definingClass = "Landroidx/emoji2/text/EmojiCompatInitializer;",
    name = "create",
    parameters = listOf("Landroid/content/Context;"),
)

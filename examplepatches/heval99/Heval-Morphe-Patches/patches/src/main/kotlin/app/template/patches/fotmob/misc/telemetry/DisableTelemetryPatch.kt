package app.template.patches.fotmob.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// The concrete AppsFlyer implementation (AFa1tSDK in 239) subclasses the public AppsFlyerLib,
// which only declares abstract methods. These are the entry points that send data; the push
// APIs (sendPushNotificationData, ...) are left alone.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

// FirebaseCrashlytics is R8-renamed and merged in this build, so its data collection arbiter is
// located at patch time by the SharedPreferences key it reads.
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // 1. AppsFlyer: start, every logEvent overload, logSession and logAdRevenue (the
        // Sofascore patch's approach), so the SDK never starts sending.
        var appsFlyerStart = 0
        classDefForEach { classDef ->
            if (classDef.superclass != APPSFLYER_LIB) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    if (it.name == "start") appsFlyerStart++
                    it.returnEarly()
                }
        }
        if (appsFlyerStart == 0) throw PatchException("No AppsFlyerLib implementation of start() found")

        // 2. Firebase Analytics: the manifest switch "firebase_analytics_collection_deactivated"
        // reads as true (shared with Sofascore), and every remaining app event funnels through
        // the Google Measurement SDK entry point.
        forceAnalyticsDeactivated()
        val logEvent = GmsMeasurementLogEventFingerprint.method
        if (logEvent.implementation == null) {
            throw PatchException("AppMeasurementSdk.logEvent has no implementation")
        }
        logEvent.returnEarly()

        // 3. Crashlytics: R8 merged the SDK into shared classes, so the two classes holding the
        // collection-enabled key also carry unrelated code (239: e93 is the DataCollectionArbiter,
        // hai a helper bag whose static n()Z is an SDK_INT >= 26 check with ten callers). Only
        // the arbiter's isAutomaticDataCollectionEnabled() is forced false: the synchronized
        // no-arg boolean (dex marks Java synchronized methods DECLARED_SYNCHRONIZED). Nothing
        // is uploaded while it is false; non-fatal reporting is left alone.
        val arbiterGetters = classDefByStrings(CRASHLYTICS_COLLECTION_KEY).flatMap { classDef ->
            mutableClassDefBy(classDef).methods.filter {
                it.implementation != null &&
                    it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    (AccessFlags.DECLARED_SYNCHRONIZED.isSet(it.accessFlags) ||
                        AccessFlags.SYNCHRONIZED.isSet(it.accessFlags))
            }
        }
        val arbiter = arbiterGetters.singleOrNull()
            ?: throw PatchException(
                "Expected one synchronized ()Z Crashlytics collection getter, found " +
                    arbiterGetters.map { "${it.definingClass}->${it.name}" }
            )
        arbiter.returnEarly(false)

        // 2026-11-03 (startup work, validated before the edits below):
        // 4. Firebase Remote Config real-time updates: the realtime HTTP client (found by its
        // stream path; 240: p82) never opens its long-lived connection: its synchronized (J)V that
        // schedules the connection after a delay returns at once. Normal fetch and activate on app
        // start are a different class and still run, so config still arrives at each start.
        val realtimeClients = classDefByStrings(REMOTE_CONFIG_REALTIME_PATH).toList()
        val realtimeClient = realtimeClients.singleOrNull()
            ?: throw PatchException("Expected one Remote Config realtime client, found ${realtimeClients.map { it.type }}")
        val schedulers = mutableClassDefBy(realtimeClient).methods.filter {
            it.implementation != null && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("J") &&
                (AccessFlags.DECLARED_SYNCHRONIZED.isSet(it.accessFlags) || AccessFlags.SYNCHRONIZED.isSet(it.accessFlags))
        }
        val scheduler = schedulers.singleOrNull()
            ?: throw PatchException("Expected one synchronized (J)V in ${realtimeClient.type}, found ${schedulers.map { it.name }}")

        // 5. AppsFlyer is not initialised at all: the "enable_appsflyer_sdk" Remote Config value
        // reads as false right after its getter, FotMob's own "AppsFlyer SDK is disabled" path.
        // (Step 1 already stops it sending; this skips its start-up work.) Side effect: AppsFlyer
        // OneLink deep links (click.fotmob.com) are no longer resolved in the app.
        val appsFlyerGate = AppsFlyerInitGateFingerprint.method
        val moveResult = AppsFlyerInitGateFingerprint.instructionMatches[2].index
        val flagRegister = appsFlyerGate.getInstruction<OneRegisterInstruction>(moveResult).registerA
        appsFlyerGate.requireNoBranchTargetAt(moveResult + 1, "AppsFlyer init flag")

        // 6. androidx.emoji2 is not set up at start: EmojiCompatInitializer.create returns TRUE
        // without configuring EmojiCompat. Text then draws emoji with the system font, as it does
        // where EmojiCompat is not configured (androidx and Compose check isConfigured() first).
        val emojiInit = EmojiCompatInitializerFingerprint.method
        if (emojiInit.implementation == null || emojiInit.returnType != "Ljava/lang/Object;") {
            throw PatchException("EmojiCompatInitializer.create is not a concrete Object-returning method")
        }

        scheduler.returnEarly()
        appsFlyerGate.addInstructionsChecked(
            moveResult + 1,
            if (flagRegister < 16) "const/4 v$flagRegister, 0x0" else "const/16 v$flagRegister, 0x0",
        )
        emojiInit.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}

private const val REMOTE_CONFIG_REALTIME_PATH = "/namespaces/firebase:streamFetchInvalidations"

package app.template.patches.livescore.misc.telemetry

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_LIVESCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.telemetry.forceFirebaseManifestSwitches

// Push notifications must keep working, so nothing here touches Firebase Messaging, Firebase
// Installations, XtremePush (NotificationService, initXPush) or AppsFlyer's
// updateServerUninstallToken. UniversalAnalyticsImpl.enableAnalytics is left alone too: it hands
// the Segment anonymous id to push.

private const val ANALYTICS = "Lcom/livescore/analytics/"
private const val UNIVERSAL_ANALYTICS = "${ANALYTICS}UniversalAnalyticsImpl;"

// The first-party analytics funnel. Every event, screen view, identify call, deeplink and Clarity
// event goes through these methods, which keep their names (the Kotlin value-class mangled ones
// carry a hash suffix, so they are matched by prefix). All are void and must exist.
private val FUNNEL_EXACT = listOf(
    "track" to listOf("Lcom/livescore/analytics/UniversalEvent;"),
    "trackDeeplink" to listOf("Landroid/content/Intent;", "Landroid/net/Uri;"),
    "trackMSClarityEvent" to listOf("Ljava/lang/String;"),
    "trackScreen" to listOf("Lcom/livescore/analytics/ScreenTrackData;"),
)
private val FUNNEL_PREFIXES = listOf("fireScreenViewEvent", "updateIdentify")

// SDK enables: the boolean arguments are forced false at entry. The methods still run, so the
// instances (and the ids the app reads from them) keep existing. Each entry is
// class, method name, parameter list.
private class EnableOverride(val owner: String, val name: String, val parameters: List<String>)

private val ENABLE_OVERRIDES = listOf(
    EnableOverride("${ANALYTICS}FirebaseAnalyticsImpl;", "enable", listOf("Z")),
    EnableOverride("${ANALYTICS}SegmentAnalytics;", "enable", listOf("Z", "Z")),
    EnableOverride("${ANALYTICS}AmplitudeAnalytics;", "enableAnalytics", listOf("Z", "Z")),
    EnableOverride("${ANALYTICS}permutive/PermutiveAnalytics;", "enable", listOf("Z")),
)

// The concrete AppsFlyer implementation subclasses the public AppsFlyerLib, which only declares
// abstract methods. These are the entry points that send data.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "sendAdRevenue", "sendAdImpression")

// Microsoft Clarity keeps its public names. Boolean-returning statics answer Boolean.FALSE
// (what the SDK answers when it did not start); sendCustomEvent and setCustomTag return a
// primitive. Pure getters, pause and the mask calls are left alone.
private const val CLARITY = "Lcom/microsoft/clarity/Clarity;"
private val CLARITY_BOOLEAN_OBJECT_METHODS = listOf(
    "initialize", "resume", "consent", "startNewSession", "setCustomUserId",
    "setCustomSessionId", "setCurrentScreenName", "setOnSessionStartedCallback",
)
private val CLARITY_PRIMITIVE_METHODS = listOf("sendCustomEvent", "setCustomTag")

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_LIVESCORE)

    execute {
        // 1. First-party analytics funnel: every listed method returns at once, so no event,
        // screen view, identify call or deeplink reaches any analytics SDK.
        val universal = mutableClassDefByOrNull(UNIVERSAL_ANALYTICS)
            ?: throw PatchException("Disable telemetry: $UNIVERSAL_ANALYTICS not found")
        val funnel = universal.methods.filter { it.returnType == "V" && it.implementation != null }
        for ((name, parameters) in FUNNEL_EXACT) {
            val targets = funnel.filter { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters }
            if (targets.size != 1) throw PatchException("Disable telemetry: expected one $UNIVERSAL_ANALYTICS->$name$parameters, found ${targets.size}")
            targets.single().returnEarly()
        }
        for (prefix in FUNNEL_PREFIXES) {
            val targets = funnel.filter { it.name.startsWith("$prefix-") }
            if (targets.isEmpty()) throw PatchException("Disable telemetry: no $UNIVERSAL_ANALYTICS->$prefix-* found")
            targets.forEach { it.returnEarly() }
        }

        // 2. SDK enables: the Firebase Analytics (which also switches Crashlytics collection on at
        // runtime), Segment, Amplitude and Permutive enable calls run with false arguments.
        for (override in ENABLE_OVERRIDES) {
            val owner = mutableClassDefByOrNull(override.owner)
                ?: throw PatchException("Disable telemetry: ${override.owner} not found")
            val method = owner.methods.singleOrNull {
                it.name == override.name && it.returnType == "V" && it.implementation != null &&
                    it.parameterTypes.map(CharSequence::toString) == override.parameters
            } ?: throw PatchException("Disable telemetry: expected one ${override.owner}->${override.name}${override.parameters}")
            // The arguments are p1, p2, ... of an instance method (the checked helper fails
            // if a register does not fit const/4).
            method.addInstructionsChecked(
                0,
                override.parameters.indices.joinToString("\n") { "const/4 p${it + 1}, 0x0" },
            )
        }

        // 3. Firebase manifest switches in the bytecode: Analytics deactivated, Crashlytics
        // collection off, Sessions off and Performance off.
        forceFirebaseManifestSwitches(
            app = "LiveScore",
            analytics = true,
            crashlytics = true,
            sessions = true,
            performance = true,
        )

        // 4. AppsFlyer: start, every logEvent overload, logSession, sendAdRevenue and
        // sendAdImpression return at once on every concrete implementation.
        var appsFlyerStart = 0
        var appsFlyerLogEvent = 0
        classDefForEach { classDef ->
            if (classDef.superclass != APPSFLYER_LIB) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    if (it.name == "start") appsFlyerStart++
                    if (it.name == "logEvent") appsFlyerLogEvent++
                    it.returnEarly()
                }
        }
        if (appsFlyerStart == 0 || appsFlyerLogEvent == 0) {
            throw PatchException("No AppsFlyerLib implementation of start() and logEvent() found")
        }

        // 5. Microsoft Clarity (session recording).
        disableClarity()
    }
}

private fun BytecodePatchContext.disableClarity() {
    val clarity = mutableClassDefByOrNull(CLARITY)?.methods?.filter { it.implementation != null }
        ?: throw PatchException("Disable telemetry: $CLARITY not found")
    for (name in CLARITY_BOOLEAN_OBJECT_METHODS) {
        val methods = clarity.filter { it.name == name && it.returnType == "Ljava/lang/Boolean;" }
        if (methods.isEmpty()) throw PatchException("Clarity.$name returning Boolean not found")
        if (name == "initialize") {
            val firstParameters = methods.map { it.parameterTypes.firstOrNull()?.toString() }.toSet()
            if (firstParameters != setOf("Landroid/app/Activity;", "Landroid/content/Context;")) {
                throw PatchException("Clarity.initialize overloads are $firstParameters, expected Activity and Context")
            }
        }
        methods.forEach {
            // A static method: v0 is either a free local or p0, and both are dead at the return.
            if (it.implementation!!.registerCount < 1) throw PatchException("Clarity.$name has no register")
            it.addInstructionsChecked(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """.trimIndent(),
            )
        }
    }
    for (name in CLARITY_PRIMITIVE_METHODS) {
        val methods = clarity.filter { it.name == name && it.returnType == "Z" }
        if (methods.isEmpty()) throw PatchException("Clarity.$name returning boolean not found")
        methods.forEach { it.returnEarly(false) }
    }
}

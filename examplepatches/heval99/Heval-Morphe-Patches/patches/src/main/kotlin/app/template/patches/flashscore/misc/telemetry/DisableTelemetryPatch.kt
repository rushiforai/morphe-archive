package app.template.patches.flashscore.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.flashscore.shared.ForcedConfigValue
import app.template.patches.flashscore.shared.forceRemoteConfigValues
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

// Push notifications must keep working, so nothing here touches Firebase Messaging, Firebase
// Installations, the app's notification code or the OneTrust consent flow. AppsFlyer's push APIs
// (sendPushNotificationData, updateServerUninstallToken, ...) are left alone too.

// The concrete AppsFlyer implementation (AFa1tSDK) subclasses the public AppsFlyerLib, which only
// declares abstract methods. These are the entry points that send data.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

// Crashlytics is R8-renamed. Two classes reference this SharedPreferences key: the app's
// Crashlytics wrapper and the data-collection arbiter (merged by R8 with an unrelated Room
// helper, which has no ()Z or (Throwable)V methods).
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

// The app's Crashlytics wrapper throws this when the component is missing; its no-arg method
// that writes the key above is setCrashlyticsCollectionEnabled(true).
private const val CRASHLYTICS_WRAPPER_MARKER = "FirebaseCrashlytics component is not present."

// Apptentive (in-app feedback and surveys) keeps its public API names.
private const val APPTENTIVE = "Lapptentive/com/android/feedback/Apptentive;"

// Microsoft Clarity is not obfuscated. These are its static entry points, grouped by return type:
// the Boolean-returning ones answer Boolean.FALSE, sendCustomEvent and setCustomTag (primitive Z)
// answer false. Pure getters and pause/unmask calls are left alone.
private const val CLARITY = "Lcom/microsoft/clarity/Clarity;"
private val CLARITY_BOOLEAN_OBJECT_METHODS = listOf(
    "initialize", "resume", "consent", "startNewSession", "setCustomUserId",
    "setCustomSessionId", "setCurrentScreenName", "setOnSessionStartedCallback",
)
private val CLARITY_PRIMITIVE_METHODS = listOf("sendCustomEvent", "setCustomTag")

// The app's remote-config keys for Clarity, forced at build time (this patch has no runtime switch).
private const val TELEMETRY_HELPER_NAME = "morpheTelemetryGet"
private val CLARITY_KEYS = linkedMapOf(
    "CLARITY_ENABLED" to ForcedConfigValue.FALSE,
    "CLARITY_PROJECT_ID" to ForcedConfigValue.EMPTY_STRING,
)

/**
 * Turns off Firebase Analytics, Performance Monitoring, advertising ID collection and Facebook's
 * automatic event logging through their manifest switches. The Facebook SDK itself stays
 * initialized, because Facebook Login uses it.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_performance_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            )) {
                // google_analytics_adid_collection_enabled already ships as true: overwrite it.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        // 1. AppsFlyer: start, every logEvent overload, logSession and logAdRevenue.
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

        // 2. Crashlytics: collection reads as disabled, non-fatals are dropped and the app can
        // no longer switch collection back on.
        val crashlyticsClasses = classDefByStrings(CRASHLYTICS_COLLECTION_KEY)
        if (crashlyticsClasses.isEmpty()) throw PatchException("No class references $CRASHLYTICS_COLLECTION_KEY")
        for (classDef in crashlyticsClasses) {
            val crashlytics = mutableClassDefBy(classDef)
            crashlytics.methods
                .filter { it.implementation != null }
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
                .forEach { it.returnEarly(false) }
            crashlytics.methods
                .filter { it.implementation != null }
                .filter {
                    it.returnType == "V" &&
                        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Throwable;")
                }
                .forEach { it.returnEarly() }
        }
        val wrapper = classDefByStrings(CRASHLYTICS_WRAPPER_MARKER).singleOrNull()
            ?: throw PatchException("Crashlytics wrapper ($CRASHLYTICS_WRAPPER_MARKER) not found")
        val enableCollection = mutableClassDefBy(wrapper).methods.singleOrNull { method ->
            method.name != "<init>" && method.returnType == "V" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        CRASHLYTICS_COLLECTION_KEY
                } == true
        } ?: throw PatchException("Crashlytics wrapper has no setCrashlyticsCollectionEnabled(true) method")
        enableCollection.returnEarly()

        // 3. Apptentive: never registers and never engages (sends) events. Every overload is
        // void; the static ones delegate to the instance register / private engage.
        val apptentive = mutableClassDefBy(APPTENTIVE).methods
            .filter { (it.name == "register" || it.name == "engage") && it.returnType == "V" }
            .filter { it.implementation != null }
        if (apptentive.none { it.name == "register" } || apptentive.none { it.name == "engage" }) {
            throw PatchException("Apptentive register/engage not found")
        }
        apptentive.forEach { it.returnEarly() }

        // 4. Microsoft Clarity (session recording): the SDK keeps its public names. Every entry point
        // that starts, configures or feeds it answers "false" (the SDK's own result when it did not
        // start), so nothing is recorded or uploaded. initialize has an Activity and a Context
        // overload; both must exist.
        val clarity = mutableClassDefBy(CLARITY).methods.filter { it.implementation != null }
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
                // A static method: p0 (or v0 when there is a local) is free to hold the result.
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

        // 5. Clarity's remote-config switches: disabled with no project id. The app's own gate for
        // starting the SDK reads these, so it never gets as far as the calls above.
        forceRemoteConfigValues(
            patchName = "Disable telemetry",
            helperName = TELEMETRY_HELPER_NAME,
            forced = CLARITY_KEYS,
            required = CLARITY_KEYS.keys,
        )
    }
}

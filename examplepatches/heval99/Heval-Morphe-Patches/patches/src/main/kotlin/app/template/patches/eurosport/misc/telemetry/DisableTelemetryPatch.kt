package app.template.patches.eurosport.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.eurosport.shared.TELEMETRY_SDKS
import app.template.patches.eurosport.shared.constZero
import app.template.patches.eurosport.shared.disableSdkConfigs
import app.template.patches.eurosport.shared.insertBefore
import app.template.patches.eurosport.shared.singleStore
import app.template.patches.shared.Constants.COMPATIBILITY_EUROSPORT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

// Push notifications (Firebase Messaging and Batch) and Firebase Remote Config must keep working,
// so nothing here touches them. These SDKs keep their public class and method names.
private const val COMSCORE_ANALYTICS = "Lcom/comscore/Analytics;"
private const val NEW_RELIC = "Lcom/newrelic/agent/android/NewRelic;"
private const val APPTENTIVE = "Lapptentive/com/android/feedback/Apptentive;"
private const val STORYTELLER_EVENT_TRACKING_OPTIONS = "Lcom/storyteller/Storyteller\$StorytellerEventTrackingOptions;"
private const val CONTEXT = "Landroid/content/Context;"

// The concrete AppsFlyer implementation (AFa1tSDK) subclasses the public AppsFlyerLib, which only
// declares abstract methods (AGENTS.md rule 2). These are the entry points that send data.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

// Storyteller's own tracking switches. enablePersonalization and enableRemoteViewingStore stay
// as the app sets them: they drive the content order and the "seen" state.
private val STORYTELLER_TRACKING_FIELDS = listOf(
    "enableStorytellerTracking",
    "enableUserActivityTracking",
    "enableAdTracking",
    "enableFullVideoAnalytics",
)

/** Firebase Analytics, advertising ID collection and Crashlytics collection off by manifest. */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_EUROSPORT)

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
                "google_analytics_adid_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
            )) {
                // None ships in 8.33.0; overwrite in place should a later build add one.
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
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_EUROSPORT)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        // 1. The remote kill switch reads ADOBE, APPSFLYER, CHARTBEAT, PERMUTIVE, MUX and
        // MEDIAMELON as off, so the app never starts those SDKs (Adobe, Mux and MediaMelon are
        // also the player's analytics trackers).
        disableSdkConfigs(TELEMETRY_SDKS)

        // 2. Comscore never starts and drops every notify call. ComscoreStartupInitializer still
        // registers the publisher configuration, which the consent update path reads.
        val comscore = mutableClassDefByOrNull(COMSCORE_ANALYTICS)?.methods?.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null
        } ?: throw PatchException("$COMSCORE_ANALYTICS not found")
        comscore.singleOrNull { it.name == "start" && it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT) }
            ?.returnEarly() ?: throw PatchException("$COMSCORE_ANALYTICS.start(Context) not found")
        comscore.filter { it.name.startsWith("notify") && !it.name.endsWith("Native") }.forEach { it.returnEarly() }

        // 3. New Relic: the agent never starts. Its static API (recordCustomEvent, ...) works
        // without a started agent.
        mutableClassDefByOrNull(NEW_RELIC)?.methods?.singleOrNull {
            it.name == "start" && it.returnType == "V" && it.implementation != null &&
                !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
        }?.returnEarly() ?: throw PatchException("$NEW_RELIC.start(Context) not found")

        // 4. AppsFlyer: start, every logEvent overload, logSession and logAdRevenue.
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

        // 5. Apptentive: never registers and never engages (sends) events. Every overload is
        // void; the static ones delegate to the instance register / private engage.
        val apptentive = mutableClassDefByOrNull(APPTENTIVE)?.methods
            ?.filter { (it.name == "register" || it.name == "engage") && it.returnType == "V" }
            ?.filter { it.implementation != null }
            ?: throw PatchException("$APPTENTIVE not found")
        if (apptentive.none { it.name == "register" } || apptentive.none { it.name == "engage" }) {
            throw PatchException("Apptentive register/engage not found")
        }
        apptentive.forEach { it.returnEarly() }

        // 6. Storyteller's event tracking options store false for its own tracking, user
        // activity, ad tracking and full video analytics, whatever the app passes.
        val trackingOptions = mutableClassDefByOrNull(STORYTELLER_EVENT_TRACKING_OPTIONS)?.methods?.singleOrNull {
            it.name == "<init>" && it.implementation != null &&
                it.parameterTypes.joinToString("") == "ZZZZZZLjava/util/List;"
        } ?: throw PatchException("$STORYTELLER_EVENT_TRACKING_OPTIONS.<init>(ZZZZZZList) not found")
        STORYTELLER_TRACKING_FIELDS
            .map { trackingOptions.singleStore(Opcode.IPUT_BOOLEAN, it, "Z") }
            // Insert from the last store up, so the earlier indices stay valid.
            .sortedByDescending { it.first }
            .forEach { (index, register) -> trackingOptions.insertBefore(index, constZero(register)) }
    }
}

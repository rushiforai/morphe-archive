package app.polishapps.patches.inpost.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.polishapps.patches.inpost.shared.constructorStrings
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleClass
import app.polishapps.patches.shared.Constants.COMPATIBILITY_INPOST
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private val manifestFlags = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)

private val manifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_INPOST)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = application.getElementsByTagName("meta-data")
            manifestFlags.forEach { (name, value) ->
                val existing = (0 until metaData.length)
                    .map { metaData.item(it) as Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                val element = existing ?: manifest.createElement("meta-data").also { created ->
                    created.setAttribute("android:name", name)
                    application.appendChild(created)
                }
                element.setAttribute("android:value", value)
            }
        }
    }
}

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry",
    description = "Blocks app analytics, Firebase Analytics, Crashlytics and Performance, Microsoft Clarity " +
        "session recording, Adjust, Facebook app events and Synerise event tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INPOST)

    dependsOn(manifestPatch)

    execute {
        val dispatcher = singleClass("analytics event logger") { classDef ->
            classDef.constructorStrings().containsAll(
                listOf("platformAnalyticsClient", "syneriseAnalyticsClient", "attributionAnalyticsClient"),
            )
        }
        methodsOf(dispatcher) { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames().let { types ->
                    types.size == 4 && types[0] == "Ljava/util/List;" && types[2] == "Ljava/util/Map;"
                }
        }.singleOrNull()?.prependReturn("return-void")
            ?: throw PatchException("${dispatcher.type}: dispatch method not found")

        val clarity = singleClass("Clarity initializer") { classDef ->
            classDef.constructorStrings().containsAll(listOf("appBuildConfig", "clarityConfig"))
        }
        methodsOf(clarity) { method ->
            method.returnType == "V" && method.parameterTypeNames() == listOf("Landroid/app/Application;")
        }.singleOrNull()?.prependReturn("return-void")
            ?: throw PatchException("${clarity.type}: initialize method not found")

        val adjust = classDefBy("Lcom/adjust/sdk/Adjust;")
        val adjustMethods = setOf(
            "initSdk",
            "enable",
            "trackEvent",
            "trackAdRevenue",
            "trackThirdPartySharing",
            "trackMeasurementConsent",
            "trackPlayStoreSubscription",
        )
        val stubbed = methodsOf(adjust) { method ->
            method.name in adjustMethods && method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags)
        }
        if (stubbed.size < adjustMethods.size) {
            throw PatchException("Adjust: expected ${adjustMethods.size} methods, found ${stubbed.size}")
        }
        stubbed.forEach { it.prependReturn("return-void") }

        val tracker = classDefBy("Lcom/synerise/sdk/event/Tracker;")
        methodsOf(tracker) { method ->
            (method.name == "send" && method.parameterTypeNames() == listOf("Lcom/synerise/sdk/event/Event;")) ||
                (method.name == "flush" && method.parameterTypes.isEmpty())
        }.also { if (it.size != 2) throw PatchException("Synerise Tracker: send/flush not found") }
            .forEach { it.prependReturn("return-void") }
    }
}

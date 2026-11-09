package app.polishapps.patches.zabka.telemetry

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_ZABKA
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private val manifestFlags = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)

private const val CCT_BACKEND = "backend:com.google.android.datatransport.cct.CctBackendFactory"

private val manifestPatch = resourcePatch(
    description = "Turns off Firebase Analytics and Facebook app events and unregisters the datatransport upload backend.",
) {
    compatibleWith(COMPATIBILITY_ZABKA)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = manifest.getElementsByTagName("meta-data")
            val all = (0 until metaData.length).map { metaData.item(it) as Element }

            manifestFlags.forEach { (name, value) ->
                val element = all.firstOrNull { it.getAttribute("android:name") == name }
                    ?: manifest.createElement("meta-data").also { created ->
                        created.setAttribute("android:name", name)
                        application.appendChild(created)
                    }
                element.setAttribute("android:value", value)
            }

            val backend = all.firstOrNull { it.getAttribute("android:name") == CCT_BACKEND }
                ?: throw PatchException("$CCT_BACKEND not found in AndroidManifest.xml")
            backend.parentNode.removeChild(backend)
        }
    }
}

private fun BytecodePatchContext.method(classType: String, name: String, vararg parameters: String): MutableMethod =
    methodsOf(classDefBy(classType)) { method ->
        method.name == name && method.parameterTypeNames() == parameters.toList()
    }.singleOrNull() ?: throw PatchException("$classType->$name(${parameters.joinToString("")}) not found")

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry",
    description = "Blocks the Żabka CDP event pipeline (device, root, network and carrier data attached to every " +
        "event), Sentry, AppsFlyer, Synerise event tracking, Firebase Analytics, Facebook app events and " +
        "Google datatransport uploads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZABKA)

    dependsOn(manifestPatch)

    execute {
        val cdpSdk = "Lpl/zabka/cdpclientsdk/api/CdpClientSdk;"
        val cdpMethods = mapOf(
            "sendEvent" to listOf("Lpl/zabka/cdpclientsdk/api/events/CdpEvent;"),
            "flush" to emptyList(),
            "setUserSignedIn" to listOf("Ljava/lang/String;"),
            "setUserSignedOut" to emptyList(),
        )
        val cdpImplementations = findClasses { cdpSdk in it.interfaces }
        if (cdpImplementations.isEmpty()) throw PatchException("No $cdpSdk implementation found")
        cdpImplementations.forEach { implementation ->
            val stubbed = methodsOf(implementation) { method ->
                method.returnType == "V" && cdpMethods[method.name] == method.parameterTypeNames()
            }
            if (stubbed.size != cdpMethods.size) {
                throw PatchException("${implementation.type}: expected ${cdpMethods.size} CDP methods, found ${stubbed.size}")
            }
            stubbed.forEach { it.prependReturn("return-void") }
        }

        singleMethod("Sentry initializer") { _, method ->
            method.returnType == "V" &&
                method.parameterTypes.isEmpty() &&
                method.strings().let { "SentryAndroid.init" in it && "setSentryUser" in it }
        }.prependReturn("return-void")

        val tracingHelper = singleMethod("Sentry transaction context helper") { _, method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType.startsWith("Lio/sentry/") &&
                method.parameterTypeNames() == listOf("Ljava/lang/String;", "Ljava/lang/String;") &&
                "Sentry scope was not configured" in method.strings()
        }
        val transactionContext = tracingHelper.returnType
        val contextConstructor = classDefBy(transactionContext).methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypeNames().let { types ->
                types.size == 4 && types[0] == "Ljava/lang/String;" && types[2] == "Ljava/lang/String;" &&
                    types[1].startsWith("Lio/sentry/protocol/")
            }
        } ?: throw PatchException("$transactionContext: (String, TransactionNameSource, String, ...) constructor not found")
        val (nameSource, samplingDecision) = contextConstructor.parameterTypeNames().let { it[1] to it[3] }
        tracingHelper.prependReturn(
            """
                new-instance v0, $transactionContext
                sget-object v1, $nameSource->COMPONENT:$nameSource
                const/4 v2, 0x0
                invoke-direct {v0, p0, v1, p1, v2}, $transactionContext-><init>(Ljava/lang/String;${nameSource}Ljava/lang/String;$samplingDecision)V
                return-object v0
            """,
        )

        val appsFlyer = findClasses { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }.singleOrNull()?.type
            ?: throw PatchException("AppsFlyerLib implementation not found")
        listOf(
            arrayOf("start"),
            arrayOf("start", "Lcom/appsflyer/share/attribution/AppsFlyerRequestListener;"),
            arrayOf("logEvent", "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;"),
            arrayOf(
                "logEvent",
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Ljava/util/Map;",
                "Lcom/appsflyer/share/attribution/AppsFlyerRequestListener;",
            ),
            arrayOf("logSession", "Landroid/content/Context;"),
            arrayOf("logLocation", "Landroid/content/Context;", "D", "D"),
            arrayOf("logAdRevenue", "Lcom/appsflyer/share/AFAdRevenueData;", "Ljava/util/Map;"),
            arrayOf("sendPushNotificationData", "Landroid/app/Activity;"),
            arrayOf("sendPushNotificationData", "Lcom/appsflyer/share/AFPushData;"),
            arrayOf("updateServerUninstallToken", "Landroid/content/Context;", "Ljava/lang/String;"),
        ).forEach { signature ->
            method(appsFlyer, signature[0], *signature.copyOfRange(1, signature.size)).prependReturn("return-void")
        }

        val tracker = "Lcom/synerise/sdk/event/Tracker;"
        method(tracker, "send", "Lcom/synerise/sdk/event/Event;").prependReturn("return-void")
        method(tracker, "flush").prependReturn("return-void")
    }
}

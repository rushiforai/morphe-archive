package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val APPSFLYER_CORE = "Lcom/appsflyer/internal/AFa1tSDK;"

/** AppsFlyer entry points that start attribution or log an event; `init` returns the library, the rest return nothing. */
private val APPSFLYER_VOID = setOf("start", "logEvent")

/**
 * The app's own switch that turns Firebase Analytics collection back on at runtime, overriding the manifest: a static
 * `(boolean)` method that logs "setAnalyticsCollectionEnabled(". R8 renames it between releases, so it is found by
 * that string.
 */
private object EnableAnalyticsCollectionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith("setAnalyticsCollectionEnabled(") == true
        } == true
    },
)

/** Firebase's own manifest switches for Analytics, Crashlytics and Sessions. */
private val firebaseManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false",
            ).forEach { (name, value) ->
                application.appendChild(document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    it.setAttribute("android:value", value)
                })
            }
            // Firebase's upload pipeline finds its backends through this service's metadata. Disabled, it finds
            // none, so events queued by an earlier run are never sent either.
            val services = document.getElementsByTagName("service")
            (0 until services.length).map { services.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery" }
                .also { if (it.size != 1) throw PatchException("Smart Life: TransportBackendDiscovery not found in the manifest.") }
                .forEach { it.setAttribute("android:enabled", "false") }
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops AppsFlyer from tracking installs and in-app events, and turns off Firebase Analytics, " +
        "Crashlytics and Sessions. Tuya's own usage statistics are left on.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Privacy")
    dependsOn(signatureSpoofPatch, firebaseManifestPatch)

    execute {
        // The app turns Firebase Analytics collection on after login; without this it would override the manifest.
        EnableAnalyticsCollectionFingerprint.method.addInstructions(0, "return-void")

        var stubbed = 0
        classDefForEach { classDef ->
            if (classDef.type != APPSFLYER_CORE) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name == "init" && method.returnType == "Lcom/appsflyer/AppsFlyerLib;" -> {
                        method.addInstructions(0, "return-object p0")
                        stubbed++
                    }
                    method.name in APPSFLYER_VOID && method.returnType == "V" -> {
                        method.addInstructions(0, "return-void")
                        stubbed++
                    }
                }
            }
        }
        // init, three start overloads and two logEvent overloads.
        if (stubbed != 6) throw PatchException("Smart Life: expected 6 AppsFlyer entry points, found $stubbed")
    }
}

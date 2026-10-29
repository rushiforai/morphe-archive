package app.fakh.patches.dodo

import app.fakh.patches.dodo.shared.Constants.COMPATIBILITY_DODO
import app.fakh.patches.dodo.shared.disableComponents
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Static SDK entry points that MainApp.onCreate calls directly, so disabling their providers is not enough. */
private val TRACKER_INITS = mapOf(
    "Lcom/adjust/sdk/Adjust;" to setOf("initSdk"),
    "Lcom/tiktok/TikTokBusinessSdk;" to setOf("initializeSdk", "startTrack"),
)

/** Firebase's own manifest switches for Analytics (which every EventLogger event goes through), Crashlytics and Sessions. */
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
            document.disableComponents("service", "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery")
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops Adjust and TikTok from tracking installs and in-app events, and turns off Firebase " +
        "Analytics, Crashlytics and Sessions, which get every action you take in the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DODO)
    category("Privacy")
    dependsOn(firebaseManifestPatch)

    execute {
        var stubbed = 0
        classDefForEach { classDef ->
            val names = TRACKER_INITS[classDef.type] ?: return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.name in names && it.returnType == "V" }.forEach {
                it.addInstructions(0, "return-void")
                stubbed++
            }
        }
        // Adjust.initSdk, both TikTokBusinessSdk.initializeSdk overloads and startTrack.
        if (stubbed != 4) throw PatchException("Expected 4 tracker init methods, found $stubbed")
    }
}

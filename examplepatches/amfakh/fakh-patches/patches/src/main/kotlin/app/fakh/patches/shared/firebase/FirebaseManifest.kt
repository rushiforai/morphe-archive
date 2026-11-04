package app.fakh.patches.shared.firebase

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Firebase's own manifest switches for Analytics, Crashlytics, Performance and Sessions. */
internal fun firebaseManifestPatch() = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
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
                .also { if (it.size != 1) throw PatchException("TransportBackendDiscovery not found in the manifest.") }
                .forEach { it.setAttribute("android:enabled", "false") }
        }
    }
}

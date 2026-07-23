package patches.mytelenor

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/*
 * Manifest-flag companion to the bytecode blockTrackersPatch. Some auto-collection can't be cleanly
 * no-op'd in bytecode because it never runs through an app-called initializer — it's started by the
 * SDK's own ContentProvider / auto-init at process start and only steered by <meta-data> flags:
 *
 *   Firebase Analytics — auto screen/session/engagement events + advertiser-id. The in-house event
 *     dispatcher is already a dead no-op (notes/trackers-analytics.md) so the app makes no direct
 *     logEvent calls; collection here is purely automatic. Disabling it via meta-data avoids touching
 *     FirebaseApp.initializeApp (still needed for FCM push + RemoteConfig, which feeds the AdmobConfig
 *     the removeAdsPatch keys off).
 *   Facebook / Meta SDK — auto-init via the FacebookInitProvider ContentProvider (present in this
 *     manifest, alongside com.facebook.sdk.ApplicationId), which grabs the advertiser id and sends
 *     auto app-events without any app-called init to stub. The flags are the only clean off switch;
 *     the ContentProvider itself is left enabled since some login/share flows may use the FB SDK.
 *
 * Firebase and the Facebook SDK are both confirmed present in this build's AndroidManifest.xml.
 *
 * Kept SEPARATE from the bytecode "Block trackers" patch (which stops Insider / TikTok / session
 * replay at their init chokepoints) so users can opt into each independently. Upsert semantics:
 * overwrite the value if the flag already exists, otherwise append it under <application>.
 */
@Suppress("unused")
val blockTrackersResourcePatch = resourcePatch(
    name = "Block trackers (manifest flags)",
    description = "Disables Firebase Analytics + Google advertiser-id auto-collection and the Facebook " +
        "SDK's auto app-events / advertiser-id / auto-init via AndroidManifest <meta-data> flags — the " +
        "SDK-side auto-collection that no bytecode init-stub can reach. Leaves Firebase core (FCM push, " +
        "RemoteConfig) and the Facebook ContentProvider intact. Separate from the bytecode Block " +
        "trackers patch so you can pick either or both.",
) {
    compatibleWith(COMPATIBILITY_MYTELENOR)

    finalize {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0)

            fun setFlag(name: String, value: String) {
                val existing = doc.getElementsByTagName("meta-data")
                for (i in 0 until existing.length) {
                    val el = existing.item(i) as Element
                    if (el.getAttribute("android:name") == name) {
                        el.setAttribute("android:value", value)
                        return
                    }
                }
                val el = doc.createElement("meta-data")
                el.setAttribute("android:name", name)
                el.setAttribute("android:value", value)
                application.appendChild(el)
            }

            listOf(
                // Firebase Analytics auto-collection + Google advertiser-id.
                "firebase_analytics_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                // Facebook / Meta SDK auto app-events, advertiser-id and auto-init.
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "com.facebook.sdk.AutoInitEnabled" to "false",
            ).forEach { (name, value) -> setFlag(name, value) }
        }
    }
}

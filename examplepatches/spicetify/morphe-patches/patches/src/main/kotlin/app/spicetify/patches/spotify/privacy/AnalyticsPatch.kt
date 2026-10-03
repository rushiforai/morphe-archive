package app.spicetify.patches.spotify.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val HELPER = "Lapp/spicetify/extension/spotify/privacy/Analytics;->"

// Firebase respects these manifest switches at collection time. Crashlytics collection
// is explicitly enabled by Spotify's manifest; Firebase Analytics defaults to on; the
// Sessions SDK only reports while its Crashlytics subscriber has collection enabled.
internal val analyticsResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val metaData = manifest.getElementsByTagName("meta-data")
            for (index in 0 until metaData.length) {
                val node = metaData.item(index) as Element
                if (node.getAttribute("android:name") == "firebase_crashlytics_collection_enabled") {
                    node.setAttribute("android:value", "false")
                }
            }
            val application = manifest.getElementsByTagName("application").item(0)
            for (name in listOf(
                "firebase_analytics_collection_enabled",
                "firebase_analytics_collection_deactivated",
            )) {
                val flag = manifest.createElement("meta-data")
                flag.setAttribute("android:name", name)
                flag.setAttribute("android:value", if (name.endsWith("deactivated")) "true" else "false")
                application.appendChild(flag)
            }
            val permissions = manifest.getElementsByTagName("uses-permission")
            for (permission in listOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            )) {
                val node = (0 until permissions.length)
                    .map { permissions.item(it) as Element }
                    .singleOrNull { it.getAttribute("android:name") == permission }
                    ?: throw PatchException("Missing ad identifier permission: $permission")
                node.parentNode?.removeChild(node)
            }
        }
    }
}

@Suppress("unused")
val analyticsPatch = bytecodePatch(
    name = "Remove analytics and tracking",
    description = "Disables Spotify's own event pipeline and playback logging, comScore, " +
        "Facebook App Events, Firebase Analytics, Crashlytics, and the advertising ID. " +
        "Push notifications keep working.",
    default = true,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch, analyticsResourcesPatch)

    execute {
        // Every in-app event producer (features, UBI, accessories, and the native core via
        // EventSenderCoreBridgeImpl) still funnels into the original publish method: keeping
        // that path intact preserves the native event contract (the send ack resolves through
        // the database-write subscriber, and the native core misbehaves if it is shortcut).
        // Instead, skip the Room transaction that stores the event: it runs only from here,
        // and its caller already treats a return as success, so events flow through validation,
        // acks, and the flush triggers while the database stays empty and the flusher has
        // nothing to publish to gabo-receiver-service.
        val insert = mutableClassDefByOrNull("Lp/t4y;")?.methods?.singleOrNull {
            it.name == "a" && it.parameterTypes == listOf(
                "Ljava/lang/String;",
                "[B",
                "[B",
                "Z",
                "Ljava/lang/String;",
                "J",
            )
        } ?: throw PatchException("Spotify event insert p.t4y.a not found.")
        insert.addInstructions(0, "return-void")

        // Metrics snapshots bypass the funnel with an in-memory transport of their own.
        val metrics = mutableClassDefBy("Lcom/spotify/eventsender/corebridge/EventSenderCoreBridgeImpl;")
            .methods.singleOrNull {
                it.name == "queueMetricsDataSnapshotForSending" && it.parameterTypes == listOf("[B", "[B")
            } ?: throw PatchException("Metrics snapshot queue not found.")
        metrics.addInstructions(0, "return-void")

        // Never schedule the event-sender flush worker.
        val scheduler = mutableClassDefBy("Lp/p6y;").methods.singleOrNull {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "V"
        } ?: throw PatchException("Event sender worker schedule site not found.")
        scheduler.addInstructions(0, "return-void")

        // Playback logging RPC: answer with an error, which its subscriber already treats
        // as terminal, so nothing is reported and the request object is never re-sent.
        val pendingEvents = mutableClassDefBy("Lp/p1p0;").methods.singleOrNull {
            it.name == "a" &&
                it.parameterTypes == listOf("Lcom/spotify/pending_events/esperanto/proto/ReplacePendingEventRequest;")
        } ?: throw PatchException("Pending events RPC not found.")
        pendingEvents.addInstructions(
            0,
            """
                invoke-static {p1}, ${HELPER}noPendingEvents(Ljava/lang/Object;)Lio/reactivex/rxjava3/core/Single;
                move-result-object p1
                return-object p1
            """.trimIndent(),
        )

        // comScore streaming measurement (publisherId 15654041) reaches the SDK only through
        // this handler, so reporting a handled message keeps it from ever starting or notifying.
        val comScore = mutableClassDefBy("Lp/xtf;").methods.singleOrNull {
            it.name == "handleMessage" && it.parameterTypes == listOf("Landroid/os/Message;")
        } ?: throw PatchException("comScore message handler not found.")
        comScore.addInstructions(0, "const/4 v0, 0x1\n    return v0")

        // Facebook App Events: every logEvent variant funnels into this method.
        val facebook = mutableClassDefBy("Lp/ge5;").methods.singleOrNull {
            it.name == "z" && it.parameterTypes == listOf(
                "Ljava/lang/String;",
                "Ljava/lang/Double;",
                "Landroid/os/Bundle;",
                "Z",
                "Ljava/util/UUID;",
                "Lp/x9n0;",
            )
        } ?: throw PatchException("Facebook App Events funnel not found.")
        facebook.addInstructions(0, "return-void")
    }
}

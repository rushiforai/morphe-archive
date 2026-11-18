package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            check(applications.length == 1) { "Expected one Deezer application" }
            val application = applications.item(0) as Element

            fun meta(name: String, value: String) {
                val nodes = application.getElementsByTagName("meta-data")
                val matches = (0 until nodes.length).map { nodes.item(it) as Element }
                    .filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate Deezer manifest flag: $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name)
                    application.appendChild(it)
                }
                node.setAttributeNS(ANDROID, "android:value", value)
            }

            // Firebase Analytics, Crashlytics, Performance and Sessions defaults.
            meta("firebase_analytics_collection_enabled", "false")
            meta("firebase_analytics_collection_deactivated", "true")
            meta("google_analytics_automatic_screen_reporting_enabled", "false")
            meta("google_analytics_adid_collection_enabled", "false")
            meta("google_analytics_sgtm_upload_enabled", "false")
            meta("google_analytics_default_allow_analytics_storage", "false")
            meta("google_analytics_default_allow_ad_storage", "false")
            meta("google_analytics_default_allow_ad_user_data", "false")
            meta("google_analytics_default_allow_ad_personalization_signals", "false")
            meta("firebase_crashlytics_collection_enabled", "false")
            meta("firebase_performance_collection_deactivated", "true")
            meta("firebase_performance_collection_enabled", "false")
            meta("firebase_sessions_enabled", "false")
            meta("delivery_metrics_exported_to_big_query_enabled", "false")

            // Facebook is used for login; keep the provider, stop automatic event and
            // advertising-ID collection.
            meta("com.facebook.sdk.AutoInitEnabled", "false")
            meta("com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            meta("com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")

            val advertisingPermissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.AD_SERVICES_CONFIG",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                "com.adjust.preinstall.READ_PERMISSION",
            )
            val permissions = doc.getElementsByTagName("uses-permission")
            val removed = (0 until permissions.length).map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") in advertisingPermissions }
            check(removed.size == 9) {
                "Deezer advertising/attribution permission inventory changed: found ${removed.size}"
            }
            removed.forEach { it.parentNode.removeChild(it) }

            // The Facebook and Adjust manifest providers initialize their SDKs before
            // Application.onCreate; disable them so the patched initializers are final.
            listOf(
                "com.facebook.internal.FacebookInitProvider",
                "com.adjust.sdk.SystemLifecycleContentProvider",
            ).forEach { name ->
                val providers = doc.getElementsByTagName("provider")
                val matches = (0 until providers.length).map { providers.item(it) as Element }
                    .filter { it.getAttribute("android:name") == name }
                check(matches.size == 1) { "Expected one Deezer manifest provider $name, found ${matches.size}" }
                matches.single().setAttributeNS(ANDROID, "android:enabled", "false")
            }
        }
    }
}

@Suppress("unused")
val deezerDisableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables the inventoried Deezer analytics and attribution collectors: Adjust " +
        "initialization and events, Segment event delivery and its Braze destination, the Firebase " +
        "Analytics/Crashlytics/Performance/Sessions collectors, Facebook automatic app events and " +
        "advertising IDs. Sign-in, catalogue, playback and functional notifications are retained.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(originalInput, trackingResources, deezerKeepSessionOnColdStart)

    execute {
        // Adjust is never configured, so its lifecycle provider and event calls are inert.
        exact("LIIlIIIIIIIllIIII;", "lllIlllIlllIl", "V", "Landroid/content/Context;").method
            .addInstructions(0, "return-void")
        exact(
            "LIlllIlIlIIIIIIlI;",
            "lIllllIIIIII",
            "V",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Z",
            "Z",
        ).method.addInstructions(0, "return-void")

        // Segment's public event entry points and the central delivery method.
        exact(
            "LlllIIIllIll;",
            "IIllIIIlIIIllII",
            "V",
            "LlllIIIllIll;",
            "Ljava/lang/String;",
            "Lkotlinx/serialization/json/llIIlllIIlIlIII;",
            "I",
        ).method.addInstructions(0, "return-void")
        exact(
            "LlllIIIllIll;",
            "lIllIIIlIlIlll",
            "V",
            "Lcom/segment/analytics/kotlin/core/lIllllIIIIII;",
            "LIlIIlIIIlIlIllII;",
        ).method.addInstructions(0, "return-void")

        // Segment's Braze destination must not configure the Braze SDK.
        exact(
            "LIIlIlIlllIlllIl;",
            "lllIlIIIlllIIII",
            "V",
            "Lcom/segment/analytics/kotlin/core/Settings;",
            "I",
        ).method.addInstructions(0, "return-void")

        // Firebase Sessions records foreground/background sessions separately from
        // Analytics. Remove its lifecycle callbacks and the session begin/end paths.
        listOf(
            "llIIlllIIlIlIII",
            "lllIlIIIlllIIII",
        ).forEach { name ->
            exact("LIllIIllIlllIllIl;", name, "V").method.addInstructions(0, "return-void")
        }
        listOf(
            "IllIIIlIIII",
            "lIllIIIlIlIlll",
        ).forEach { name ->
            exact("LIllIIllIlllIllIl;", name, "Z", "LIllIlllIlllIlII;").method
                .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
    }
}

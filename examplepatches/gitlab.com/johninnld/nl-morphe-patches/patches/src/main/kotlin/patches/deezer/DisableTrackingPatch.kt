package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val trackingResources = resourcePatch {
    dependsOn(deezerBase)
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

            // Disable only Adjust's attribution lifecycle provider. Facebook's native
            // initializer remains available for login; event/ad-ID flags above opt out.
            listOf(
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
    dependsOn(deezerBase, trackingResources, deezerKeepSessionOnColdStart)

    execute {
        trackingMethods2703.forEach { binding ->
            disableTracking2703(exact(binding.owner, binding.name, "V", *binding.parameters.toTypedArray()).method, binding)
        }
        // 9.0.27.3 Sessions uses LocalOverrideSettings, not the old lifecycle client.
        // Its native policy honors firebase_sessions_enabled=false before remote fallback.
        val local = exact("LIIlIlllIIIlllIII;", "llIIIIIIlIIIIll", "Ljava/lang/Boolean;").method
        check(local.instructions.any {
            (it as? ReferenceInstruction)?.reference?.toString() == "firebase_sessions_enabled"
        }) { "Deezer Firebase Sessions local opt-out contract changed" }
    }
}

internal data class TrackingMethod2703(
    val owner: String, val name: String, val parameters: List<String>, val anchor: String,
)

internal val trackingMethods2703 = listOf(
    TrackingMethod2703("LIllllIllIIIlI;", "IIIlIIllIlIllIll", listOf("Landroid/content/Context;"),
        "Lcom/adjust/sdk/Adjust;->initSdk(Lcom/adjust/sdk/AdjustConfig;)V"),
    TrackingMethod2703("LIIlIllIIlIlIIIll;", "IllIlIlIIlIllIll",
        listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Z"),
        "Lcom/adjust/sdk/Adjust;->trackEvent(Lcom/adjust/sdk/AdjustEvent;)V"),
    TrackingMethod2703("LlIlIlIIIllIIIlI;", "IIlllIlIIlIlII",
        listOf("LlIlIlIIIllIIIlI;", "Ljava/lang/String;", "Lkotlinx/serialization/json/IIIIIllIlIIllll;", "I"),
        "Lcom/segment/analytics/kotlin/core/TrackEvent;"),
    TrackingMethod2703("LlIlIlIIIllIIIlI;", "IIllllIIIIIlIIl",
        listOf("Lcom/segment/analytics/kotlin/core/IllIlIlIIlIllIll;", "LlIIlllIIlIIIll;"),
        "applying base attributes on "),
    TrackingMethod2703("LIIIIIlIIIIIIlllI;", "llIIIIIIlIIIIll",
        listOf("Lcom/segment/analytics/kotlin/core/Settings;", "I"),
        "Lcom/braze/Braze\$Companion;->configure(Landroid/content/Context;Lcom/braze/configuration/BrazeConfig;)Z"),
)

/** Fail on a changed native sink, rather than silently returning from an unrelated overload. */
internal fun disableTracking2703(method: MutableMethod, binding: TrackingMethod2703) {
    check(method.definingClass == binding.owner && method.name == binding.name && method.returnType == "V" &&
        method.parameterTypes.map(CharSequence::toString) == binding.parameters && method.instructions.any {
            (it as? ReferenceInstruction)?.reference?.toString()?.contains(binding.anchor) == true
        }) { "Deezer 9.0.27.3 tracking sink changed: ${binding.owner}->${binding.name}" }
    method.addInstructions(0, "return-void")
}

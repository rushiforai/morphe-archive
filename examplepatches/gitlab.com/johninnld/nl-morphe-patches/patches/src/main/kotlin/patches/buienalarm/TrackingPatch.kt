package patches.buienalarm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            fun elements(tag: String): List<Element> {
                val nodes = application.getElementsByTagName(tag)
                return (0 until nodes.length).map { nodes.item(it) as Element }
            }
            fun flag(name: String, value: Boolean) {
                val matches = elements("meta-data").filter { it.getAttribute("android:name") == name }
                check(matches.size <= 1) { "Duplicate manifest flag: $name" }
                val element = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name)
                    application.appendChild(it)
                }
                element.setAttributeNS(ANDROID, "android:value", value.toString())
            }

            // Hard deactivation takes precedence over cached consent/API enablement.
            flag("firebase_analytics_collection_deactivated", true)
            listOf(
                "firebase_analytics_collection_enabled", "google_analytics_automatic_screen_reporting_enabled",
                "google_analytics_adid_collection_enabled", "google_analytics_sgtm_upload_enabled",
                "google_analytics_default_allow_analytics_storage", "google_analytics_default_allow_ad_storage",
                "google_analytics_default_allow_ad_user_data", "google_analytics_default_allow_ad_personalization_signals",
                "firebase_crashlytics_collection_enabled", "firebase_sessions_enabled",
                "firebase_inappmessaging_auto_data_collection_enabled", "delivery_metrics_exported_to_big_query_enabled",
                "com.facebook.sdk.AutoInitEnabled", "com.facebook.sdk.AutoLogAppEventsEnabled",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled",
            ).forEach { flag(it, false) }

            val registrars = elements("meta-data").filter { element ->
                val name = element.getAttribute("android:name")
                name == "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar" || listOf("crashlytics", "sessions", "inappmessaging").any {
                    name.startsWith("com.google.firebase.components:com.google.firebase.$it.")
                }
            }
            check(registrars.size == 8) { "Expected eight analytics/reporting/marketing registrars, found ${registrars.size}" }
            registrars.forEach { it.parentNode.removeChild(it) }

            listOf(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.facebook.internal.FacebookInitProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
                "infoplaza.network.ads.ppid.PPIDContentProvider",
            ).forEach { name ->
                val provider = elements("provider").single { it.getAttribute("android:name") == name }
                provider.setAttributeNS(ANDROID, "android:enabled", "false")
            }
            listOf(
                "receiver" to "com.google.android.gms.measurement.AppMeasurementReceiver",
                "service" to "com.google.android.gms.measurement.AppMeasurementService",
                "service" to "com.google.android.gms.measurement.AppMeasurementJobService",
                "service" to "com.google.android.gms.ads.AdService",
                "activity" to "com.google.firebase.analytics.GoogleAnalyticsServerPreviewActivity",
            ).forEach { (tag, name) ->
                elements(tag).single { it.getAttribute("android:name") == name }
                    .setAttributeNS(ANDROID, "android:enabled", "false")
            }
            elements("meta-data").single {
                it.getAttribute("android:name") == "com.google.maps.android.utils.attribution.AttributionIdInitializer"
            }.let { it.parentNode.removeChild(it) }
            elements("uses-library").filter {
                it.getAttribute("android:name") == "com.amazon.privacypass"
            }.forEach { it.parentNode.removeChild(it) }

            val permissions = doc.getElementsByTagName("uses-permission")
            (0 until permissions.length).map { permissions.item(it) as Element }.filter {
                val name = it.getAttribute("android:name")
                name == "com.google.android.gms.permission.AD_ID" ||
                    name == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    name == "com.amazon.privacypass.ATTEST" ||
                    name.startsWith("android.permission.ACCESS_ADSERVICES_") ||
                    name.startsWith("infoplaza.network.ads.ppid.")
            }.forEach { it.parentNode.removeChild(it) }
        }
        // Remove identified dormant tag configuration and ad-only executable/
        // measurement payloads. Keep Didomi's WebView assets for manual privacy.
        val removedAssets = listOf(
            "assets/containers/GTM-P87V6J8.json",
            "assets/audience_network/classes.dex",
            "assets/omsdk-v1.js",
            "assets/openwrapsdk.js",
            "assets/gdpr-mobile-liveramp.json",
        )
        val entries = listApkEntries("assets/")
        check(removedAssets.all { it in entries }) { "Expected tracking/ad assets are missing" }
        removedAssets.forEach { delete(it) }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables app analytics, advertising IDs, partner targeting, crash/session reporting and marketing SDK startup while retaining weather and configuration services.",
) {
    compatibleWith(buienalarm)
    dependsOn(originalInput, trackingResources, hideAds, optionalTelemetry)
    execute {
        fun stop(fingerprint: Fingerprint) {
            fingerprint.method.addInstructions(0, "return-void")
        }
        stop(Fingerprint(returnType = "V", parameters = listOf("L", "Ljava/lang/String;"),
            strings = listOf(" chars (max 40); GA4 drops the event")))
        stop(Fingerprint(returnType = "V", parameters = listOf("L"),
            strings = listOf(" chars (max 24); GA4 drops the property")))
        stop(Fingerprint(name = "invoke", returnType = "V", parameters = emptyList(),
            strings = listOf("Start Facebook consent listener")))
        stop(Fingerprint(name = "invoke", returnType = "V", parameters = emptyList(),
            strings = listOf("Setting userId with ppid: ")))
        stop(Fingerprint(returnType = "V", parameters = listOf("L", "L"),
            strings = listOf("https://api.meteoplaza.com/v2/ads/targetting")))

        // MainActivity's dependency graph constructs this logger even with
        // Facebook disabled. Keep a non-null inert facade, not a live SDK.
        Fingerprint(definingClass = "Lcom/facebook/appevents/k;", name = "<init>",
            returnType = "V", parameters = listOf("Landroid/content/Context;", "I")).method
            .addInstructions(0, "invoke-direct {p0}, Ljava/lang/Object;-><init>()V\nreturn-void")
        Fingerprint(definingClass = "Lrf2;", name = "a", returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/String;", "L", "L"),
            strings = listOf("fb_content_id", "fb_order_id")).method
            .addInstructions(0, "sget-object v0, Lvb8;->a:Lvb8;\nreturn-object v0")
        stop(Fingerprint(definingClass = "Lq43;", name = "a", returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;")))
        stop(Fingerprint(definingClass = "Lu20;", name = "d", returnType = "V",
            parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z")))

        Fingerprint(returnType = "Z", parameters = emptyList(),
            strings = listOf("export_to_big_query", "delivery_metrics_exported_to_big_query_enabled")).method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        Fingerprint(definingClass = "Lxq5;", returnType = "Ljava/lang/String;", parameters = emptyList(),
            strings = listOf("infoplaza.network.ads.ppid")).method
            .addInstructions(0, "const-string v0, \"\"\nreturn-object v0")

        Fingerprint(definingClass = "Lio/didomi/sdk/e9;", name = "a", returnType = "Z",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")).method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // AndroidX still expects a non-null initializer result. Return its existing
        // Kotlin Unit singleton, without initializing Google Mobile Ads.
        Fingerprint(definingClass = "Lcom/meteoplaza/android/mpbannerview/MPInitProvider;",
            name = "create", returnType = "Ljava/lang/Object;", parameters = listOf("Landroid/content/Context;")).method.apply {
            val unit = instructions.last { it.opcode == Opcode.SGET_OBJECT }
                .let { (it as ReferenceInstruction).reference as FieldReference }
            check(unit.definingClass == unit.type && unit.type == "Lvb8;") { "Unexpected banner initializer result" }
            addInstructions(0, "sget-object v0, ${unit.definingClass}->${unit.name}:${unit.type}\nreturn-object v0")
        }

        // LaunchActivity dereferences Crashlytics unconditionally. Keep an inert
        // non-null public wrapper after removing its eager Firebase registrar.
        val crash = Fingerprint(returnType = "L", parameters = emptyList(),
            strings = listOf("FirebaseCrashlytics component is not present."))
        val cls = crash.classDef
        check(crash.originalMethod.returnType == cls.type)
        val constructor = cls.methods.single { it.name == "<init>" }
        check(constructor.parameterTypes.size == 1 && constructor.instructions.size == 3)
        val sinks = cls.methods.filter { it.name != "<init>" && it.name != crash.originalMethod.name }
        check(sinks.size == 3 && sinks.all { it.returnType == "V" }) { "Unexpected Crashlytics API" }
        sinks.forEach { it.addInstructions(0, "return-void") }
        crash.method.addInstructions(0, """
            new-instance v0, ${cls.type}
            const/4 v1, 0x0
            invoke-direct {v0, v1}, ${cls.type}-><init>(${constructor.parameterTypes.single()})V
            return-object v0
        """.trimIndent())
    }
}

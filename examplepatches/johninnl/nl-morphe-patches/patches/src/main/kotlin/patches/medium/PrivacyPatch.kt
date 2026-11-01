package patches.medium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.w3c.dom.Element

private fun MutableMethod.hasString(value: String) = implementation!!.instructions.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
}

context(context: BytecodePatchContext)
private fun replaceBody(type: String, name: String, result: String, vararg parameters: String, locals: Int = 1, code: String) {
    val target = exact(type, name, result, *parameters)
    val old = target.method
    check(old.implementation != null) { "Missing implementation: $type->$name" }
    val parameterWords = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 } +
        if (old.accessFlags and AccessFlags.STATIC.value == 0) 1 else 0
    val replacement = MutableMethod(ImmutableMethod(type, name, old.parameters, result, old.accessFlags,
        old.annotations, old.hiddenApiRestrictions, ImmutableMethodImplementation(parameterWords + locals, emptyList(), emptyList(), emptyList())))
    replacement.addInstructions(0, code.trimIndent())
    check(target.classDef.methods.remove(old)) { "Missing owned method" }
    target.classDef.methods.add(replacement)
}

internal val privacyResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val all = doc.getElementsByTagName("*")
            val nodes = (0 until all.length).map { all.item(it) as Element }
            val app = nodes.single { it.tagName == "application" }
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to true,
                "firebase_analytics_collection_enabled" to false,
                "google_analytics_adid_collection_enabled" to false,
                "google_analytics_ssaid_collection_enabled" to false,
                "google_analytics_automatic_screen_reporting_enabled" to false,
                "firebase_crashlytics_collection_enabled" to false,
                "firebase_performance_collection_deactivated" to true,
                "firebase_performance_collection_enabled" to false,
                "firebase_sessions_enabled" to false,
                "delivery_metrics_exported_to_big_query_enabled" to false,
                "com.facebook.sdk.AutoLogAppEventsEnabled" to false,
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to false,
                "com.facebook.sdk.AutoInitEnabled" to false,
            )
            for ((name, value) in flags) {
                val matches = nodes.filter { it.tagName == "meta-data" && it.getAttributeNS(ANDROID, "name") == name }
                check(matches.size <= 1) { "Duplicate collection flag: $name" }
                val node = matches.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID, "android:name", name); app.appendChild(it)
                }
                node.setAttributeNS(ANDROID, "android:value", value.toString())
            }
            val permissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            )
            val removed = nodes.filter { it.tagName == "uses-permission" && it.getAttributeNS(ANDROID, "name") in permissions }
            check(removed.map { it.getAttributeNS(ANDROID, "name") }.toSet() == permissions && removed.size == permissions.size) {
                "Medium advertising permission inventory changed"
            }
            removed.forEach { it.parentNode.removeChild(it) }

            // Keep Firebase app/auth/messaging/installations discovery intact.
            // Medium directly dereferences Crashlytics during Activity/Fragment startup;
            // keep that API available and suppress its collection/transport below.
            val optionalRegistrars = setOf(
                "com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar",
                "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar",
            )
            val registrars = nodes.filter { it.tagName == "meta-data" && it.getAttributeNS(ANDROID, "name") in optionalRegistrars }
            check(registrars.map { it.getAttributeNS(ANDROID, "name") }.toSet() == optionalRegistrars && registrars.size == optionalRegistrars.size) {
                "Optional Firebase registrar inventory changed"
            }
            registrars.forEach { it.parentNode.removeChild(it) }
            val optionalComponents = setOf(
                "com.google.firebase.sessions.SessionLifecycleService",
                "com.google.android.gms.analytics.AnalyticsReceiver",
                "com.google.android.gms.analytics.AnalyticsService",
                "com.google.android.gms.analytics.AnalyticsJobService",
            )
            val components = nodes.filter { it.tagName in setOf("service", "receiver") && it.getAttributeNS(ANDROID, "name") in optionalComponents }
            check(components.map { it.getAttributeNS(ANDROID, "name") }.toSet() == optionalComponents && components.size == optionalComponents.size) {
                "Optional analytics component inventory changed"
            }
            components.forEach { it.setAttributeNS(ANDROID, "android:enabled", "false") }
        }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable optional tracking",
    description = "Disables Medium event collection, queued event uploads, optional analytics startup and advertising identifiers.",
) {
    compatibleWith(medium)
    dependsOn(privacyResources, webPrivacy)
    execute {
        val unit = "sget-object v0, Ltzg;->a:Ltzg;\nreturn-object v0"
        replaceBody("Lzmg;", "a", "V", "Lzmg;", "Lcom/squareup/wire/AndroidMessage;", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Ljava/lang/String;", "Ljava/lang/String;", "I", code = "return-void")
        replaceBody("Lzmg;", "b", "Ljava/lang/Object;", "Lcom/squareup/wire/AndroidMessage;", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Ljava/lang/String;", "Ljava/lang/String;", "Lam2;", code = unit)
        // Cover direct flush callers and restored queues, not only startup collection.
        replaceBody("Lqf9;", "a", "Ljava/lang/Object;", "Z", "Lam2;", code = unit)
        replaceBody("Lqf9;", "b", "Ljava/lang/Object;", "Lam2;", code = unit)
        replaceBody("Lqf9;", "c", "Ljava/lang/Object;", "Ljava/util/List;", "Lam2;", code = unit)
        // Final operation-specific guard before constructing logClientEvents.
        // This method's successful result is the app's raw Unit carrier.
        replaceBody("Lqe9;", "t1", "Ljava/lang/Object;", "Ljava/util/List;", "Lam2;", code = unit)
        for (type in listOf(
            "Lcom/medium/android/common/datadog/DatadogSdkInitializer;",
            "Lcom/medium/android/common/datadog/DatadogLogsInitializer;",
            "Lcom/medium/android/common/sprig/SprigSdkInitializer;",
            "Lcom/medium/android/donkey/initializer/MetricsInitializer;",
            "Lcom/medium/android/donkey/initializer/InstallReferrerInitializer;",
        )) replaceBody(type, "b", "Ljava/lang/Object;", "Landroid/content/Context;", code = unit)

        val measurement = "Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;"
        replaceBody(measurement, "logEvent", "V", "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Z", "Z", "J", code = "return-void")
        replaceBody(measurement, "setUserId", "V", "Ljava/lang/String;", "J", code = "return-void")
        replaceBody(measurement, "setUserProperty", "V", "Ljava/lang/String;", "Ljava/lang/String;", "Lz37;", "Z", "J", code = "return-void")
        for (name in listOf("beginAdUnitExposure", "endAdUnitExposure"))
            replaceBody(measurement, name, "V", "Ljava/lang/String;", "J", code = "return-void")
        for ((name, parameters) in listOf(
            "setDataCollectionEnabled" to arrayOf("Z"),
            "setMeasurementEnabled" to arrayOf("Z", "J"),
        )) {
            val method = exact(measurement, name, "V", *parameters).method
            val words = parameters.sumOf { if (it == "J") 2 else 1 }
            val argument = method.implementation!!.registerCount - words
            check(argument in 0..15) { "Measurement setter registers changed" }
            method.addInstructions(0, "const/4 p1, 0x0")
        }

        // Block the direct facade/core configuration path as well as AndroidX startup.
        for (sdk in listOf("Lcom/userleap/Sprig;", "Lcom/userleap/UserLeap;")) {
            replaceBody(sdk, "configure", "V", "Landroid/content/Context;", "Ljava/lang/String;", code = "return-void")
            replaceBody(sdk, "setUserIdentifier", "V", "Ljava/lang/String;", code = "return-void")
            replaceBody(sdk, "setPreviewKey", "V", "Ljava/lang/String;", code = "return-void")
            replaceBody(sdk, "logout", "V", code = "return-void")
            replaceBody(sdk, "trackAndPresent", "V", "Lcom/userleap/EventPayload;", "Landroid/app/Activity;", code = "return-void")
        }

        // Complete optional SDK jobs successfully without encoding/uploading payloads.
        // WorkManager Success is yh8; wh8 is Failure and xh8 is Retry in this APK.
        exact("Lzh8;", "a", "Lyh8;")
        val success = "invoke-static {}, Lzh8;->a()Lyh8;\nmove-result-object v0\nreturn-object v0"
        replaceBody("Lcom/datadog/android/core/UploadWorker;", "b", "Lyh8;", code = success)
        for (worker in listOf("UploadWorker", "ReplayEncoderWorker"))
            replaceBody("Lcom/userleap/internal/sessions/util/$worker;", "doWork", "Ljava/lang/Object;", "Lyl2;", code = success)

        val adIdPing = exact("Lp0j;", "run", "V").method
        check(adIdPing.hasString("https://pagead2.googlesyndication.com/pagead/gen_204?id=gmob-apps")) {
            "Advertising identifier diagnostics sender changed"
        }
        replaceBody("Lp0j;", "run", "V", code = "return-void")

        val facebookEvents = exact("Lu8k;", "S", "V", "La70;", "Lb5;").method
        check(facebookEvents.hasString("fb_mobile_activate_app")) { "Facebook event collection target changed" }
        replaceBody("Lu8k;", "S", "V", "La70;", "Lb5;", code = "return-void")
        val eventRequest = exact("Ld70;", "a", "Lpl6;", "Lb5;", "Lgpe;", "Z", "Lkd;").method
        check(eventRequest.hasString("%s/activities")) { "Facebook event request target changed" }
        // The original caller explicitly skips null requests. Do not alter the shared Graph client.
        replaceBody("Ld70;", "a", "Lpl6;", "Lb5;", "Lgpe;", "Z", "Lkd;", code = "const/4 v0, 0x0\nreturn-object v0")
        val installAttribution = exact("Lrx4;", "run", "V").method
        check(installAttribution.hasString("pingForOnDevice") && installAttribution.hasString("%s/activities")) {
            "Facebook install attribution sender changed"
        }
        replaceBody("Lrx4;", "run", "V", code = "return-void")

        // Preserve the component returned by v95.a(), which lifecycle code requires.
        replaceBody("Lv95;", "b", "V", "Ljava/lang/String;", code = "return-void")
        replaceBody("Lv95;", "c", "V", "Ljava/lang/String;", "Ljava/lang/String;", code = "return-void")
        replaceBody("Lp83;", "a", "Z", code = "const/4 v0, 0x0\nreturn v0")
        replaceBody("Lrpe;", "g", "V", "Ljava/lang/Throwable;", "Ljava/lang/Thread;", "Ljava/lang/String;", "Lvq4;", "Z", code = "return-void")
        exact("Ll9e;", "h", "Lmrk;", "Ljava/lang/Object;")
        replaceBody("Lrpe;", "h", "Lmrk;", "Ljava/lang/String;", "Ljava/util/concurrent/Executor;", code = """
            const/4 v0, 0x0
            invoke-static {v0}, Ll9e;->h(Ljava/lang/Object;)Lmrk;
            move-result-object v0
            return-object v0
        """)

        val settings = exact("Lgp3;", "q", "Lt27;").method
        check(settings.hasString("FirebaseCrashlytics")) { "Crashlytics settings HTTP target changed" }
        exact("Lt27;", "<init>", "V", "I", "Ljava/lang/String;")
        // The existing settings parser treats a 204 response as no settings and uses defaults/cache.
        replaceBody("Lgp3;", "q", "Lt27;", locals = 3, code = """
            new-instance v0, Lt27;
            const/16 v1, 0xcc
            const-string v2, ""
            invoke-direct {v0, v1, v2}, Lt27;-><init>(ILjava/lang/String;)V
            return-object v0
        """)
        val cct = exact("Lha0;", "h", "Lqa0;", "Ld80;").method
        check(cct.hasString("CctTransportBackend")) { "Firebase DataTransport HTTP target changed" }
        exact("Lqa0;", "<init>", "V", "I", "Ljava/net/URL;", "J")
        // CCT is the Firebase telemetry backend, distinct from account/content HTTP.
        // A local success also drains previously queued optional telemetry without retries.
        replaceBody("Lha0;", "h", "Lqa0;", "Ld80;", locals = 5, code = """
            new-instance v0, Lqa0;
            const/16 v1, 0xc8
            const/4 v2, 0x0
            const-wide/16 v3, 0x0
            invoke-direct {v0, v1, v2, v3, v4}, Lqa0;-><init>(ILjava/net/URL;J)V
            return-object v0
        """)
    }
}

@Suppress("unused")
val hidePromotions = bytecodePatch(
    name = "Hide native promotions",
    description = "Removes article promotion banners, membership upsells and publication promotion sections while retaining editorial content.",
) {
    compatibleWith(medium)
    dependsOn(originalInput)
    execute {
        val meterParameters = arrayOf("Lef9;", "Lvtb;", "Lqi9;", "Lde2;", "I")
        val meter = exact("Lbvg;", "q", "V", *meterParameters).method
        check(meter.implementation!!.instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f140385 }) {
            "Article membership banner resource anchor changed"
        }
        // Both the banner and its speech-bubble container are dedicated to this upsell.
        for (name in listOf("p", "q")) replaceBody("Lbvg;", name, "V", *meterParameters, code = "return-void")
        val badge = exact("Lc51;", "u", "V", "Lo99;", "Ll6b;", "Lqi9;", "Lde2;", "I").method
        check(badge.implementation!!.instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f140099 }) {
            "Member-only badge resource anchor changed"
        }
        val click = exact("Lu48;", "invoke", "Ljava/lang/Object;")
        check(click.classDef.fields.count { it.name == "a" && it.type == "B" } == 1 && click.method.implementation!!.registerCount >= 4) {
            "Membership action selector/registers changed"
        }
        // Keep the badge's native rendering; selector 26 is only its membership-info action.
        click.method.addInstructions(0, """
            move-object/from16 v0, p0
            iget-byte v1, v0, Lu48;->a:B
            const/16 v2, 0x1a
            if-ne v1, v2, :original_action
            sget-object v1, Ltzg;->a:Ltzg;
            return-object v1
            :original_action
            nop
        """.trimIndent())
        replaceBody("Lcom/medium/android/graphql/fragment/PostPromotionBannerData${'$'}ViewerEdge;", "getPromotionBanner",
            "Lcom/medium/android/graphql/fragment/PostPromotionBannerData${'$'}PromotionBanner;", code = "const/4 v0, 0x0\nreturn-object v0")
        replaceBody("Lcom/medium/android/graphql/fragment/PublicationSections${'$'}OnPublicationSection;", "getPublicationPromotionSectionData",
            "Lcom/medium/android/graphql/fragment/PublicationPromotionSectionData;", code = "const/4 v0, 0x0\nreturn-object v0")
    }
}

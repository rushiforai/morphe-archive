package patches.humo

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val adResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            doc.one("com.google.android.gms.ads.MobileAdsInitProvider").setAttributeNS(ANDROID,"android:enabled","false")
            doc.one("com.google.android.gms.ads.AdService").setAttributeNS(ANDROID,"android:enabled","false")
        }
        listOf("ad.html","apn_omsdk.js","apn_renderNativeAssets.html","mraid.js","omsdk-v1.js").forEach {
            check(get("assets/$it").isFile) { "Missing Humo advertising asset $it" }
            check(get("assets/$it").delete())
        }
    }
}

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            fun elements(tag: String): List<Element> {
                val nodes = doc.getElementsByTagName(tag)
                return (0 until nodes.length).map { nodes.item(it) as Element }
            }
            val application = elements("application").single()
            fun flag(name: String, value: Boolean) {
                val found = elements("meta-data").filter { it.getAttribute("android:name") == name }
                check(found.size <= 1) { "Duplicate Humo collector flag $name" }
                val el = found.singleOrNull() ?: doc.createElement("meta-data").also {
                    it.setAttributeNS(ANDROID,"android:name",name); application.appendChild(it)
                }
                el.setAttributeNS(ANDROID,"android:value",value.toString())
            }
            listOf("firebase_analytics_collection_deactivated","firebase_performance_collection_deactivated").forEach { flag(it,true) }
            listOf("firebase_analytics_collection_enabled","google_analytics_automatic_screen_reporting_enabled",
                "google_analytics_adid_collection_enabled","google_analytics_sgtm_upload_enabled",
                "google_analytics_default_allow_analytics_storage","google_analytics_default_allow_ad_storage",
                "google_analytics_default_allow_ad_user_data","google_analytics_default_allow_ad_personalization_signals",
                "firebase_crashlytics_collection_enabled","firebase_sessions_enabled","firebase_performance_collection_enabled",
                "firebase_inappmessaging_auto_data_collection_enabled","delivery_metrics_exported_to_big_query_enabled",
                "com.facebook.sdk.AutoInitEnabled","com.facebook.sdk.AutoLogAppEventsEnabled","com.facebook.sdk.AdvertiserIDCollectionEnabled").forEach { flag(it,false) }
            // Keep FirebaseInitProvider, Installations, Messaging, RemoteConfig and
            // functional HTTP wrappers. Disable optional marketing/metrics startup.
            val optional = elements("meta-data").filter {
                val n = it.getAttribute("android:name")
                n == "com.contentsquare.android.internal.features.initialize.CSQInitializer" || n == "io.piano.android.cxense.CxSdkInitializer" ||
                    n.startsWith("com.google.firebase.components:com.google.firebase.inappmessaging.") ||
                    n.startsWith("com.google.firebase.components:com.google.firebase.sessions.") ||
                    n.endsWith("AnalyticsConnectorRegistrar")
            }
            check(optional.size == 8) { "Humo optional registrar inventory changed: ${optional.size}" }
            optional.forEach { it.parentNode.removeChild(it) }
            listOf("com.facebook.internal.FacebookInitProvider",
                "io.heap.core.HeapContentProvider", "io.heap.autocapture.HeapViewAutocaptureContentProvider",
                "com.google.android.gms.tagmanager.TagManagerService", "com.google.android.gms.tagmanager.TagManagerPreviewActivity",
                "com.google.android.gms.measurement.AppMeasurementReceiver","com.google.android.gms.measurement.AppMeasurementService",
                "com.google.android.gms.measurement.AppMeasurementJobService",
                "org.acra.sender.LegacySenderService","org.acra.sender.JobSenderService","org.acra.attachment.AcraContentProvider").forEach {
                doc.one(it).setAttributeNS(ANDROID,"android:enabled","false")
            }
            val permissions = elements("uses-permission").filter {
                val n = it.getAttribute("android:name")
                n == "com.google.android.gms.permission.AD_ID" || n == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" ||
                    n == "android.permission.AD_SERVICES_CONFIG" || n.startsWith("android.permission.ACCESS_ADSERVICES_")
            }
            check(permissions.size == 7) { "Humo advertising permission inventory changed: ${permissions.size}" }
            permissions.forEach { it.parentNode.removeChild(it) }
        }
        check(get("assets/containers/GTM-KQGZHLB.json").isFile)
        check(get("assets/containers/GTM-KQGZHLB.json").delete())
    }
}

private const val DEFAULT = "${APP}component/web/ui/DefaultWebViewClient;"
private const val EMBED = "${APP}embed/webview/ui/EmbedWebViewViewModel\$EmbedWebViewClient;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installWebPolicy(tracking: Boolean = false) {
    for (client in listOf(DEFAULT, EMBED)) {
        val cls = exact(client,"shouldOverrideUrlLoading","Z","Landroid/webkit/WebView;","Landroid/webkit/WebResourceRequest;").classDef
        val name = if (tracking) "morpheWebBlockedTracking" else "morpheWebBlockedAds"
        check(cls.methods.none { it.name == name }) { "Duplicate Humo request policy $client $name" }
        val hosts = if (tracking) listOf("contentsquare.net","contentsquare.com","heapanalytics.com","heap.io",
            "tracking-module.api.dpgmedia.cloud","tracker.prd.dpge.be","c.dpgmedia.net",
            "googletagmanager.com","google-analytics.com","scorecardresearch.com","gemius.pl","api.cxense.com",
            "dev.visualwebsiteoptimizer.com","brandmetrics.com","bmtrcs.com") else listOf("advertising-cdn.dpgmedia.cloud",
            "advertising-module.api.dpgmedia.cloud","prebid-server.dpgmedia.net","doubleclick.net","googlesyndication.com",
            "googleadservices.com","adnxs.com","adsdk.bing.net","adsdk.microsoft.com","optoutadvertising.com")
        val checks = hosts.joinToString("\n") { host -> """
            const-string v1, "$host"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :blocked
            const-string v1, ".$host"
            invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
            move-result v2
            if-nez v2, :blocked
        """.trimIndent() }
        cls.methods.add(helper(client,name,"Z",listOf("Ljava/lang/String;"),3,"""
            if-eqz p0, :allowed
            invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v0
            invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :allowed
            sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
            invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
            move-result-object v0
            $checks
            :allowed
            const/4 v0, 0x0
            return v0
            :blocked
            const/4 v0, 0x1
            return v0
        """))
        if (tracking) {
            // Reassemble the whole dispatcher so branch targets remain local to
            // one assembly operation when this dependency follows Hide ads.
            val old = cls.methods.single { it.name == "morpheWebBlocked" }
            check(cls.methods.remove(old))
            cls.methods.add(helper(client,"morpheWebBlocked","Z",listOf("Ljava/lang/String;"),1,"""
                invoke-static {p0}, $client->morpheWebBlockedTracking(Ljava/lang/String;)Z
                move-result v0
                if-nez v0, :blocked
                invoke-static {p0}, $client->morpheWebBlockedAds(Ljava/lang/String;)Z
                move-result v0
                return v0
                :blocked
                const/4 v0, 0x1
                return v0
            """))
            continue
        }
        cls.methods.add(helper(client,"morpheWebBlocked","Z",listOf("Ljava/lang/String;"),1,"""
            invoke-static {p0}, $client->morpheWebBlockedAds(Ljava/lang/String;)Z
            move-result v0
            return v0
        """))
        cls.methods.add(helper(client,"morpheWebResponse",RESPONSE,listOf("Ljava/lang/String;"),4,"""
            invoke-static {p0}, $client->morpheWebBlocked(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :allowed
            new-instance v0, Ljava/io/ByteArrayInputStream;
            const/4 v1, 0x0
            new-array v1, v1, [B
            invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V
            new-instance v1, $RESPONSE
            const-string v2, "text/plain"
            const-string v3, "UTF-8"
            invoke-direct {v1, v2, v3, v0}, $RESPONSE-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
            return-object v1
            :allowed
            const/4 v0, 0x0
            return-object v0
        """))
        check(cls.methods.none { it.name == "shouldInterceptRequest" }) { "Humo WebView request callbacks changed: $client" }
        for (type in listOf("Ljava/lang/String;","Landroid/webkit/WebResourceRequest;")) {
            val url = if (type == "Ljava/lang/String;") "move-object v0, p2" else """
                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
            """.trimIndent()
            val parent = if (client == DEFAULT) "Landroid/webkit/WebViewClient;" else "Landroidx/webkit/WebViewClientCompat;"
            cls.methods.add(helper(client,"shouldInterceptRequest",RESPONSE,listOf("Landroid/webkit/WebView;",type),1,"""
                $url
                invoke-static {v0}, $client->morpheWebResponse(Ljava/lang/String;)$RESPONSE
                move-result-object v0
                if-eqz v0, :original
                return-object v0
                :original
                invoke-super {p0, p1, p2}, $parent->shouldInterceptRequest(Landroid/webkit/WebView;$type)$RESPONSE
                move-result-object v0
                return-object v0
            """,static=false))
        }
    }
}

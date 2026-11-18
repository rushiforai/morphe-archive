package patches.weerplaza

import app.morphe.patcher.Fingerprint
import patches.shared.uniqueMatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val adResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            doc.one("android:name", "com.google.android.gms.ads.MobileAdsInitProvider").setAttributeNS(ANDROID, "android:enabled", "false")
        }
        listOf("activity_current_and_extremes", "fragment_sun", "fragment_splash", "fragment_splash_pro", "fragment_flash", "fragment_settings_menu").forEach {
            document("res/layout/$it.xml").use { doc -> doc.one("android:id", "@id/banner_container").collapse() }
        }
        document("res/layout/main_drawer.xml").use { doc -> doc.one("android:id", "@id/bottom_navigation_view_ad_holder").collapse() }
        val assets = listOf("openwrapsdk.js", "omsdk-v1.js", "apn_omsdk.js", "apn_renderNativeAssets.html", "apn_vastvideo.html", "mobilevastplayer.js", "astmediationmanager.js", "pob_mraid.js", "dsa_page.html", "PubMatic_Logo.svg", "pob_info_button.svg", "pob_person_button.svg").map { "assets/$it" }
        check(listApkEntries("assets/").containsAll(assets)) { "Missing expected Weerplaza ad assets" }
        assets.forEach { delete(it) }
    }
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Disables native, Compose, WebView and bottom-navigation banners, Google/OpenWrap loading, ad targeting and video ads while preserving weather completion and paid feature state.",
) {
    dependsOn(originalInput)
    compatibleWith(weerplaza)
    dependsOn(adResources, googleMapsCompatibility)
    execute {
        installWebRequestPolicy(WebControl.Ads)
        installWebSanitizer(WebControl.Ads)
        exact("Lj9/j\$a;", "a", "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        listOf("Lk9/d;" to "f", "Lk9/d;" to "q", "Lm9/e;" to "f", "Lm9/e;" to "r").forEach { (cls, name) ->
            exact(cls, name).method.addInstructions(0, "return-void")
        }
        Fingerprint(definingClass = "Ll7/e;", name = "d", returnType = "V", parameters = listOf("Lj9/c;", "Landroidx/compose/runtime/Composer;", "I"), strings = listOf("com.meteoplaza.app.ads.Ad (Ads.kt:77)")).uniqueMatch().method.addInstructions(0, "return-void")
        Fingerprint(definingClass = "Lj9/r;", name = "j", returnType = "V", strings = listOf("infoplaza.network.ads.BannerAdSlot (BannerAdSlot.kt:47)")).uniqueMatch().method.addInstructions(0, "return-void")
        Fingerprint(definingClass = "$APP/MeteoPlazaActivity;", name = "n0", returnType = "V", strings = listOf("Loading bottom navigation ad")).uniqueMatch().method.addInstructions(0, "return-void")
        exact("$APP/views/webview/NativeAdsWebView;", "n", "V", "F").method.addInstructions(0, "return-void")
        exact("$APP/views/webview/NativeAdsWebView;", "z", "V", "Z").method.addInstructions(0, "return-void")
        exact("$APP/views/webview/NativeAdsWebView;", "setAds", "V", "Z").method.addInstructions(0, "const/4 p1, 0x0")
        // The original failure completion publishes the already-fetched weather with an empty map.
        Fingerprint(definingClass = "Lb8/o;", name = "p", returnType = "V", strings = listOf("REQUESTING ADS FOR ")).uniqueMatch().method.addInstructions(0, """
            const/4 v0, 0x0
            invoke-static {p0, p1, p2, p3, v0}, Lb8/o;->r(Lb8/o;Lcom/meteoplaza/app/model/LocationData;Lcom/meteoplaza/app/model/Snow;Lcom/meteoplaza/app/model/MeteoBlockResponse;Lcom/android/volley/VolleyError;)V
            return-void
        """.trimIndent())
        exact("Li1/a;", "t", "Z", "Lk1/e;").also {
            Fingerprint(definingClass = "Li1/a;", name = "a", returnType = "Ljava/lang/String;", strings = listOf("/ad-scheduling/document/vmap/1.0?scheduleCode="))
                .uniqueMatch().method
            it.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
        exact("Li1/e;", "D", "Z", "Lk1/e;", "Z").method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/google/android/gms/ads/MobileAds;", "initialize", "V", "Landroid/content/Context;").method.addInstructions(0, "return-void")
        exact("Lm7/b;", "b", "V", "Landroid/content/Context;").method.addInstructions(0, "return-void")
    }
}

/** Independent controls share the existing client without replacing its content callbacks. */
internal enum class WebControl { Ads, Tracking, Premium, Consent }

private fun webMethod(name: String, result: String, parameters: List<String>, locals: Int, isStatic: Boolean, code: String) =
    app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
        com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
            "$APP/views/webview/NativeAdsWebView\$c;", name,
            parameters.map { com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(it, emptySet(), null) },
            result,
            if (isStatic) com.android.tools.smali.dexlib2.AccessFlags.PRIVATE.value or com.android.tools.smali.dexlib2.AccessFlags.STATIC.value
            else com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value,
            emptySet(), emptySet(),
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                locals + parameters.size + if (isStatic) 0 else 1, emptyList(), emptyList(), emptyList()
            )
        )
    ).apply { addInstructions(0, code) }

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installWebRequestPolicy(control: WebControl) {
    val client = "$APP/views/webview/NativeAdsWebView\$c;"
    val cls = exact(client, "onPageFinished", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;").classDef
    val existing = cls.methods.filter { it.name == "shouldInterceptRequest" }
    check(existing.size == 0 || existing.size == 2) { "Unexpected partial WebView interception" }
    if (existing.isEmpty()) {
        cls.methods.add(webMethod("shouldInterceptRequest", "Landroid/webkit/WebResourceResponse;",
            listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"), 5, false, "const/4 v0, 0x0\nreturn-object v0"))
        cls.methods.add(webMethod("shouldInterceptRequest", "Landroid/webkit/WebResourceResponse;",
            listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"), 1, false, """
                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {p0, p1, v0}, $client->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                return-object v0
            """.trimIndent()))
    }
    val hosts = when (control) {
        WebControl.Ads -> listOf("doubleclick.net", "googlesyndication.com", "googleadservices.com", "adnxs.com", "pubmatic.com",
            "html-load.com", "content-loader.com", "css-load.com", "html-load.cc", "img-load.com", "ad-delivery.net", "cadmus.script.ac")
        WebControl.Tracking -> listOf("googletagmanager.com", "google-analytics.com", "scorecardresearch.com",
            "stats.bluebillywig.com", "analytics.infraloods.nl", "sentry.io", "report.error-report.com", "pushalert.co")
        WebControl.Consent -> emptyList()
        else -> error("No request policy for $control")
    }
    val hostChecks = hosts.joinToString("\n") { host -> """
        const-string v1, "$host"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-nez v2, :blocked
        const-string v1, ".$host"
        invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
        move-result v2
        if-nez v2, :blocked
    """.trimIndent() }
    val paths = when (control) {
        WebControl.Tracking -> listOf("imweather.com" to "/api/auth/_log", "api.privacy-center.org" to "/v1/events", "api.privacy-center.org" to "/v1/sync")
        WebControl.Consent -> listOf("sdk.privacy-center.org" to "/loader.js")
        else -> emptyList()
    }
    val pathChecks = paths.mapIndexed { index, (host, path) -> """
        const-string v1, "$host"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-eqz v2, :nextPath$index
        invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v3
        invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;
        move-result-object v3
        if-eqz v3, :nextPath$index
        const-string v1, "$path"
        invoke-virtual {${if (control == WebControl.Consent) "v3, v1" else "v1, v3"}}, Ljava/lang/String;->${if (control == WebControl.Consent) "endsWith(Ljava/lang/String;)" else "equals(Ljava/lang/Object;)"}Z
        move-result v2
        if-nez v2, :blocked
        :nextPath$index
    """.trimIndent() }.joinToString("\n")
    val name = "morpheBlock${control.name}"
    check(cls.methods.none { it.name == name }) { "Duplicate $control request policy" }
    cls.methods.add(webMethod(name, "Z", listOf("Ljava/lang/String;"), 4, true, """
        invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v0
        invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :allowed
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        $hostChecks
        $pathChecks
        :allowed
        const/4 v0, 0x0
        return v0
        :blocked
        const/4 v0, 0x1
        return v0
    """.trimIndent()))
    cls.methods.single { it.name == "shouldInterceptRequest" && it.parameterTypes.last() == "Ljava/lang/String;" }.apply {
        addInstructionsWithLabels(0, """
            invoke-static {p2}, $client->$name(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :nextPolicy
            new-instance v0, Ljava/io/ByteArrayInputStream;
            const/4 v1, 0x0
            new-array v1, v1, [B
            invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V
            new-instance v1, Landroid/webkit/WebResourceResponse;
            const-string v2, "text/plain"
            const-string v3, "UTF-8"
            invoke-direct {v1, v2, v3, v0}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
            return-object v1
        """.trimIndent(), ExternalLabel("nextPolicy", getInstruction(0)))
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installWebSanitizer(control: WebControl) {
    val client = "$APP/views/webview/NativeAdsWebView\$c;"
    val page = exact(client, "onPageFinished", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;")
    val name = "morpheClean${control.name}"
    val selectors = when (control) {
        WebControl.Ads -> "[data-component=\"SnippetBanner\"],.banner.snippet,[id^=\"div-Web_APP-Weerplaza_NL-\"]"
        WebControl.Premium -> ".js-premium-popup,.js-not-premium,.js-premium"
        WebControl.Consent -> ".js-premium-popup"
        else -> error("No UI sanitizer for $control")
    }
    val bridge = if (control == WebControl.Ads) """
        var b = window.wpAppBanner;
        if (b && b !== seenBanner) {
          seenBanner = b;
          b.banners = [];
          b.targeting = {};
          b.add = function () {};
          b.get = b.android = b.ios = function () { return {targeting:{},banners:[]}; };
        }
    """.trimIndent() else ""
    val popup = if (control != WebControl.Ads) """
        document.querySelectorAll('.js-premium-popup').forEach(function (p) {
          if (!p.classList.contains('hidden')) {
            p.classList.add('hidden');
            if (document.body && document.body.style.overflow === 'hidden')
              document.body.style.removeProperty('overflow');
          }
        });
    """.trimIndent() else ""
    val links = if (control == WebControl.Premium) """
        document.querySelectorAll('a[href]').forEach(function (a) {
          try {
            var u = new URL(a.href, location.href);
            if (/(^|\.)weerplaza\.nl$/.test(u.hostname) && /^\/(abonneren|bevestigen)\/?$/.test(u.pathname) &&
                (a.style.getPropertyValue('display') !== 'none' || a.style.getPropertyPriority('display') !== 'important'))
              a.style.setProperty('display','none','important');
          } catch (_) {}
        });
    """.trimIndent() else ""
    val script = """
        (function () {
          if (!/(^|\.)weerplaza\.nl$/.test(location.hostname)) return;
          if (window.__morpheWeatherClean${control.name}) return;
          window.__morpheWeatherClean${control.name} = true;
          var style = document.createElement('style');
          style.textContent = '$selectors{display:none!important;min-height:0!important;height:0!important;margin:0!important;padding:0!important}';
          (document.head || document.documentElement).appendChild(style);
          var seenBanner = null;
          function clean() {
            $bridge
            $popup
            $links
          }
          var queued = false;
          var observer = new MutationObserver(function () {
            if (!queued) {
              queued = true;
              Promise.resolve().then(function () { queued = false; clean(); });
            }
          });
          clean();
          observer.observe(document.documentElement, {subtree:true,childList:true,attributes:true,attributeFilter:['class','style']});
        })();
    """.trimIndent()
    val literal = "\"" + script.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\""
    val cls = page.classDef
    check(cls.methods.none { it.name == name }) { "Duplicate $control sanitizer" }
    cls.methods.add(webMethod(name, "V", listOf("Landroid/webkit/WebView;"), 2, true, """
        const-string v0, $literal
        const/4 v1, 0x0
        invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
        return-void
    """.trimIndent()))
    // Original .locals=0: use a static helper so p0/p1/p2 all survive. The
    // existing title/weather callbacks continue after the super call.
    val method = page.method
    val superCalls = method.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_SUPER &&
            ((instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as?
                com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.name == "onPageFinished"
    }
    check(superCalls.size == 1) { "Expected original WebView onPageFinished super callback" }
    method.addInstructions(superCalls.single().index + 1, "invoke-static {p1}, $client->$name(Landroid/webkit/WebView;)V")
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installPremiumNavigationGuard() {
    val client = "$APP/views/webview/NativeAdsWebView\$c;"
    val page = exact(client, "shouldOverrideUrlLoading", "Z", "Landroid/webkit/WebView;", "Ljava/lang/String;")
    val name = "morpheBlockPremiumNavigation"
    check(page.classDef.methods.none { it.name == name }) { "Duplicate premium navigation guard" }
    val paths = listOf("/abonneren", "/abonneren/", "/bevestigen", "/bevestigen/").joinToString("\n") { path -> """
        const-string v1, "$path"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-nez v2, :blocked
    """.trimIndent() }
    page.classDef.methods.add(webMethod(name, "Z", listOf("Ljava/lang/String;"), 3, true, """
        invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v0
        invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :allowed
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "weerplaza.nl"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-nez v2, :ownHost
        const-string v1, ".weerplaza.nl"
        invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
        move-result v2
        if-eqz v2, :allowed
        :ownHost
        invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v0
        invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;
        move-result-object v0
        $paths
        :allowed
        const/4 v0, 0x0
        return v0
        :blocked
        const/4 v0, 0x1
        return v0
    """.trimIndent()))
    page.method.apply {
        addInstructionsWithLabels(0, """
            invoke-static {p2}, $client->$name(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :originalNavigation
            const/4 v0, 0x1
            return v0
        """.trimIndent(), ExternalLabel("originalNavigation", getInstruction(0)))
    }
}

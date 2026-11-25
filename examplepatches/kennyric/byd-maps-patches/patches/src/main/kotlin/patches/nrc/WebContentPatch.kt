package patches.nrc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private fun literal(value: String) = "\"" + value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\""

// Only publisher appview documents are changed. The account/privacy/payment
// routes and body nodes remain owned by the original application.
private fun script(name: String, css: String, action: String = "", articleOnly: Boolean = false): String = """
    (function(){
      function allowed(){
        if(!/^(www\.)?nrc\.nl$/i.test(location.hostname)||!/(^|\/)appview(\/|$)/.test(location.pathname))return false;
        var type=document.body.getAttribute('data-page-type')||'';
        if(!/^(article|frontpage|new-index|index|daily-overview|story|section|podcast-index|topics-overview|puzzle-overview|search-page)$/.test(type))return false;
        return !$articleOnly||type==='article';
      }
      if(!allowed())return;
      var key='__morpheNrc$name';if(window[key]){window[key]();return}
      var observer;
      function run(){
        if(observer)observer.disconnect();
        try{
          var style=document.getElementById('morphe-nrc-$name');
          if(!allowed()){if(style)style.remove();return}
          if(!style){style=document.createElement('style');style.id='morphe-nrc-$name';(document.head||document.documentElement).appendChild(style)}
          if(style.textContent!==${literal(css)})style.textContent=${literal(css)};
          $action
        }finally{if(observer)observer.observe(document.documentElement,{subtree:true,childList:true,attributes:true,attributeFilter:['class','style','data-banner-position','data-page-type']})}
      }
      window[key]=run;if(typeof MutationObserver==='function')observer=new MutationObserver(run);run();
    })();
""".trimIndent()

internal val webContent = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val cls = exact(WEB, "applyNRCSettings", "V", "Landroid/webkit/WebView;").classDef
        check(cls.methods.none { it.name.startsWith("morphe") }) { "NRC WebView helpers already present" }
        for (name in listOf("Ads", "Tracking", "Premium", "Full")) {
            cls.methods.add(helper(WEB, "morphe${name}Enabled", "Z", emptyList(), 1, FALSE))
        }
        val scripts = mapOf(
            "Ads" to script("Ads", "[data-banner-position],[data-native-ad-sticky-bar],[data-morphe-nrc-ad]{display:none!important}", """
                window.nmt=window.nmt||{};window.nmt.disable=window.nmt.disable||{};window.nmt.disable.ads=true;
                if(document.body.getAttribute('data-allow-ads')!=='0')document.body.setAttribute('data-allow-ads','0');
                document.querySelectorAll('[data-morphe-nrc-ad]').forEach(function(root){if(!root.matches('[data-banner-position]')&&!root.querySelector('[data-banner-position]'))root.removeAttribute('data-morphe-nrc-ad')});
                document.querySelectorAll('[data-banner-position]').forEach(function(slot){var root=slot.closest('.banner')||slot;if(!root.hasAttribute('data-morphe-nrc-ad'))root.setAttribute('data-morphe-nrc-ad','')});
            """.trimIndent()),
            "Tracking" to script("Tracking", "", """
                if(!document.body.hasAttribute('data-disable-trackers'))document.body.setAttribute('data-disable-trackers','');
                window.nmt=window.nmt||{};window.nmt.doLoadTrackers=false;window.nmt.loadTrackers=function(){};
            """.trimIndent()),
            "Premium" to script("Premium", "[data-paywall-topbanner],.paywall--topbanner-sticky{display:none!important}"),
            "Full" to script("Full", "[data-paywall],.paywall-overcontent-container,.paywall-belowcontent-container,[data-paywall-render-inline]{display:none!important}", """
                if(document.body.classList.contains('has-paywall'))document.body.classList.remove('has-paywall');
                if(document.documentElement.classList.contains('disable-overflow-fixed'))document.documentElement.classList.remove('disable-overflow-fixed');
            """.trimIndent(), articleOnly = true),
        )
        for ((name, js) in scripts) {
            cls.methods.add(helper(WEB, "morpheClean$name", "V", listOf("Landroid/webkit/WebView;"), 2, """
                const-string v0, ${literal(js)}
                const/4 v1, 0x0
                invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
                return-void
            """))
        }
        cls.methods.add(helper(WEB, "morpheApply", "V", listOf("Landroid/webkit/WebView;"), 1,
            listOf("Ads", "Tracking", "Premium", "Full").joinToString("\n") { name -> """
                invoke-static {}, $WEB->morphe${name}Enabled()Z
                move-result v0
                if-eqz v0, :after$name
                invoke-static {p0}, $WEB->morpheClean$name(Landroid/webkit/WebView;)V
                :after$name
            """.trimIndent() } + "\nreturn-void"))
        // android.net.Uri, Locale.US and String.matches are available below API23.
        cls.methods.add(helper(WEB, "morpheWebPolicy", "Z", listOf("Ljava/lang/String;"), 4, """
            if-eqz p0, :allow
            invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v0
            invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :allow
            const-string v2, "(?i)https?"
            invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v1
            if-eqz v1, :allow
            invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :allow
            sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;
            invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
            move-result-object v1
            invoke-static {}, $WEB->morpheAdsEnabled()Z
            move-result v2
            if-eqz v2, :tracking
            const-string v2, "content3.nrc.nl"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :tracking
            invoke-virtual {v0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;
            move-result-object v2
            const-string v3, "/script/ootag.v2.min.js"
            invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :block
            :tracking
            invoke-static {}, $WEB->morpheTrackingEnabled()Z
            move-result v2
            if-eqz v2, :allow
            const-string v2, "(static[.]chartbeat[.]com|ping[.]chartbeat[.]net|sb[.]scorecardresearch[.]com|ec114[.]nrc[.]nl|klik[.]nrc[.]nl|cdn[.]sophi[.]io|p[.]parsely[.]com)"
            invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v2
            if-eqz v2, :allow
            :block
            const/4 v0, 0x1
            return v0
            :allow
            const/4 v0, 0x0
            return v0
        """))
        cls.methods.add(helper(WEB, "morpheIntercept", RESPONSE, listOf(REQUEST, "Z"), 7, """
            invoke-interface {p0}, $REQUEST->isForMainFrame()Z
            move-result v0
            if-nez v0, :allow
            invoke-interface {p0}, $REQUEST->getUrl()Landroid/net/Uri;
            move-result-object v0
            if-eqz v0, :allow
            invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :allow
            const-string v2, "(?i)https?"
            invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v1
            if-eqz v1, :allow
            const/4 v3, 0x0
            if-eqz p1, :web
            invoke-static {}, $WEB->morpheFullEnabled()Z
            move-result v1
            if-eqz v1, :web
            invoke-interface {p0}, $REQUEST->getMethod()Ljava/lang/String;
            move-result-object v1
            const-string v2, "POST"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :web
            invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :web
            sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;
            invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
            move-result-object v1
            const-string v2, "(www[.])?nrc[.]nl"
            invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v1
            if-eqz v1, :web
            invoke-virtual {v0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;
            move-result-object v1
            const-string v2, "/paywall-api/api/zephr"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :web
            const/16 v3, 0x193
            goto :response
            :web
            invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-static {v0}, $WEB->morpheWebPolicy(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :allow
            const/16 v3, 0xc8
            :response
            new-instance v0, Landroid/webkit/WebResourceResponse;
            const-string v1, "text/plain"
            const-string v2, "UTF-8"
            const-string v4, "Disabled"
            invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
            move-result-object v5
            new-instance v6, Ljava/io/ByteArrayInputStream;
            const/4 p0, 0x0
            new-array p0, p0, [B
            invoke-direct {v6, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
            invoke-direct/range {v0 .. v6}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V
            return-object v0
            :allow
            const/4 v0, 0x0
            return-object v0
        """))
        exact(BASE, "onPageFinished", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;").method.addInstructions(0,
            "invoke-static {p1}, $WEB->morpheApply(Landroid/webkit/WebView;)V")
        val baseInterceptor = exact(BASE, "shouldInterceptRequest", RESPONSE, "Landroid/webkit/WebView;", REQUEST).method
        baseInterceptor.addInstructionsWithLabels(0, """
            const/4 v0, 0x0
            invoke-static {p2, v0}, $WEB->morpheIntercept($REQUEST${"Z"})$RESPONSE
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """.trimIndent(), ExternalLabel("original", baseInterceptor.getInstruction(0)))
        val article = exact(ARTICLE, "shouldInterceptRequest", RESPONSE, "Landroid/webkit/WebView;", REQUEST).method
        val calls = article.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == BASE && it.name == "shouldInterceptRequest" && it.parameterTypes == listOf("Landroid/webkit/WebView;", REQUEST) && it.returnType == RESPONSE
            } == true
        }
        check(calls.size == 1) { "Expected one NRC article superclass interceptor, found ${calls.size}" }
        // The existing font response is returned before this point.
        article.addInstructionsWithLabels(calls.single().index, """
            const/4 v0, 0x1
            invoke-static {p2, v0}, $WEB->morpheIntercept($REQUEST${"Z"})$RESPONSE
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """.trimIndent(), ExternalLabel("original", article.getInstruction(calls.single().index)))
    }
}

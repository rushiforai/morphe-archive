package patches.ftm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private fun helper(name: String, result: String, params: List<String>, locals: Int, code: String,
                   static: Boolean = true, parserGuard: Boolean = false): MutableMethod =
    MutableMethod(ImmutableMethod(CLIENT, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.size + if (static) 0 else 1, emptyList(), emptyList(), emptyList()))).apply {
        val source = code.trimIndent()
        addInstructions(0, source)
        if (parserGuard) {
            // InlineSmaliCompiler compiles instructions only; attach the real DEX catch table.
            fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
                .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
            val body = implementation!!
            body.addCatch("Ljava/lang/Exception;", body.newLabelForIndex(index(":try_start")),
                body.newLabelForIndex(index(":try_end")), body.newLabelForIndex(index(":parse_error")))
        }
    }

private fun flag(name: String, enabled: Boolean) = helper("morphe${name}Enabled", "Z", emptyList(), 1,
    "const/4 v0, ${if (enabled) "0x1" else "0x0"}\nreturn v0")

// Newly installed methods must be resolved from the mutable method list: the SDK
// fingerprint index was created from the original DEX and does not contain them.
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun enable(name: String) {
    val cls = exact(CLIENT, "onPageFinished", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;").classDef
    val matches = cls.methods.filter { it.name == "morphe${name}Enabled" && it.parameters.isEmpty() && it.returnType == "Z" }
    check(matches.size == 1) { "Expected one FTM $name flag, found ${matches.size}" }
    check(cls.methods.remove(matches.single()))
    cls.methods.add(flag(name, true))
}

private fun MutableClass.addCleanup(name: String, body: String) {
    val script = "(()=>{if(!['www.ftm.nl','www.ftm.eu'].includes(location.hostname.toLowerCase()))return;$body})()"
    val literal = "\"" + script.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\""
    methods.add(helper("morpheClean$name", "V", listOf("Landroid/webkit/WebView;"), 2, """
        const-string v0, $literal
        const/4 v1, 0x0
        invoke-virtual {p0, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
        return-void
    """))
}

// Classification is intentionally positive and local to the evidenced automatic
// roots. The publisher still owns account, form, consent and dismissal state.
private fun promotionCleanup(name: String, roots: String, classification: String, close: Boolean = false): String = """
    const key='__morpheFtm$name',marker='data-morphe-ftm-${name.lowercase()}';
    if(!document.getElementById('morphe-ftm-${name.lowercase()}')){
      const style=document.createElement('style');style.id='morphe-ftm-${name.lowercase()}';
      style.textContent='['+marker+']{display:none!important}';
      (document.head||document.documentElement).appendChild(style);
    }
    if(window[key]){window[key].run();return}
    function linked(root,host,path,prefix){
      if(typeof URL!=='function'||root.querySelector('form'))return false;
      return Array.from(root.querySelectorAll('a[href]')).some(a=>{
        try{const u=new URL(a.getAttribute('href'),location.href);
          return ['http:','https:'].includes(u.protocol)&&host.includes(u.hostname.toLowerCase())&&
            (prefix?u.pathname.startsWith(path):u.pathname===path);
        }catch(e){return false}
      });
    }
    const options={childList:true,subtree:true,attributes:true,attributeFilter:['class','href','data-template','style']};
    let observer;
    const displays=new WeakMap(),closed=new WeakSet();
    function positive(root){return $classification}
    function run(changed=new Set()){
      if(observer)observer.disconnect();
      try{
        document.querySelectorAll('$roots,['+marker+']').forEach(root=>{
          if(!positive(root)){root.removeAttribute(marker);displays.delete(root);closed.delete(root);return}
          root.setAttribute(marker,'');
        });
        if($close){
          const announcements=Array.from(document.querySelectorAll('.announcement-bar'));
          // Oe/qA targets every announcement and stores its first ID. A global
          // close is safe only when every target is positively commercial.
          const safe=announcements.length&&announcements.every(positive);
          if(!safe)announcements.forEach(root=>closed.delete(root));
          if(safe&&announcements.some(root=>!closed.has(root)||changed.has(root))){
            const button=announcements.map(root=>root.querySelector('button.close')).find(button=>button&&typeof button.click==='function');
            if(button){
              // Retain each root's own display beneath marker CSS so qA's global
              // .hide() does not suppress later service/form replacements.
              announcements.forEach(root=>{
                if(!displays.has(root))displays.set(root,[root.style.getPropertyValue('display'),root.style.getPropertyPriority('display')]);
              });
              try{button.click()}catch(e){}finally{
                announcements.forEach(root=>{
                  const [display,priority]=displays.get(root);
                  if(display)root.style.setProperty('display',display,priority);else root.style.removeProperty('display');
                  closed.add(root);
                });
              }
            }
          }
        }
      }finally{if(observer)observer.observe(document.documentElement,options)}
    }
    if(typeof MutationObserver==='function')observer=new MutationObserver(records=>run(new Set(
      records.filter(r=>r.type==='attributes'&&r.attributeName==='style').map(r=>r.target))));
    window[key]={run};run();
""".trimIndent()

internal val webContent = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val finished = exact(CLIENT, "onPageFinished", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;")
        // Eagerly pin the existing navigation/lifecycle contracts before mutation.
        exact(CLIENT, "shouldOverrideUrlLoading", "Z", "Landroid/webkit/WebView;", "Ljava/lang/String;")
        exact(CLIENT, "doUpdateVisitedHistory", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;", "Z")
        exact(CLIENT, "onPageStarted", "V", "Landroid/webkit/WebView;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;")
        val cls = finished.classDef
        check(cls.superclass == "Landroid/webkit/WebViewClient;") { "FTM client superclass changed" }
        check(cls.methods.none { it.name.startsWith("morphe") || it.name == "shouldInterceptRequest" ||
            (it.name == "shouldOverrideUrlLoading" && it.parameters.last().type == "Landroid/webkit/WebResourceRequest;") }) { "FTM client already modified" }
        listOf("Tracking", "ArticleDecision", "Consent", "Premium", "Ads").forEach { cls.methods.add(flag(it, false)) }
        val guestStarts = listOf("www.ftm.nl", "www.ftm.eu").mapIndexed { index, host -> """
            const-string v0, "https://$host/start/locale-switcher"
            invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :next_guest_$index
            const-string v0, "https://$host/start/splash"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :next_guest_$index
            const-string v0, "https://$host/skip-start"
            return-object v0
            :next_guest_$index
        """.trimIndent() }.joinToString("\n")
        cls.methods.add(helper("morpheGuestStartUrl", "Ljava/lang/String;", listOf("Ljava/lang/String;", "Ljava/lang/String;"), 2, """
            invoke-static {}, $CLIENT->morpheConsentEnabled()Z
            move-result v0
            if-eqz v0, :unchanged
            $guestStarts
            :unchanged
            const/4 v0, 0x0
            return-object v0
        """))
        // This callback runs before a link navigation loads its destination.
        // Retain the String callback's native locale/external routing unchanged.
        cls.methods.add(helper("shouldOverrideUrlLoading", "Z",
            listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"), 3, """
            if-eqz p1, :original
            if-eqz p2, :original
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z
            move-result v0
            if-eqz v0, :original
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;
            move-result-object v0
            const-string v1, "GET"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
            move-result-object v0
            if-eqz v0, :original
            invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;
            move-result-object v1
            invoke-static {v1, v0}, $CLIENT->morpheGuestStartUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :original
            invoke-virtual {p0, p1, v0}, $CLIENT->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
            move-result v1
            if-nez v1, :handled
            invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
            :handled
            const/4 v0, 0x1
            return v0
            :original
            invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
            move-result v0
            return v0
        """, static = false))
        val hosts = listOf("insight.ftm.nl", "eventor.ftm.nl", "glitchtip.ftm.nl", "diffuser-cdn.app-us1.com")
            .joinToString("\n") { host -> """
                const-string v1, "$host"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v2
                if-nez v2, :tracking
                const-string v1, ".$host"
                invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
                move-result v2
                if-nez v2, :tracking
            """.trimIndent() }
        cls.methods.add(helper("morpheWebPolicy", "I", listOf("Ljava/lang/String;"), 4, """
            if-eqz p0, :allowed
            :try_start
            invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v3
            invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :allowed
            sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
            invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
            move-result-object v0
            const-string v1, "http"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :scheme_ok
            const-string v1, "https"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :allowed
            :scheme_ok
            invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :allowed
            sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
            invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
            move-result-object v0
            invoke-static {}, $CLIENT->morpheTrackingEnabled()Z
            move-result v2
            if-eqz v2, :site
            $hosts
            :site
            const-string v1, "www.ftm.nl"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :site_ok
            const-string v1, "www.ftm.eu"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :allowed
            :site_ok
            invoke-virtual {v3}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :allowed
            invoke-static {}, $CLIENT->morpheTrackingEnabled()Z
            move-result v2
            if-eqz v2, :article
            const-string v1, "/activecampaign/event/create/view_comments/[0-9]+"
            invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v2
            if-nez v2, :tracking
            :article
            invoke-static {}, $CLIENT->morpheArticleDecisionEnabled()Z
            move-result v2
            if-eqz v2, :allowed
            const-string v1, "/abonnement/paywall/[0-9]+"
            invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v2
            if-eqz v2, :allowed
            const/4 v0, 0x2
            return v0
            :tracking
            const/4 v0, 0x1
            return v0
            :try_end
            :allowed
            const/4 v0, 0x0
            return v0
            :parse_error
            move-exception v0
            const/4 v0, 0x0
            return v0
        """, parserGuard = true))
        cls.methods.add(helper("morpheWebResponse", RESPONSE, listOf("Ljava/lang/String;"), 5, """
            invoke-static {p0}, $CLIENT->morpheWebPolicy(Ljava/lang/String;)I
            move-result v4
            if-eqz v4, :allowed
            new-instance v0, Ljava/io/ByteArrayInputStream;
            const/4 v1, 0x0
            new-array v1, v1, [B
            invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V
            const/4 v1, 0x1
            if-eq v4, v1, :tracking
            const-string v2, "text/html"
            goto :response
            :tracking
            const-string v2, "text/plain"
            :response
            new-instance v1, $RESPONSE
            const-string v3, "UTF-8"
            invoke-direct {v1, v2, v3, v0}, $RESPONSE-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
            return-object v1
            :allowed
            const/4 v0, 0x0
            return-object v0
        """))
        for (type in listOf("Ljava/lang/String;", "Landroid/webkit/WebResourceRequest;")) {
            val url = if (type == "Ljava/lang/String;") "move-object v0, p2" else """
                if-eqz p2, :original
                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :original
                invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v0
            """.trimIndent()
            cls.methods.add(helper("shouldInterceptRequest", RESPONSE, listOf("Landroid/webkit/WebView;", type), 1, """
                $url
                invoke-static {v0}, $CLIENT->morpheWebResponse(Ljava/lang/String;)$RESPONSE
                move-result-object v0
                if-eqz v0, :original
                return-object v0
                :original
                invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;$type)$RESPONSE
                move-result-object v0
                return-object v0
            """, static = false))
        }
        cls.addCleanup("Tracking", "try{['eventor_initialized','eventor_sessionId','eventor_userId','eventor_prev_at','eventor_prev_loggedIn'].forEach(k=>localStorage.removeItem(k))}catch(e){}")
        cls.addCleanup("Consent", """
            if(!document.getElementById('morphe-ftm-consent')){
              const s=document.createElement('style');s.id='morphe-ftm-consent';
              s.textContent='.cookie-consent{display:none!important}';document.head.appendChild(s);
            }
            // The edition picker precedes this server-rendered account offer.
            // Follow its own guest route, preserving native locale and sessions.
            if(location.protocol!=='https:'||location.pathname!=='/start/splash'||
              !document.body.matches('body.app-fish-layout.app-splash')||
              window.FTM?.user?.loggedIn!==false||window.__morpheFtmGuestSkip||typeof URL!=='function')return;
            const skip=document.querySelector('#main-content a.skip[href]');
            if(!skip)return;
            let next;try{next=new URL(skip.getAttribute('href'),location.href)}catch(e){return}
            if(next.origin!==location.origin||next.pathname!=='/skip-start'||
              next.username||next.password||next.search||next.hash)return;
            window.__morpheFtmGuestSkip=true;
            // Avoid retaining an automatically skipped offer in Back history.
            location.replace(next.href);
        """.trimIndent())
        cls.addCleanup("Ads", promotionCleanup("Ads", "aside.announcement-bar",
            "root.matches('aside.announcement-bar')&&root.getAttribute('data-template')==='default'&&linked(root,['winkel.ftm.nl'],'/products/',true)", close = true))
        cls.addCleanup("Premium", "if(!document.getElementById('morphe-ftm-trial-stickybar')){const s=document.createElement('style');s.id='morphe-ftm-trial-stickybar';s.textContent='.share-stickybar-outer{display:none!important}@layer morphe-ftm-cards{div.img-wrap > div.app-locked-overlay{display:none!important}}';document.head.appendChild(s)}" +
            promotionCleanup("Premium", "aside.trial-member-announcement,.part.trust-nugget-pp",
                "(root.matches('aside.trial-member-announcement.header-announcement,aside.trial-member-announcement.diapositive-announcement')&&linked(root,['www.ftm.nl','www.ftm.eu'],'/start/trial',false))||(root.matches('.part.trust-nugget-pp')&&linked(root,['www.ftm.nl','www.ftm.eu'],'/proefabonnement',false))"))
        val cleanup = listOf("Tracking", "Consent", "Premium", "Ads").joinToString("\n") { name -> """
            invoke-static {}, $CLIENT->morphe${name}Enabled()Z
            move-result v0
            if-eqz v0, :skip_$name
            invoke-static {p0}, $CLIENT->morpheClean$name(Landroid/webkit/WebView;)V
            :skip_$name
        """.trimIndent() }
        cls.methods.add(helper("morphePageFinished", "V", listOf("Landroid/webkit/WebView;"), 1, "$cleanup\nreturn-void"))
        finished.method.addInstructions(0, "invoke-static {p1}, $CLIENT->morphePageFinished(Landroid/webkit/WebView;)V")
    }
}

internal val articleDecision = bytecodePatch {
    dependsOn(originalInput, webContent)
    execute { enable("ArticleDecision") }
}

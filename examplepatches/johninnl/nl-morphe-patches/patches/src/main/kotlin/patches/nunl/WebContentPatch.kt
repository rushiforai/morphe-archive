package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel

private const val INLINE = "${APP}bff/presentation/views/webview/InlineWebView\$InlineWebViewClient;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private val webParameters = listOf("Landroid/webkit/WebView;","Ljava/lang/String;")

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installWebRequestPolicy(tracking: Boolean = false) {
    val anchor = exact(INLINE,"onPageFinished","V",*webParameters.toTypedArray())
    val cls = anchor.classDef
    val name = if (tracking) "morpheWebBlockedTracking" else "morpheWebBlockedAds"
    check(cls.methods.none { it.name == name }) { "Duplicate NU.nl request policy $name" }
    val hosts = if (tracking) listOf("applets.ebxcdn.com","sentry.io","googletagmanager.com","google-analytics.com",
        "dev.visualwebsiteoptimizer.com","jwpltx.com","scorecardresearch.com","bmtrcs.com") else
        listOf("advertising-module.api.dpgmedia.cloud","advertising-cdn.dpgmedia.cloud","doubleclick.net",
            "googlesyndication.com","googleadservices.com","adnxs.com","prebid-server.dpgmedia.net")
    val hostChecks = hosts.joinToString("\n") { host -> """
        const-string v1, "$host"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-nez v2, :blocked
        const-string v1, ".$host"
        invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
        move-result v2
        if-nez v2, :blocked
    """.trimIndent() }
    val pathChecks = if (!tracking) "" else """
        const-string v1, "pg.dpgmedia.net"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-eqz v2, :allowed
        invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v0
        invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;
        move-result-object v0
        const-string v1, "/api/metrics"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-nez v2, :blocked
    """.trimIndent()
    cls.methods.add(helper(INLINE,name,"Z",listOf("Ljava/lang/String;"),3,"""
        if-eqz p0, :allowed
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
    """))
    if (tracking) {
        // Reassemble the dispatcher: do not prepend to a synthesized method whose
        // compiled internal labels belong to its original instruction locations.
        val dispatcher = cls.methods.single { it.name == "morpheWebBlocked" }
        check(cls.methods.remove(dispatcher))
        cls.methods.add(helper(INLINE,"morpheWebBlocked","Z",listOf("Ljava/lang/String;"),1,"""
            invoke-static {p0}, $INLINE->morpheWebBlockedTracking(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :blocked
            invoke-static {p0}, $INLINE->morpheWebBlockedAds(Ljava/lang/String;)Z
            move-result v0
            return v0
            :blocked
            const/4 v0, 0x1
            return v0
        """))
        return
    }
    cls.methods.add(helper(INLINE,"morpheWebBlocked","Z",listOf("Ljava/lang/String;"),1,"""
        invoke-static {p0}, $INLINE->morpheWebBlockedAds(Ljava/lang/String;)Z
        move-result v0
        return v0
    """))
    cls.methods.add(helper(INLINE,"morpheWebResponse",RESPONSE,listOf("Ljava/lang/String;"),4,"""
        invoke-static {p0}, $INLINE->morpheWebBlocked(Ljava/lang/String;)Z
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
    val clients = listOf(INLINE,
        "${APP}ui/view/webview/WebViewComponentKt\$WebView\$1\$1\$1\$1\$1\$1;",
        "Lnet/persgroep/pipoidcsdk/service/OidcWebViewBuilder\$initLoginWebViewClient\$1;",
        "Lcom/mondriaan/dpns/client/android/DPNSInboxWebView\$1;",
        "Lcom/longtailvideo/jwplayer/h/d/c;")
    clients.forEach { client ->
        val jw = client == "Lcom/longtailvideo/jwplayer/h/d/c;"
        val target = if (jw) exact(client,"shouldInterceptRequest",RESPONSE,"Landroid/webkit/WebView;","Landroid/webkit/WebResourceRequest;").classDef
            else exact(client,"shouldOverrideUrlLoading","Z","Landroid/webkit/WebView;","Landroid/webkit/WebResourceRequest;").classDef
        check(target.methods.count { it.name == "shouldInterceptRequest" } == if (jw) 1 else 0) { "NU.nl WebView intercept layout changed: $client" }
        target.methods.add(helper(client,"shouldInterceptRequest",RESPONSE,webParameters,1,"""
            invoke-static {p2}, $INLINE->morpheWebResponse(Ljava/lang/String;)$RESPONSE
            move-result-object v0
            return-object v0
        """,static=false))
        val modernCode = """
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
            move-result-object v0
            invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-static {v0}, $INLINE->morpheWebResponse(Ljava/lang/String;)$RESPONSE
            move-result-object v0
        """.trimIndent()
        if (jw) {
            // Leave the original WebViewAssetLoader, JW helper, and super fallback in place.
            val method = target.methods.single { it.name == "shouldInterceptRequest" && it.parameterTypes.last() == "Landroid/webkit/WebResourceRequest;" }
            method.addInstructionsWithLabels(0,modernCode+"\nif-eqz v0, :original_asset_loader\nreturn-object v0",
                ExternalLabel("original_asset_loader",method.getInstruction(0)))
        } else {
            target.methods.add(helper(client,"shouldInterceptRequest",RESPONSE,listOf("Landroid/webkit/WebView;","Landroid/webkit/WebResourceRequest;"),1,
                modernCode+"\nreturn-object v0",static=false))
        }
    }
}

package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream

private const val CLIENT = "${APP}morphe/PrivacyWebViewClient;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private const val POLICY = "${APP}bff/presentation/views/webview/InlineWebView\$InlineWebViewClient;"

/** The SDK sets only WebChromeClient. Supply a plain client so manual privacy
 * preferences keep their consent/login bridges while metrics use the same policy. */
internal val privacyWebRequestExtension = bytecodePatch {
    dependsOn(originalInput)
    extendWith {
        val constructor = helper(CLIENT,"<init>","V",emptyList(),0,"""
            invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V
            return-void
        """,static=false).apply { accessFlags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value }
        val legacy = helper(CLIENT,"shouldInterceptRequest",RESPONSE,listOf("Landroid/webkit/WebView;","Ljava/lang/String;"),1,"""
            invoke-static {p2}, $POLICY->morpheWebResponse(Ljava/lang/String;)$RESPONSE
            move-result-object v0
            return-object v0
        """,static=false)
        val modern = helper(CLIENT,"shouldInterceptRequest",RESPONSE,listOf("Landroid/webkit/WebView;","Landroid/webkit/WebResourceRequest;"),1,"""
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
            move-result-object v0
            invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-static {v0}, $POLICY->morpheWebResponse(Ljava/lang/String;)$RESPONSE
            move-result-object v0
            return-object v0
        """,static=false)
        // Match current Chromium AwContentsClient.sendBrowsingIntent rather than
        // changing a formerly clientless WebView into an in-place link browser.
        val openExternal = helper(CLIENT,"morpheOpenExternal","Z",listOf("Landroid/webkit/WebView;","Ljava/lang/String;"),4,"""
            if-eqz p1, :allow
            const-string v0, "about:"
            invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :allow
            const-string v0, "chrome://"
            invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :allow
            const-string v0, "^file:///android_(asset|res)/.*"
            invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :allow
            :try_start
            const/4 v0, 0x1
            invoke-static {p1, v0}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;
            move-result-object v0
            invoke-virtual {v0}, Landroid/content/Intent;->getFlags()I
            move-result v1
            const v2, 0x3c083810
            and-int v1, v1, v2
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
            const-string v1, "android.intent.category.BROWSABLE"
            invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setSelector(Landroid/content/Intent;)V
            invoke-virtual {p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;
            move-result-object v1
            invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
            move-result-object v2
            const-string v3, "com.android.browser.application_id"
            invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
            move-object v2, v1
            :unwrap
            instance-of v3, v2, Landroid/app/Activity;
            if-nez v3, :launch
            instance-of v3, v2, Landroid/content/ContextWrapper;
            if-eqz v3, :allow
            check-cast v2, Landroid/content/ContextWrapper;
            invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
            move-result-object v3
            if-eq v2, v3, :allow
            move-object v2, v3
            goto :unwrap
            :launch
            invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
            :try_end
            const/4 v0, 0x1
            return v0
            :parse_error
            move-exception v0
            :allow
            const/4 v0, 0x0
            return v0
            .catch Ljava/lang/Exception; {:try_start .. :try_end} :parse_error
        """,catchParserErrors=true)
        val navigate = helper(CLIENT,"shouldOverrideUrlLoading","Z",listOf("Landroid/webkit/WebView;","Landroid/webkit/WebResourceRequest;"),1,"""
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z
            move-result v0
            if-eqz v0, :allow
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->hasGesture()Z
            move-result v0
            if-nez v0, :external
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isRedirect()Z
            move-result v0
            if-nez v0, :external
            const/4 v0, 0x1
            return v0
            :external
            invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
            move-result-object v0
            invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-static {p1, v0}, $CLIENT->morpheOpenExternal(Landroid/webkit/WebView;Ljava/lang/String;)Z
            move-result v0
            return v0
            :allow
            const/4 v0, 0x0
            return v0
        """,static=false)
        // SDK32+ uses the metadata-aware overload. Retain the old string API's
        // clientless intent dispatch for direct/legacy calls, without loadUrl.
        val navigateLegacy = helper(CLIENT,"shouldOverrideUrlLoading","Z",listOf("Landroid/webkit/WebView;","Ljava/lang/String;"),1,"""
            invoke-static {p1, p2}, $CLIENT->morpheOpenExternal(Landroid/webkit/WebView;Ljava/lang/String;)Z
            move-result v0
            return v0
        """,static=false)
        val cls = ImmutableClassDef(CLIENT,AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            "Landroid/webkit/WebViewClient;",emptyList(),"MorphePrivacyWebViewClient",emptySet(),emptyList(),listOf(constructor,legacy,modern,openExternal,navigate,navigateLegacy))
        val store = MemoryDataStore()
        DexPool.writeTo(store,ImmutableDexFile(Opcodes.forApi(32),listOf(cls)))
        ByteArrayInputStream(store.data)
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installPrivacyWebClient() {
    exact(CLIENT,"<init>").method // Extension must have merged before the factory is changed.
    val factory = exact("Lbe/dpgmedia/privacy/privacygatesdk/ui/WebViewFactory;","createWebView","Landroid/webkit/WebView;",
        "Landroid/content/Context;","Ljava/lang/String;","Ljava/lang/String;","Z","Ljava/lang/String;","Ljava/lang/Boolean;",
        "Ljava/lang/String;","Ljava/lang/String;","Lkotlin/jvm/functions/Function0;","Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function2;","Lkotlin/jvm/functions/Function0;").method
    val anchors = factory.instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroid/webkit/WebView;" && ref.name == "setWebChromeClient"
    }
    check(anchors.size == 1) { "NU.nl PrivacyGate WebView factory changed" }
    factory.addInstructions(anchors.single().index+1,"""
        new-instance p1, $CLIENT
        invoke-direct {p1}, $CLIENT-><init>()V
        invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V
    """.trimIndent())
}

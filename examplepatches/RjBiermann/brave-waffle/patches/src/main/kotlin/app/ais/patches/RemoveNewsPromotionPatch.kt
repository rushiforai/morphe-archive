package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder
import com.android.tools.smali.smali.smaliFlexLexer
import com.android.tools.smali.smali.smaliParser
import com.android.tools.smali.smali.smaliTreeWalker
import org.antlr.runtime.CommonTokenStream
import org.antlr.runtime.tree.CommonTreeNodeStream
import java.io.ByteArrayInputStream
import java.io.InputStreamReader

/**
 * The startup news page (a WebView) shows a third-party "Porn Site
 * Promotion" banner (accordion item with an ad iframe). The page is loaded
 * with the shared WebViewClient `ce0`; its default `onPageFinished` branch
 * (used by the news WebView) simply calls super.
 *
 * Two JS snippets are injected after every page load, both pref-gated:
 *
 * 1. In `onPageStarted` (fires BEFORE first paint): arms a MutationObserver on
 *    document.body that removes any accordion item whose header mentions the
 *    promotion the moment it is inserted into the DOM — the banner is never
 *    painted, so there is no visible flash. A CSS net (`#headingPromotion`,
 *    `#collapsePromotion`, `.divtopad`, `.brazzers_video`, plus a `:has()` rule
 *    for Chromium 105+ WebView) is appended immediately so anything matching
 *    hides at parse time. If the document is still loading, arming waits for
 *    DOMContentLoaded — and strips immediately on arm, since content parsed
 *    before arm-time fires no mutation events.
 *
 * 2. In `onPageFinished` (belt-and-braces, verified): removes any leftover
 *    matching item in case the observer path failed (e.g. body armed late);
 *    a no-op when the observer already stripped it.
 *
 * HOWEVER — both JS paths still race the parser: the banner is SERVER HTML and
 * Chromium paints small streamed pages during parse, so on some devices the
 * banner still flashes briefly. The deterministic fix is intercepting the page
 * BEFORE the WebView parses it: a new `shouldInterceptRequest` override (the
 * stock `ce0` has none) fetches the news page itself, cuts the promo accordion
 * item out of the HTML and serves the rewritten body. On failure (offline,
 * markup drift) it returns null → WebView fetches normally and the JS paths
 * handle it post-load. The whole method body is wrapped in try/catch — an
 * uncaught exception on the WebView worker thread would crash the app. It is
 * assembled via the smali assembler because `addInstructionsWithLabels` cannot
 * attach exception handlers to injected blocks (the inline compiler extracts
 * bare instructions only).
 *
 * Harmless on other WebViews sharing this client: interception only applies to
 * URLs containing "/news/"; other requests pass through untouched.
 *
 * Runtime-gated by the pref `morphe_remove_news_promo` (default true). The
 * pref read clobbers p2 (the URL — dead in the default branch after the super
 * call) because the method only has v0/v1 free. No settings row is added
 * for it; flipping it requires writing the pref, so the patch flag remains
 * the off switch for users who never touch settings.
 */
private const val STRIP_PROMOTION_JS =
    "(function(){var b=document.querySelectorAll('.accordion-item');" +
        "for(var i=0;i<b.length;i++){var h=b[i].querySelector('.accordion-header');" +
        "if(h&&/Porn Site Promotion/i.test(h.textContent)){b[i].parentNode.removeChild(b[i]);}}" +
        "var s=document.createElement('style');s.textContent='.paysiteAd{display:none!important}';" +
        "document.head.appendChild(s);})();"

/** Early-hide variant for onPageStarted: runs before first paint, so it must
 *  not assume the DOM exists. Watches body and strips matching accordion
 *  items at insert time (before paint — no flash); CSS net (incl. the actual
 *  ad classes .divtopad/.brazzers_video seen in the news page markup —
 *  .paysiteAd exists only as a leftover from older banner versions) goes
 *  straight on documentElement since head may not be built yet. Arms at
 *  DOMContentLoaded when the document is still loading — and strips
 *  immediately on arm, since content parsed before arm-time fires no
 *  mutation events. */
private const val PREHIDE_PROMOTION_JS =
    "(function(){function g(){" +
        "for(var b=document.querySelectorAll('.accordion-item'),i=0;i<b.length;i++){" +
        "var h=b[i].querySelector('.accordion-header');" +
        "if(h&&/Porn Site Promotion/i.test(h.textContent)){b[i].parentNode.removeChild(b[i]);}}}" +
        "var s=document.createElement('style');" +
        "s.textContent='#headingPromotion,#collapsePromotion,.paysiteAd,.divtopad,.brazzers_video{display:none!important}' +" +
        "'.accordion-item:has(#headingPromotion){display:none!important}';" +
        "(document.head||document.documentElement).appendChild(s);" +
        "var m=new MutationObserver(g);" +
        "var a=function(){g();if(document.body){m.observe(document.body,{childList:true,subtree:true});}};" +
        "if(document.readyState==='loading'){document.addEventListener('DOMContentLoaded',a);}else{a();}})();"

/** Full smali class whose single method is added to `Lce0;` as the
 *  shouldInterceptRequest override. Cuts the promo accordion item (located via
 *  its `headingPromotion` id anchor, spanning back to the previous
 *  `<div class="accordion-item">` and forward to the next) out of the served
 *  HTML. Returns null for every other URL and on any failure — null means the
 *  WebView fetches the resource itself. The Firefox UA matches the one the
 *  app sets on the WebView so the server serves identical markup.
 *  Assembled with the real smali assembler because injected instruction
 *  blocks cannot carry try/catch (inline compiler drops handlers). */
private const val INTERCEPT_SMALI = """
    .class public Lce0;
    .super Landroid/webkit/WebViewClient;

    .method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
        .locals 9

        :try_start_0
        const-string v0, "/news/"
        invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-eqz v0, :ret_null

        const-string v0, "morphe_remove_news_promo"
        sget-object v1, Lka1;->j:Landroid/content/SharedPreferences;
        const/4 v2, 0x1
        invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        if-eqz v0, :ret_null

        new-instance v0, Ljava/net/URL;
        invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
        invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
        move-result-object v0
        check-cast v0, Ljava/net/HttpURLConnection;
        const/16 v1, 0x2710
        invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setConnectTimeout(I)V
        invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setReadTimeout(I)V
        const-string v1, "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0"
        const-string v2, "User-Agent"
        invoke-virtual {v0, v2, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "Accept-Encoding"
        const-string v3, "identity"
        invoke-virtual {v0, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
        invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
        move-result-object v1

        new-instance v2, Ljava/io/ByteArrayOutputStream;
        invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
        const/16 v3, 0x2000
        new-array v3, v3, [B

        :loop
        invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I
        move-result v4
        if-lez v4, :read_done
        const/4 v5, 0x0
        invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
        goto :loop

        :read_done
        invoke-virtual {v1}, Ljava/io/InputStream;->close()V
        invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
        invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;
        move-result-object v1

        const-string v3, "headingPromotion"
        invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
        move-result v4
        if-ltz v4, :ret_null

        const-string v3, "<div class=\"accordion-item\">"
        invoke-virtual {v1, v3, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I
        move-result v5
        if-ltz v5, :ret_null
        invoke-virtual {v1, v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
        move-result v6
        if-ltz v6, :ret_null

        new-instance v7, Ljava/lang/StringBuilder;
        invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V
        const/4 v8, 0x0
        invoke-virtual {v1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;
        move-result-object v8
        invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
        invoke-virtual {v1}, Ljava/lang/String;->length()I
        move-result v8
        invoke-virtual {v1, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;
        move-result-object v8
        invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
        invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
        move-result-object v1

        new-instance v2, Landroid/webkit/WebResourceResponse;
        const-string v3, "text/html"
        const-string v4, "utf-8"
        invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B
        move-result-object v5
        new-instance v6, Ljava/io/ByteArrayInputStream;
        invoke-direct {v6, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V
        invoke-direct {v2, v3, v4, v6}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
        return-object v2

        :ret_null
        const/4 v2, 0x0
        return-object v2

        :try_end_0
        .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

        :catch_0
        move-exception v0
        const/4 v2, 0x0
        return-object v2
    .end method
"""

object NewsWebClientFingerprint : Fingerprint(
    definingClass = "Lce0;",
    name = "onPageFinished",
    returnType = "V"
)

object NewsWebClientStartFingerprint : Fingerprint(
    definingClass = "Lce0;",
    name = "onPageStarted",
    returnType = "V"
)

/** Assemble INTERCEPT_SMALI with the real smali assembler and return the
 *  shouldInterceptRequest method (with its try/catch intact). Same assembly
 *  trick the patcher's InlineSmaliCompiler uses, but keeping the whole
 *  ClassDef instead of extracting bare instructions. */
private fun assembleInterceptMethod(): com.android.tools.smali.dexlib2.iface.Method {
    val dexBuilder = DexBuilder(Opcodes.getDefault())
    val tokens = CommonTokenStream(
        smaliFlexLexer(
            InputStreamReader(ByteArrayInputStream(INTERCEPT_SMALI.toByteArray()), Charsets.UTF_8),
            15
        )
    )
    val parser = smaliParser(tokens)
    val tree = parser.smali_file()
    if (parser.numberOfSyntaxErrors > 0) error("intercept smali: ${parser.numberOfSyntaxErrors} syntax errors")
    val nodes = CommonTreeNodeStream(tree.tree)
    nodes.tokenStream = tokens
    val walker = smaliTreeWalker(nodes)
    walker.setDexBuilder(dexBuilder)
    return walker.smali_file().methods.first()
}

@Suppress("unused")
val removeNewsPromotionPatch = bytecodePatch(
    name = "Remove news promotions",
    description = "Removes the third-party paysite promotion banner from the startup news page.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        // Shared injection helper: gate on the pref, then run `js` on the
        // WebView (p1). Injected right after the first invoke-super — the
        // default (non-switch) branch, where p2 (URL) is dead afterwards and
        // doubles as the default=true register (method only has v0/v1).
        fun injectGatedJs(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, js: String) {
            val impl = method.implementation!!
            val superIndex = impl.instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Landroid/webkit/WebViewClient;"
            }
            method.addInstructionsWithLabels(
                superIndex + 1,
                """
                    const-string v0, "morphe_remove_news_promo"
                    sget-object v1, Lka1;->j:Landroid/content/SharedPreferences;
                    const/4 p2, 0x1
                    invoke-interface {v1, v0, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                    move-result v0
                    if-eqz v0, :cond_morphe_news_skip
                    const-string v0, "$js"
                    const/4 v1, 0x0
                    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
                    :cond_morphe_news_skip
                nop
                """.trimIndent()
            )
        }

        // Pre-paint path: arm the observer in onPageStarted so the banner is
        // hidden before the WebView ever paints it (no flash).
        injectGatedJs(NewsWebClientStartFingerprint.method, PREHIDE_PROMOTION_JS)

        // Post-load path: proven onPageFinished strip, kept as the fallback
        // until the early path is verified on the emulator.
        injectGatedJs(NewsWebClientFingerprint.method, STRIP_PROMOTION_JS)

        // Deterministic path: serve the news page with the promo accordion
        // item already cut out of the HTML, before the WebView ever parses it
        // — no paint race, zero flash on every WebView version.
        val interceptMethod = assembleInterceptMethod()
        mutableClassDefByOrNull("Lce0;")!!.virtualMethods.add(MutableMethod(interceptMethod))
    }
}

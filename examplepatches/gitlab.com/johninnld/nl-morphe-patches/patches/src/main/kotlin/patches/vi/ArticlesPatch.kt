package patches.vi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val SENDER = "Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt;"

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun articleRequestPolicy() {
    val owner = exact(SENDER, "executeCall(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lio/ktor/client/plugins/Sender;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;").classDef
    check(owner.methods.none { it.name == "morpheArticleRequest" })
    val params = listOf("Lio/ktor/client/request/HttpRequestBuilder;", "Z")
    val method = MutableMethod(ImmutableMethod(SENDER, "morpheArticleRequest",
        params.map { ImmutableMethodParameter(it, emptySet(), null) }, "Z", 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    method.addInstructions(0, """
        if-nez p1, :allow
        invoke-virtual {p0}, Lio/ktor/client/request/HttpRequestBuilder;->getMethod()Lio/ktor/http/HttpMethod;
        move-result-object v0
        invoke-virtual {v0}, Lio/ktor/http/HttpMethod;->getValue()Ljava/lang/String;
        move-result-object v1
        const-string v2, "GET"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :deny
        invoke-virtual {p0}, Lio/ktor/client/request/HttpRequestBuilder;->getUrl()Lio/ktor/http/URLBuilder;
        move-result-object v0
        invoke-virtual {v0}, Lio/ktor/http/URLBuilder;->getProtocol()Lio/ktor/http/URLProtocol;
        move-result-object v1
        invoke-virtual {v1}, Lio/ktor/http/URLProtocol;->getName()Ljava/lang/String;
        move-result-object v1
        const-string v2, "https"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :deny
        invoke-virtual {v0}, Lio/ktor/http/URLBuilder;->getHost()Ljava/lang/String;
        move-result-object v1
        const-string v2, "pb-api.vi.nl"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :deny
        invoke-virtual {v0}, Lio/ktor/http/URLBuilder;->getPort()I
        move-result v1
        if-eqz v1, :port_ok
        const/16 v2, 0x1bb
        if-ne v1, v2, :deny
        :port_ok
        invoke-static {v0}, Lio/ktor/http/URLBuilderKt;->getEncodedPath(Lio/ktor/http/URLBuilder;)Ljava/lang/String;
        move-result-object v1
        const-string v2, "/domain/200/news/(?:[0-9]+|path)"
        invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :deny
        invoke-virtual {v0}, Lio/ktor/http/URLBuilder;->getParameters()Lio/ktor/http/ParametersBuilder;
        move-result-object v0
        const-string v1, "scope"
        invoke-interface {v0, v1}, Lio/ktor/util/StringValuesBuilder;->getAll(Ljava/lang/String;)Ljava/util/List;
        move-result-object v0
        if-eqz v0, :deny
        invoke-interface {v0}, Ljava/util/List;->size()I
        move-result v1
        const/4 v2, 0x1
        if-ne v1, v2, :deny
        const/4 v1, 0x0
        invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;
        move-result-object v1
        const-string v2, "premium"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :deny
        invoke-static {}, Lnl/vi/common/data/AppUtilitiesKt;->getAuthentication()Lnl/vi/core/authentication/Authentication;
        move-result-object v0
        invoke-virtual {v0}, Lnl/vi/core/authentication/Authentication;->isPro()Z
        move-result v0
        if-nez v0, :deny
        # Mark only requests extended by this patch. Native IAP takes :allow
        # directly, retaining its original redirect behavior. AttributeKey has
        # name equality; Ktor copies attributes alongside headers on redirects.
        invoke-virtual {p0}, Lio/ktor/client/request/HttpRequestBuilder;->getAttributes()Lio/ktor/util/Attributes;
        move-result-object v0
        new-instance v1, Lio/ktor/util/AttributeKey;
        const-string v2, "morphe.vi.articleHeader"
        invoke-direct {v1, v2}, Lio/ktor/util/AttributeKey;-><init>(Ljava/lang/String;)V
        sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
        invoke-interface {v0, v1, v2}, Lio/ktor/util/Attributes;->put(Lio/ktor/util/AttributeKey;Ljava/lang/Object;)V
        :allow
        const/4 v0, 0x1
        return v0
        :deny
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    owner.methods.add(method)
    check(owner.methods.none { it.name == "morpheArticleRedirect" })
    val redirect = MutableMethod(ImmutableMethod(SENDER, "morpheArticleRedirect",
        listOf(ImmutableMethodParameter(params.first(), emptySet(), null)), "V", 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
    redirect.addInstructions(0, """
        invoke-virtual {p0}, Lio/ktor/client/request/HttpRequestBuilder;->getAttributes()Lio/ktor/util/Attributes;
        move-result-object v0
        new-instance v1, Lio/ktor/util/AttributeKey;
        const-string v2, "morphe.vi.articleHeader"
        invoke-direct {v1, v2}, Lio/ktor/util/AttributeKey;-><init>(Ljava/lang/String;)V
        invoke-interface {v0, v1}, Lio/ktor/util/Attributes;->contains(Lio/ktor/util/AttributeKey;)Z
        move-result v0
        if-eqz v0, :done
        const/4 v1, 0x0
        invoke-static {p0, v1}, $SENDER->morpheArticleRequest(Lio/ktor/client/request/HttpRequestBuilder;Z)Z
        move-result v0
        if-nez v0, :done
        invoke-static {}, Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/moduleReference/ModuleReferenceKt;->getInAppSubscription()Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscription;
        move-result-object v0
        invoke-interface {v0}, Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscription;->getInAppSubscriptionHeaderKey()Ljava/lang/String;
        move-result-object v1
        invoke-virtual {p0}, Lio/ktor/client/request/HttpRequestBuilder;->getHeaders()Lio/ktor/http/HeadersBuilder;
        move-result-object v0
        invoke-virtual {v0, v1}, Lio/ktor/http/HeadersBuilder;->remove(Ljava/lang/String;)V
        :done
        return-void
    """.trimIndent())
    owner.methods.add(redirect)
}

@Suppress("unused")
val readFullArticles = bytecodePatch(
    name = "Read full articles",
    description = "Requests complete article bodies through the shipped app API and removes locked Pro overlays. Preserves actual account and subscription state; media availability remains controlled by the publisher.",
) {
    dependsOn(originalInput)
    compatibleWith(vi)
    execute {
        articleRequestPolicy()
        applyOwnedEdits(articleTargets)
    }
}

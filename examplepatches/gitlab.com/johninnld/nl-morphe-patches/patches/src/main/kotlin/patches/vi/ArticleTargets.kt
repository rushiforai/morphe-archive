package patches.vi

import com.android.tools.smali.dexlib2.Opcode

internal val articleTargets = listOf(
    OwnedMethod("Lio/ktor/client/plugins/HttpRedirect${'$'}Plugin;", "handleCall(Lio/ktor/client/plugins/Sender;Lio/ktor/client/request/HttpRequestBuilder;Lio/ktor/client/call/HttpClientCall;ZLio/ktor/client/HttpClient;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 18, 24, 238, listOf(
        OwnedEdit(208, listOf(), listOf(), listOf("invoke-static {v12}, Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt;->morpheArticleRedirect(Lio/ktor/client/request/HttpRequestBuilder;)V")),
    )),
    OwnedMethod("Lnl/vi/feature/articleDetail/data/articleDetailDataSource/ArticleDetailDataSourceImp;", "getArticleDetail(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", 1, 13, 28, listOf(
        OwnedEdit(13, listOf(Opcode.CONST_4), listOf(null), listOf("sget-object p0, Lorg/openapitools/client/models/Scope;->PREMIUM:Lorg/openapitools/client/models/Scope;")),
    )),
    OwnedMethod("Lnl/vi/feature/articleDetail/data/articleDetailDataSource/ArticleDetailDataSourceImp;", "getArticleDetail(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 1, 13, 28, listOf(
        OwnedEdit(13, listOf(Opcode.CONST_4), listOf(null), listOf("sget-object p0, Lorg/openapitools/client/models/Scope;->PREMIUM:Lorg/openapitools/client/models/Scope;")),
    )),
    OwnedMethod("Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt;", "executeCall(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lio/ktor/client/plugins/Sender;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 25, 9, 93, listOf(
        OwnedEdit(58, listOf(), listOf(), listOf("invoke-static {p0, p3}, Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt;->morpheArticleRequest(Lio/ktor/client/request/HttpRequestBuilder;Z)Z", "move-result p3")),
    )),
    OwnedMethod("Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscriptionImpl;", "generateInAppSubscriptionAuthValue()Ljava/lang/String;", 1, 5, 33, listOf(
        OwnedEdit(0, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_WIDE_16, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_WIDE), listOf("Lj$/time/LocalDateTime;->now()Lj$/time/LocalDateTime;", null, null, "Lj$/time/LocalDateTime;->minusMinutes(J)Lj$/time/LocalDateTime;", null, null, "Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V", "Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/LocalDateTimeExtensionsKt;->asEpochSeconds(Lj$/time/LocalDateTime;)J", null), listOf("invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;", "move-result-object v0", "const-wide/16 v1, 0x78", "invoke-virtual {v0, v1, v2}, Ljava/time/Instant;->minusSeconds(J)Ljava/time/Instant;", "move-result-object v0", "invoke-virtual {v0}, Ljava/time/Instant;->getEpochSecond()J", "move-result-wide v0", "nop", "nop")),
        OwnedEdit(24, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscriptionImpl;->logEvent(Ljava/lang/String;)V"), listOf("nop")),
    )),
    OwnedMethod("Lnl/vi/feature/articleDetail/ui/components/paywall/PaywallComponentKt;", "NativeArticlePaywallComponent(Lnl/vi/feature/articleDetail/data/PaywallBlockItem;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V", 25, 104, 1567, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lnl/vi/feature/articleDetail/ui/components/videoFeed/items/NativeArticleVideoFeedCarouselItemKt;", "NativeArticleVideoFeedCarouselItem(ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V", 25, 32, 452, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/16 p0, 0x1")),
    )),
    OwnedMethod("Lnl/vi/feature/articleDetail/ui/viewmodels/NativeArticleViewModel;", "checkForReloading()V", 18, 3, 58, listOf(
        OwnedEdit(48, listOf(Opcode.IF_NEZ), listOf(null), listOf("nop"), target = 56, branch = 0),
    )),
)

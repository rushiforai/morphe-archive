"""Original VI5.13.52 article-flow contracts. No credentials/body text stored."""

BASE_SHA256 = "01d3bcbe0551da17e04c697ca0e7a6965cc07db4a55b510d334a730572d64974"
ARTICLE_CONTRACTS = [
    ('Lnl/vi/feature/articleDetail/data/articleDetailDataSource/ArticleDetailDataSourceImp;', 'getArticleDetail(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;', 1, 10, 28, '19c67c6fa228858b5fa403e4e7bdf0b31179c35644798eedcdf38ec73fded4e3'),
    ('Lnl/vi/feature/articleDetail/data/articleDetailDataSource/ArticleDetailDataSourceImp;', 'getArticleDetail(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', 1, 10, 28, '9d424e21b4e66776aed0dde97ccc64cedf913c29e60c7b42ca7f8431a248724e'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt;', 'executeCall(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lio/ktor/client/plugins/Sender;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', 25, 5, 93, 'f5fd91423cb4eb3b1f141e96562c843570d57e9edb16ac4f281df61d32df79f3'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscriptionImpl;', 'generateInAppSubscriptionAuthValue()Ljava/lang/String;', 1, 4, 33, 'acc4809594865c5f08cb4ca786b536b9c0c19eadf67785d9eb7bc52daa01206d'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscriptionImpl;', '<clinit>()V', 65544, 1, 6, 'b0f68fd5c579f1f67c7e7824e67f8130a61236a80f65f796843436439fc73497'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/inAppSubscription/InAppSubscriptionImpl;', '<init>()V', 65538, 0, 2, 'f9996055bdcf0648c4fc6e72ff50457abdc11e10b20bc16336675e7b0c64efb5'),
    ('Lnl/vi/core/authentication/Authentication;', 'isPro()Z', 17, 0, 2, 'ff917bcf2cd723e981cdc5dace29b6c1e6b1a121d9fa5b75bb16e5255ad3eb0e'),
    ('Lnl/vi/feature/articleDetail/ui/components/paywall/PaywallComponentKt;', 'NativeArticlePaywallComponent(Lnl/vi/feature/articleDetail/data/PaywallBlockItem;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V', 25, 100, 1567, '16e0449290e4f2d6ac0d309623754fb89a3c016466374420e238b630392a7db2'),
    ('Lnl/vi/feature/articleDetail/ui/components/videoFeed/items/NativeArticleVideoFeedCarouselItemKt;', 'NativeArticleVideoFeedCarouselItem(ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V', 25, 27, 452, 'd9d35370b31805f623bb86a2b6ffdbccd605cf78d190c6031b7b6de44a3f6bfd'),
    ('Lnl/vi/feature/articleDetail/ui/viewmodels/NativeArticleViewModel;', 'checkForReloading()V', 18, 2, 58, 'e5179b98bf9db719081f1001bcf4b63d814d2c3fc0098c2036037eab6314b7c2'),
    ('Lnl/vi/feature/articleDetail/data/NativeArticleViewState;', 'getContents()Ljava/util/List;', 17, 0, 2, '7dbf3157d1284f647ead0edb9dde519329834b3ca67aec16378d7edc5ebe4582'),
    ('Lnl/vi/feature/articleDetail/data/NativeArticleViewState;', 'isPro()Z', 17, 0, 2, '314d9206567dd54d692a2a50685479f3bf7aa8713afb21d3e317d324f7b462d6'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt$executeCall$1;', '<init>(Lkotlin/coroutines/Continuation;)V', 65536, 0, 2, 'f8ff83a6b057bd07ca40c007de561cb6431908c7b835ac0b89719a7f56d7dec8'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt$executeCall$1;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 17, 1, 10, 'a3fc69ffd57625d4781b1f4b0e6c7d87e66e69fedebb2bfa9f71e9bc73ad3061'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/common/security/cryptoGraphicHashing/CryptoGraphicHashing$Companion;', 'generateHMacSha256(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;', 17, 2, 31, '19adca9584009b3756b251ec5cf4305a15f0c7f845caf3e18e14f370431dc585'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/HeadersBuilderExtensionsKt;', 'appendAuthHeader(Lio/ktor/http/HeadersBuilder;Ljava/lang/String;)V', 25, 4, 36, '9a8c46ea262317a5ab10975fda8a9985477bbb4cc1de8f4b0da531e62ec4c8f6'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/LocalDateTimeExtensionsKt;', 'asEpochSeconds(Lj$/time/LocalDateTime;)J', 25, 2, 7, '007e64aa8fd65cb123595a07f63d20cef3de3b984c2d9f966d27520898be4c3b'),
    ('Lcom/pxr/pxropenapigenerator/ktorSupertokens/extensions/KtorHttpRequestBuilderExtensionsKt;', 'appendRequiredHeaders(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', 25, 4, 66, 'ed03c641d59cbc7fd4b140e6668ae6733c916f55d169a9a039d3d1deeedaa099'),
    ('Lnl/vi/feature/articleDetail/ui/viewmodels/NativeArticleViewModel$nativeArticleViewState$1;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 17, 1, 12, '9df81c53bb4b074696727ddae962990fb49db42d31a785d6c27175c8b8a5122d'),
    ('Lnl/vi/feature/articleDetail/ui/viewmodels/NativeArticleViewModel;', 'loadNewsArticle()V', 17, 7, 14, '9d27fb6d4b694ba9cbd2dc28e699ad7e6a325c95e647148ad3b77cfed575a357'),
    ('Lorg/openapitools/client/apis/NewsApi;', 'getByIDNewsByDomainID(IILorg/openapitools/client/models/Scope;Lorg/openapitools/client/models/ExperimentGroupOrRobots;Ljava/lang/String;Ljava/lang/Boolean;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', 1, 0, 3, '70daec8a5d7a79845f0b27b2e51f635a9acd4ac0e5e938c91993c331d516a6bc'),
    ('Lorg/openapitools/client/apis/NewsApi;', 'getByPathNewsByDomainID(ILjava/lang/String;Lorg/openapitools/client/models/Scope;Lorg/openapitools/client/models/ExperimentGroupOrRobots;Ljava/lang/String;Ljava/lang/Boolean;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', 1, 0, 3, '0e5c648656140fd1d0ba83272f776f3df2847b00ce89a5df39d7565cd49566ea'),
]

# Native redirect/copy/attribute semantics retained by the article guard.
ARTICLE_CONTRACTS += [
    ('Lio/ktor/client/plugins/HttpRedirect$Plugin;', 'handleCall(Lio/ktor/client/plugins/Sender;Lio/ktor/client/request/HttpRequestBuilder;Lio/ktor/client/call/HttpClientCall;ZLio/ktor/client/HttpClient;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', 18, 17, 238, '2e9e8eb6c5630d6f74dd47830c8dad369847a5c5f60e0a18c0679becca7c0b47'),
    ('Lio/ktor/client/request/HttpRequestBuilder;', 'takeFrom(Lio/ktor/client/request/HttpRequestBuilder;)Lio/ktor/client/request/HttpRequestBuilder;', 17, 2, 27, '9cd110d98b260e63f5701b08e27722735e115d688f982baeed0a6bf533757b01'),
    ('Lio/ktor/client/request/HttpRequestBuilder;', 'takeFromWithExecutionContext(Lio/ktor/client/request/HttpRequestBuilder;)Lio/ktor/client/request/HttpRequestBuilder;', 17, 1, 7, '64e5ce1c67d2618750b37e5b05104bded7f076e78bd3351eaf4036b234ff40e6'),
    ('Lio/ktor/util/AttributeKey;', '<init>(Ljava/lang/String;)V', 65537, 1, 13, '74bee19df3153b956b5aa729a2f51e0c77ab885e63d30d4067a19d24b51a73d5'),
    ('Lio/ktor/util/AttributeKey;', 'equals(Ljava/lang/Object;)Z', 1, 4, 20, '6d68cae438ab168f3b64da0ab51dcf2e568b4f63faeae92fa90d43c89f2016ae'),
    ('Lio/ktor/util/AttributeKey;', 'hashCode()I', 1, 0, 4, '01f97d0a3e9179da71059f5d4089c9111b78cec253a9bbc8c6190d0f90682b11'),
]

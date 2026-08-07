.class public Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;
.super Ll/pr2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pr2<",
        "Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;",
        "Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;",
        ">;"
    }
.end annotation


# instance fields
.field public feedCommonService:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/feed_common_service/service"
        required = true
    .end annotation
.end field

.field public feedService:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/feed_service/service"
        required = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;->d()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;->e()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;->feedCommonService:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;->feedService:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    return-object p0
.end method

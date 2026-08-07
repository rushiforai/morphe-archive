.class public Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;
.super Ll/pr2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pr2<",
        "Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;",
        "Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;",
        ">;"
    }
.end annotation


# instance fields
.field public liveCommonService:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/live_common_service/service"
        required = true
    .end annotation
.end field

.field public liveService:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/live_service/service"
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;->d()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;->e()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;->liveCommonService:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;->liveService:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    return-object p0
.end method

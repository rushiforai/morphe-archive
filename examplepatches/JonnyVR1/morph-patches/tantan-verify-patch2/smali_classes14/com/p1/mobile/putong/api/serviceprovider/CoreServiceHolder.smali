.class public Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;
.super Ll/pr2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pr2<",
        "Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;",
        "Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;",
        ">;"
    }
.end annotation


# instance fields
.field public coreCommonService:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_common_service/service"
        required = true
    .end annotation
.end field

.field public coreService:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;
    .annotation build Lcom/tantanapp/android/injecter/facade/annotation/Autowired;
        name = "/core_service/service"
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;->d()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;->e()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;->coreCommonService:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;->coreService:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    return-object p0
.end method
